package com.mycompany.hotelmanage.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "booking_detail")
public class BookingDetailEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "bookingId")
    private BookingEntity bookingEnt;

    @ManyToOne
    @JoinColumn(name = "roomId")
    private RoomEntity roomEnti;

    public BookingDetailEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BookingEntity getBookingEnt() {
        return bookingEnt;
    }

    public void setBookingEnt(BookingEntity bookingEnt) {
        this.bookingEnt = bookingEnt;
    }

    public RoomEntity getRoomEnti() {
        return roomEnti;
    }

    public void setRoomEnti(RoomEntity roomEnti) {
        this.roomEnti = roomEnti;
    }

}
