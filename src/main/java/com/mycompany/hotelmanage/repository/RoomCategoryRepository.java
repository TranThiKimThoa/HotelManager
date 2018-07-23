
package com.mycompany.hotelmanage.repository;


import com.mycompany.hotelmanage.entity.RoomCategoryEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomCategoryRepository extends CrudRepository<RoomCategoryEntity, Integer> {
    
}
