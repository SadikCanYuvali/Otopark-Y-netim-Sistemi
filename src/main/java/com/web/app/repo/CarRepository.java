package com.web.app.repo;

import com.web.app.entity.Car;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CarRepository  extends CrudRepository<Car, String> {
    @Override
    Car save(Car entity);

    @Override
    Optional<Car> findById(String id);

    @Override
    void deleteById(String id);

    @Override
    void delete(Car entity);

    @Override
    Iterable<Car> findAll();

    @Query(value = "SELECT * FROM Car c WHERE c.Licence_Plate = :licencePlate", nativeQuery = true)
    List<Car> getCarById(@Param("licencePlate") String licencePlate);
}
