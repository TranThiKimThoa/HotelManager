package com.mycompany.hotelmanage.repository;

import com.mycompany.hotelmanage.entity.CustomerEntity;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends CrudRepository<CustomerEntity, Integer> {

    public CustomerEntity findByIdentityCard(String searchText);

    @Query(value = "Select * from Customer where identityCard = ?", nativeQuery = true)
    public List<CustomerEntity> findByIdNativeQuery(String searchText);
}
