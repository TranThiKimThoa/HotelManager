
package com.mycompany.hotelmanage.repository;

import com.mycompany.hotelmanage.entity.BookingDetailEntity;
import com.mycompany.hotelmanage.entity.BookingEntity;
import com.mycompany.hotelmanage.entity.UserEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingDetailRepository extends CrudRepository<BookingDetailEntity, Integer>{
    
    @Query(value = "Select * from booking_detail where bookingId = ?",nativeQuery = true)
    public List<BookingDetailEntity> findBookingDetailNativeQuery(int id);

}
