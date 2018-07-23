package com.mycompany.hotelmanage.service;

import com.mycompany.hotelmanage.entity.BookingDetailEntity;
import com.mycompany.hotelmanage.entity.RoomEntity;
import com.mycompany.hotelmanage.repository.BookingDetailRepository;
import com.mycompany.hotelmanage.repository.RoomRepository;
import com.mycompany.hotelmanage.repository.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingDetailService {

    @Autowired
    private BookingDetailRepository bookingDetailRepository;

    @Autowired
    private RoomRepository roomRepository;

    public List<BookingDetailEntity> getListBooking(int id) {
        return bookingDetailRepository.findBookingDetailNativeQuery(id);
    }

//    public BookingDetailEntity getInformation(int id) {
//        BookingDetailEntity booDe = bookingDetailRepository.findOne(id);
//        return booDe;
//    }

//    public BookingDetailEntity addBooking(BookingDetailEntity bookingdetail) {
//        BookingDetailEntity bkd = new BookingDetailEntity();
//
//        bkd = bookingDetailRepository.save(bookingdetail);
//        if (bkd.getId() > 0) {
//            if (bkd.getRoomEnti() != null) {
//                RoomEntity room = roomRepository.findOne(bkd.getRoomEnti().getId());
//                room.setStatus("Booked");
//                roomRepository.save(room);
//            } else {
//                RoomEntity room = new RoomEntity();
//                room.setStatus("Booked");
//                roomRepository.save(bkd.getRoomEnti());
//            }
//        }
//        return bkd;
//    }

    public BookingDetailEntity saveBooking(BookingDetailEntity bookingdetail) {
        return bookingDetailRepository.save(bookingdetail);
    }

}
