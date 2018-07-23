
package com.mycompany.hotelmanage.service;

import com.mycompany.hotelmanage.entity.RoomCategoryEntity;
import com.mycompany.hotelmanage.repository.RoomCategoryRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomCategoryService {
    
    @Autowired
    private RoomCategoryRepository roomCategoryRepository;
    
    public List<RoomCategoryEntity> getCategoryRoom() {
        List<RoomCategoryEntity> list = (List<RoomCategoryEntity>) roomCategoryRepository.findAll();
        
        return list;
    }
    
}
