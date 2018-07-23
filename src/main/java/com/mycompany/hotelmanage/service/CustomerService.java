package com.mycompany.hotelmanage.service;

import com.mycompany.hotelmanage.entity.BookingEntity;
import com.mycompany.hotelmanage.entity.CustomerEntity;
import com.mycompany.hotelmanage.enums.BookingStatus;
import com.mycompany.hotelmanage.repository.BookingRepository;
import com.mycompany.hotelmanage.repository.CustomerRepository;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private BookingRepository bookingRepository;

    public List<CustomerEntity> getListCustomer() {
        List<CustomerEntity> lst = (List<CustomerEntity>) customerRepository.findAll();

        return lst;
    }

    public CustomerEntity findByIDCard(String idCard) {
        CustomerEntity ce = customerRepository.findByIdentityCard(idCard);
        if (ce != null && ce.getId() > 0) {
            return ce;
        } else {
            return new CustomerEntity();
        }
    }
    
    public List<CustomerEntity> findIdentityCard(String searchText) {
        return customerRepository.findByIdNativeQuery(searchText);
    }

    public CustomerEntity addNewCustomer(CustomerEntity customer) {
        CustomerEntity c = new CustomerEntity();
        c = customerRepository.save(customer);
        return c;
    }
}
