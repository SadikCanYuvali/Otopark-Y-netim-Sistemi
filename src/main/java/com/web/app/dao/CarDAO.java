package com.web.app.dao;
import com.web.app.entity.Car;
import com.web.app.repo.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository
public class CarDAO {
    @Autowired
    private CarRepository carRepository;

    public List<Car> getCarList() {
        List<Car> carList = new ArrayList<>();

        carRepository.findAll().forEach(carList::add);
        return carList;
    }

    public void saveCar(Car car) {
        carRepository.save(car);
    }

    public void deleteCarById(String licencePlate) {
        carRepository.deleteById(licencePlate);
    }

    public List<Car> getCarById(String licencePlate) {
        List<Car> cars = carRepository.getCarById(licencePlate);
        if (cars.size() != 0) {
            return cars;
        }
        return new ArrayList<>();
    }
}
