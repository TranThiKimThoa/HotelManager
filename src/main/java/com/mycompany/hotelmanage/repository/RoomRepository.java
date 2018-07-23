package com.mycompany.hotelmanage.repository;

import com.mycompany.hotelmanage.entity.RoomEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends CrudRepository<RoomEntity, Integer> {

    @Query(value = "select * from room join booking_detail on room.id = booking_detail.roomId where booking_detail.id = ? ", nativeQuery = true)
    public RoomEntity findRoomNativeQuery(int id);

    public List<RoomEntity> findRoomByStatus(String status);

}
