
package com.mycompany.hotelmanage.service;

import com.mycompany.hotelmanage.entity.BookingEntity;
import com.mycompany.hotelmanage.repository.BookingRepository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    public List<BookingEntity> getLstBooking() {
        return (List<BookingEntity>) bookingRepository.findAll();
    }

    public BookingEntity saveBookingRooms(BookingEntity b) {
        return bookingRepository.save(b);
    }
    
    public List<BookingEntity> getListBookings(int id) {
        return bookingRepository.findBookingNativeQuery(id);
    }
    
    public BookingEntity updateStatusBooking(int id) {
        BookingEntity bk = bookingRepository.findOne(id);
        bk.setStatus("Checkin");
        bookingRepository.save(bk);
        return bk;
    }
    
     public BookingEntity updateBooking(int id) {
        BookingEntity bk = bookingRepository.findOne(id);
        bk.setStatus("Checkout");
        bookingRepository.save(bk);
        return bk;
    }
     
      public BookingEntity getInformation(int id) {
        BookingEntity booDe = bookingRepository.findOne(id);
        return booDe;
    }
    
    public void deleteIdBooking(int id) {
        bookingRepository.delete(id);
    }
    
    public boolean cancelBooking(int id) {
        this.deleteIdBooking(id);
        return bookingRepository.exists(id);
    }
    
    public int numberPeople(Date fromDay,Date toDay) {
        int bb = bookingRepository.findBookingNativeQuery1(fromDay, toDay);
        return bb;
    }
    
    public int numberOfRoom(Date fromDay, Date toDay) {
        int ro = bookingRepository.findBookingNativeQuery2(fromDay, toDay);
        return ro;
    }

    public List<String> roomInfB(Date fromDay, Date toDay) {
        List<String> list = bookingRepository.findBookingNativeQuery3(fromDay, toDay);
        return list;
    }
    
    public double total(Date fromDay, Date toDay) {
        double total = bookingRepository.findBookingNativeQuery4(fromDay, toDay);
        return total;
    }
}
