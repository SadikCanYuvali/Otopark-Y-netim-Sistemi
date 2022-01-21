package com.web.app.repo;

import com.web.app.entity.Ticket;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

public interface TicketRepository extends CrudRepository<Ticket, String> {
    @Override
    Ticket save(Ticket ticket);

    @Override
    Optional<Ticket> findById(String id);

    @Override
    void deleteById(String id);

    @Override
    void delete(Ticket entity);

    @Override
    Iterable<Ticket> findAll();

    @Query(value = "SELECT * FROM Ticket t WHERE t.Licence_Plate = :licencePlate", nativeQuery = true)
    List<Ticket> getTicketById(@Param("licencePlate") String licencePlate);


    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE Ticket t SET t.Leave_Time = :leaveTime, t.Duration_Time = :durationTime, t.Fee = :fee WHERE t.Licence_Plate = :licencePlate", nativeQuery = true)
    void updateTicket(@Param("licencePlate") String licencePlate, @Param("leaveTime") String leaveTime, @Param("durationTime") String durationTime, @Param("fee") String fee);
}
