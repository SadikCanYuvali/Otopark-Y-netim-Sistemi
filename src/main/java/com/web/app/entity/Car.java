package com.web.app.entity;



import javax.persistence.*;

@Entity // veri tabanında ki tablon ile eşleştireceğin class
public class Car {
    @Id
    @Column(name = "Licence_Plate")
    private String licencePlate;

    @Column
    private String brand;

    @Column
    private String color;

    @Column(name = "Parking_Lot")
    private int parkingLot;

    @Column
    private String section;

    @Column(name = "Section_Number")
    private String sectionNumber;

    public String getLicencePlate() {
        return licencePlate;
    }

    public void setLicencePlate(String licencePlate) {
        this.licencePlate = licencePlate;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getParkingLot() {
        return parkingLot;
    }

    public void setParkingLot(int parkingLot) {
        this.parkingLot = parkingLot;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getSectionNumber() {
        return sectionNumber;
    }

    public void setSectionNumber(String sectionNumber) {
        this.sectionNumber = sectionNumber;
    }
}
