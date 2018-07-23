
package com.mycompany.hotelmanage.repository;

import com.mycompany.hotelmanage.entity.BookingEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends CrudRepository<BookingEntity, Integer> {
    @Query(value = "Select * from booking where customerId = ?",nativeQuery = true)
    public List<BookingEntity> findBookingNativeQuery(int id);
    
    @Query(value = "select COUNT(c.id) \n" +
" from customer c join booking b on c.id = b.customerId  where "
            + "dateCheckin >= ?1 AND"
            + " dateCheckout <= ?2",nativeQuery = true)
    public int findBookingNativeQuery1(Date fromDay,Date toDay);
    
    @Query(value = "select COUNT(DISTINCT bk.roomId) "
            + "from  booking b  join booking_detail bk on "
            + "bk.bookingId = b.id  where dateCheckin >= ?1 "
            + "AND dateCheckout <= ?2 ",nativeQuery = true)
    public int findBookingNativeQuery2(Date fromDay, Date toDay);
    
    @Query(value = "select COUNT(roomId) , rc.categoryRoomName "
            + "from booking_detail bk join booking b on bk.bookingId = b.id "
            + "join room r on bk.roomId = r.id join room_category rc "
            + "on r.roomCategoryId = rc.id where dateCheckin >= ?1 "
            + "AND dateCheckout <= ?2 GROUP by roomId", nativeQuery = true)
    public List<String> findBookingNativeQuery3(Date fromDay, Date toDay);
    
    @Query(value = "select SUM(b.totalPrice) from customer c join booking b "
            + "on c.id = b.customerId where dateCheckin >= ?1 "
            + "AND dateCheckout <= ?2 AND b.status = 'Checkout'", nativeQuery = true)
    public double findBookingNativeQuery4(Date fromDay, Date toDay);
}
