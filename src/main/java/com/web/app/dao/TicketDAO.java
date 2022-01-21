package com.web.app.dao;

import com.web.app.entity.Ticket;
import com.web.app.repo.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TicketDAO {

    @Autowired
    private TicketRepository ticketRepository;

    public void saveTicket(Ticket ticket) {
        ticketRepository.save(ticket);
    }

    public List<Ticket> getTicketById(String licencePlate) {
        List<Ticket> tickets = ticketRepository.getTicketById(licencePlate);
        if (tickets.size() > 0) {
            return tickets;
        }
        return new ArrayList<>();
    }

    public void updateTicket(Ticket ticket) {
        String licencePlate = ticket.getLicencePlate();
        String leaveTime = ticket.getLeaveTime();
        String durationTime = ticket.getDurationTime();
        String fee = ticket.getFee();

        ticketRepository.updateTicket(licencePlate, leaveTime, durationTime, fee);
    }
}
