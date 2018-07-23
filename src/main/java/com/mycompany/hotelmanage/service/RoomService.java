package com.mycompany.hotelmanage.service;

import com.mycompany.hotelmanage.entity.RoomEntity;
import com.mycompany.hotelmanage.repository.RoomRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomService {

    @Autowired
    private RoomRepository roomRepository;

    public RoomEntity getRoomByIDBooking(int id) {
        RoomEntity room = roomRepository.findRoomNativeQuery(id);
        room.setStatus("Empty");
        roomRepository.save(room);
        return room;
    }

    public List<RoomEntity> getRoom() {
        List<RoomEntity> list = (List<RoomEntity>) roomRepository.findAll();
        return list;
    }

    public RoomEntity addNewRoom(RoomEntity room) {
        RoomEntity r = new RoomEntity();
        room.setStatus("Empty");
        r = roomRepository.save(room);

        return r;
    }

    public RoomEntity getRoomById(int id) {
        return roomRepository.findOne(id);
    }

    public void deleteRoomById(int id) {
        roomRepository.delete(id);
    }

    public boolean deleteRoom(int id) {
        this.deleteRoomById(id);
        return roomRepository.exists(id);
    }

    public List<RoomEntity> findStatus() {
        return roomRepository.findRoomByStatus("Empty");
    }
    
    public List<RoomEntity> findAllRooms() {
        return (List<RoomEntity>) roomRepository.findAll();
    }

}
