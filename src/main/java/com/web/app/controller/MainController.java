package com.web.app.controller;

import com.web.app.dao.CarDAO;
import com.web.app.dao.TicketDAO;
import com.web.app.entity.Car;
import com.web.app.entity.Ticket;
import com.web.app.util.Auth;
import com.web.app.util.User;
import com.web.app.util.UserInformation;
import com.web.app.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private CarDAO carDAO;

    @Autowired
    private TicketDAO ticketDAO;

    @GetMapping("/home")
    public String home(Locale locale, Model model) {
        System.out.println("Home Page Requested, locale = " + locale);
        return "main-page";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpServletRequest request, HttpServletResponse response) {
        if (request.getSession().getAttribute("userRole") != null) {
            if (request.getSession().getAttribute("userRole").equals("SUPER_USER")) {
                return "admin";
            } else {
                if (request.getSession().getAttribute("userRole").equals("REGULAR_USER")) {
                    return "user";
                } else {
                    return "main-page";
                }
            }
        } else {
            return "main-page";
        }
    }

    @RequestMapping(value = "/auth", consumes = "application/json", produces = "application/json", method = RequestMethod.POST)
    public void auth(@RequestBody UserInformation user, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User usr = Auth.credentialCheck(user.getUserName(), user.getPassword());
        if (usr != null) {
            // Browser üzerinden gelen her isteğe oturum ile cevap verilir. Bir kullanıcının
            // sıralı yaptığı istekler aynı oturum olarak korunur.
            HttpSession session = request.getSession();
            model.addAttribute("userName", user.getUserName());
            if (usr.equals(User.get("admin"))) {
                String uuid = Util.createToken(32, false);
                // Sunucu tarafında belirli bir süre boyunca oturum açan kullanıcının
                // bazı bilgileri (Örn: Kullanıcıya özel sayfa göstermek için Rol, Kullanıcı Adı)
                // cookie yöntemi ile depolanır. Sunucu tarafında browser üzerinden gelen isteğe
                // cookie ile cevap verilir.
                Cookie cookie = new Cookie("admin-token", uuid);
                cookie.setPath("/");
                Cookie cookieExpire = new Cookie("admin-token-expire", Long.toString(System.currentTimeMillis() + 60 * 1000 * 60));
                cookieExpire.setPath("/");
                session.setAttribute("userName", user.getUserName());
                session.setAttribute("userRole", "SUPER_USER");
                response.addCookie(cookie);
                response.addCookie(cookieExpire);
            } else {
                String uuid = Util.createToken(32, true);
                Cookie cookie = new Cookie("user-token", uuid);
                cookie.setPath("/");
                Cookie cookieExpire = new Cookie("admin-token-expire", Long.toString(System.currentTimeMillis() + 60 * 1000 * 15));
                cookieExpire.setPath("/");
                session.setAttribute("userName", user.getUserName());
                session.setAttribute("userRole", "REGULAR_USER");
                response.addCookie(cookie);
                response.addCookie(cookieExpire);
            }
        } else {
            throw new RuntimeException("Username or password might be wrong");
        }
    }

    @RequestMapping(value = "/logout", consumes = "application/json", produces = "application/json", method = RequestMethod.POST)
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute("userName"); // session kapanır
        session.removeAttribute("userRole");
        return "main-page";
    }

    @RequestMapping(value = "/insertCar", consumes = "application/json", produces = "application/json", method = RequestMethod.POST)
    public void insertCar(@RequestBody Car car, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("application/json");
        PrintWriter printWriter = new PrintWriter(response.getOutputStream());
        try {
            List<Car> carList = carDAO.getCarById(car.getLicencePlate());
            if (carList.size() == 0) {
                car.setParkingLot(1);
                carDAO.saveCar(car);
                Ticket ticket;
                String lastFee = null;
                List<Ticket> tickets = ticketDAO.getTicketById(car.getLicencePlate());
                if (tickets.size() > 0) {
                    ticket = tickets.get(0);
                    lastFee = ticket.getFee();
                    ticket = new Ticket();
                } else {
                    ticket = new Ticket();
                }
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String currentDate = df.format(new Date());
                ticket.setLicencePlate(car.getLicencePlate());
                ticket.setEntryTime(currentDate);
                if (lastFee != null) {
                    ticket.setFee(lastFee);
                }
                ticketDAO.saveTicket(ticket);
                printWriter.println("{\"success\": \"true\"}");
                printWriter.close();
            } else {
                printWriter.println("{\"success\": \"false\"}");
                printWriter.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            printWriter.println("{\"success\": \"false\"}");
            printWriter.close();
        }

    }

    @RequestMapping(value = "/removeCar", consumes = "application/json", produces = "application/json", method = RequestMethod.POST)
    public void removeCar(@RequestBody String licencePlate, Model model, HttpServletRequest request, HttpServletResponse response) throws ParseException {
        carDAO.deleteCarById(licencePlate);
        List<Ticket> ticketList = ticketDAO.getTicketById(licencePlate);
        Ticket ticket = ticketList.get(0);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String ticketEntryTime = ticket.getEntryTime();
        BigDecimal pastFee = ticket.getFee() != null ? BigDecimal.valueOf(Double.parseDouble(ticket.getFee())) : BigDecimal.ZERO;
        String ticketCloseTime = df.format(new Date());
        Date start = df.parse(ticketEntryTime);
        Date end = df.parse(ticketCloseTime);

        long duration  = end.getTime() - start.getTime();
        long diffInMinutes = TimeUnit.MILLISECONDS.toMinutes(duration);

        ticket.setLeaveTime(ticketCloseTime);
        ticket.setDurationTime(Long.toString(diffInMinutes));
        BigDecimal fee = pastFee.add(BigDecimal.valueOf(diffInMinutes).multiply(BigDecimal.valueOf(1.5)));
        ticket.setFee(String.valueOf(fee));

        ticketDAO.updateTicket(ticket);
    }

    @RequestMapping(value = "/searchTicketByLicencePlate", consumes = "application/json", produces = "application/json", method = RequestMethod.POST)
    public void searchTicketByLicencePlate(@RequestBody String licencePlate, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        PrintWriter printWriter = new PrintWriter(response.getOutputStream());
        List<Ticket> ticketList = ticketDAO.getTicketById(licencePlate);
        BigDecimal totalFee = BigDecimal.ZERO;
        for (Ticket ticket : ticketList) {
            totalFee = totalFee.add(BigDecimal.valueOf(Double.parseDouble(ticket.getFee())));
        }
        String fee = String.valueOf(totalFee);
        printWriter.println("{\"success\": \"true\", \"data\": \"" + fee + "\"}");
        printWriter.close();
    }

}