package com.mycompany.hotelmanage.controller;

import com.mycompany.hotelmanage.entity.BookingDetailEntity;
import com.mycompany.hotelmanage.entity.BookingEntity;
import com.mycompany.hotelmanage.entity.CustomerEntity;
import com.mycompany.hotelmanage.entity.RoomCategoryEntity;
import com.mycompany.hotelmanage.entity.RoomEntity;
import com.mycompany.hotelmanage.entity.UserEntity;
import com.mycompany.hotelmanage.enums.Gender;
import com.mycompany.hotelmanage.repository.RoomRepository;
import com.mycompany.hotelmanage.service.BookingDetailService;
import com.mycompany.hotelmanage.service.BookingService;
import com.mycompany.hotelmanage.service.CustomerService;
import com.mycompany.hotelmanage.service.RoomCategoryService;
import com.mycompany.hotelmanage.service.RoomService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/management/employee")
public class EmployeeController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomCategoryService roomCategoryService;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = {"/home"}, method = RequestMethod.GET)
    public String userPage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            model.addAttribute("name", userEntity.getName());
            model.addAttribute("address", userEntity.getAddress());
            model.addAttribute("email", userEntity.getEmail());
        }

        return "employee";
    }

    @RequestMapping(value = "/room", method = RequestMethod.GET)
    public String showRoom(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            model.addAttribute("email", userEntity.getName());
        }
        model.addAttribute("list", roomService.getRoom());
        return "room";
    }

    @ModelAttribute("categories")
    private List<RoomCategoryEntity> categories() {
        return roomCategoryService.getCategoryRoom();
    }

    @RequestMapping("/add-room")
    public String pageAddRoom(Model model) {
        model.addAttribute("room", new RoomEntity());
        model.addAttribute("action", "addRoom");
        return "pageaddroom";
    }

    @RequestMapping("/addRoom")
    public String addRoom(Model model, @ModelAttribute(value = "room") RoomEntity room,
            @ModelAttribute(value = "roomNumber") int roomNumber,
            @ModelAttribute(value = "price") double price) {
        String message = "";
        if (roomNumber < 0 || price < 0) {
            message = "Please enter a number greater than 0";
        } else {
            RoomEntity r = roomService.addNewRoom(room);
            if (r.getId() > 0) {
                return "redirect:/management/employee/room";
            } else {
                model.addAttribute("message", "Add new room fail");
                model.addAttribute("action", "addRoom");
                return "pageaddroom";
            }
        }
        model.addAttribute("message", message);
        return "pageaddroom";
    }

    @RequestMapping("/edit-room/{id}")
    public String editRoom(Model model, @PathVariable(value = "id") int id) {
        RoomEntity room = roomService.getRoomById(id);
        if (room != null && room.getId() > 0) {
            model.addAttribute("action", "editRoom");
            model.addAttribute("room", room);
        } else {
            model.addAttribute("message", "Not found room with id = " + id);
            model.addAttribute("room", new RoomEntity());
            model.addAttribute("action", "addRoom");
        }
        return "pageeditroom";
    }

    @RequestMapping("/editRoom")
    public String actionEditRoom(Model model, @ModelAttribute(value = "room") RoomEntity room) {
        RoomEntity r = roomService.addNewRoom(room);
        if (r.getId() > 0) {
            return "redirect:/management/employee/room";
        } else {
            model.addAttribute("message", "Edit room fail");
            model.addAttribute("action", "editRoom");
            return "pageeditroom";
        }
    }

    @RequestMapping("/delete-room/{id}")
    public String deleteRoom(Model model, @PathVariable(value = "id") int id) {
        boolean isExits = roomService.deleteRoom(id);
        if (isExits) {
            model.addAttribute("message", "delete fail");
        } else {
            model.addAttribute("message", "delete success");
        }
        model.addAttribute("list", roomService.getRoom());
        return "room";
    }

    @RequestMapping(value = {"/report"}, method = RequestMethod.GET)
    public String report(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            model.addAttribute("email", userEntity.getName());

        }
        return "report";
    }

    @RequestMapping(value = {"/search-report"}, method = RequestMethod.POST)
    public String searchReport(Model model, @ModelAttribute(value = "fromday") String fromDay,
            @ModelAttribute(value = "today") String toDay) {
        String message = "";
        if (fromDay != null && !fromDay.isEmpty() && toDay != null && !toDay.isEmpty()) {
            SimpleDateFormat sc = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date fromDayD = sc.parse(fromDay);
                Date toDayD = sc.parse(toDay);
                if (fromDayD.compareTo(toDayD) >= 0) {
                    message = "To date must be greater than from date.";
                } else {
                    int bb = bookingService.numberPeople(fromDayD, toDayD);
                    int ro = bookingService.numberOfRoom(fromDayD, toDayD);
                    List<String> listRoom = bookingService.roomInfB(fromDayD, toDayD);
                    double total = bookingService.total(fromDayD, toDayD);

                    model.addAttribute("from", fromDay);
                    model.addAttribute("to", toDay);
                    model.addAttribute("list", bb);
                    model.addAttribute("ro", ro);
                    model.addAttribute("listRo", listRoom);
                    model.addAttribute("total", total);

                    return "report";
                }
            } catch (ParseException ex) {
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            message = "Date aren't empty.";
        }
        model.addAttribute("message", message);
        return "report";
    }

    @RequestMapping(value = {"/bookingshow"}, method = RequestMethod.GET)
    public String showList(Model model) {

        model.addAttribute("list", customerService.getListCustomer());

        return "booking";
    }

    @RequestMapping("/search")
    public String searchIDCard(Model model, @ModelAttribute(value = "searchText") String searchText) {

        model.addAttribute("list", customerService.findIdentityCard(searchText));

        return "booking";
    }

    @RequestMapping("/states/{id}")
    public String showListBookingById(Model model, @PathVariable(value = "id") int id) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            model.addAttribute("email", userEntity.getName());
        }
        List<BookingEntity> booking = bookingService.getListBookings(id);

        model.addAttribute("list", booking);

        return "states";
    }

    @RequestMapping("/statesinf/{id}")
    public String showListBookingDetailById(Model model, @PathVariable(value = "id") int id) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            model.addAttribute("email", userEntity.getName());
        }
        List<BookingDetailEntity> bkde = bookingDetailService.getListBooking(id);
        model.addAttribute("list", bkde);

        return "statesinf";
    }

    @RequestMapping("/cancelbooking/{id}")
    public String cancelBooked(Model model, @PathVariable(value = "id") int id) {

        boolean isExits = bookingService.cancelBooking(id);
        if (isExits) {
            model.addAttribute("message", "Cancel booking fail");
        } else {
            model.addAttribute("message", "Cancel booking success");
        }
        List<BookingEntity> booking = bookingService.getListBookings(id);

        model.addAttribute("list", booking);

        return "states";
    }

    @RequestMapping("/checkinbutton/{id}")
    public String checkinButton(Model model, @PathVariable(value = "id") int id) {

        BookingEntity booking_detail = bookingService.updateStatusBooking(id);
        List<BookingEntity> booking = bookingService.getListBookings(id);

        model.addAttribute("list", booking);
        return "states";
    }

    @RequestMapping("/checkoutbutton/{id}")
    public String checkoutButton(Model model, @PathVariable(value = "id") int id) {

        BookingEntity booking_detail = bookingService.updateBooking(id);
        List<BookingEntity> booking = bookingService.getListBookings(id);

        model.addAttribute("list", booking);
        BookingEntity bk = bookingService.getInformation(id);
        List<BookingDetailEntity> bkd = bookingDetailService.getListBooking(id);

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(bk.getCustomerEn().getEmail());
        email.setSubject("Welcome to Modern Hotel");
        email.setText("Hello: " + bk.getCustomerEn().getName() + "\n"
                + "The amount you pay is:" + "$" + bk.getTotalPrice() + "\n"
                + "You paid!" + "\n"
                + "Thank you for coming to our hotel. Your satisfaction is our honor. Thank you very much!"
        );

        mailSender.send(email);

        model.addAttribute("inf", bk);
        model.addAttribute("bkd", bkd);
        return "bill";
    }

    @RequestMapping(value = "/search-room-booked", method = RequestMethod.POST)
    public String searchRoomBooked(Model model,
            @ModelAttribute(value = "checkIn") String checkInDate,
            @ModelAttribute(value = "checkOut") String checkOutDate) {
        String message = "";
        String pageName = "employee";
        if (checkInDate != null && !checkInDate.isEmpty() && checkOutDate != null && !checkOutDate.isEmpty()) {
            
            List<BookingEntity> lstBooking = bookingService.getLstBooking();
            List<BookingEntity> lstBooked = new ArrayList<>();
            List<Integer> lstRoomsNotAvailable = new ArrayList<Integer>();
            List<RoomEntity> lstRooms = roomService.findAllRooms();
            try {
                SimpleDateFormat sc = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                String currentDateStr = sc.format(date);
                Date currentDate = sc.parse(currentDateStr);
                Date checkInDateFormat = sc.parse(checkInDate);
                Date checkOutDateFormat = sc.parse(checkOutDate);
                if (checkInDateFormat.compareTo(currentDate) < 0 || checkOutDateFormat.compareTo(currentDate) < 0) {
                    message = "Check in date and check out date must be greater than or equal current date.";
                } else if (checkInDateFormat.compareTo(checkOutDateFormat) > 0) {
                    message = "Check out date must be greater than check in date.";
                } else if (lstBooking != null && lstBooking.size() > 0) {
                    for (BookingEntity bookingEntity : lstBooking) {
                        if (checkInDateFormat.compareTo(bookingEntity.getDateCheckin()) >= 0 && checkInDateFormat.compareTo(bookingEntity.getDateCheckout()) <= 0) {
                            lstBooked.add(bookingEntity);
                        } else if (checkOutDateFormat.compareTo(bookingEntity.getDateCheckin()) >= 0 && checkOutDateFormat.compareTo(bookingEntity.getDateCheckout()) <= 0) {
                            lstBooked.add(bookingEntity);
                        }
                    }
                    if (lstBooked.size() > 0) {
                        for (BookingEntity bookingEntity : lstBooked) {
                            if (bookingEntity.getBookingDe() != null && bookingEntity.getBookingDe().size() > 0) {
                                for (BookingDetailEntity bookingDetailEntity : bookingEntity.getBookingDe()) {
                                    lstRoomsNotAvailable.add(bookingDetailEntity.getRoomEnti().getId());
                                }
                            }
                        }
                        if (lstRooms != null && lstRooms.size() > 0 && lstRoomsNotAvailable.size() > 0) {
                            for (Integer roomId : lstRoomsNotAvailable) {
                                for (RoomEntity lstRoom : lstRooms) {
                                    if (lstRoom.getId() == roomId) {
                                        lstRooms.remove(lstRoom);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    pageName = "search-room";
                }
            } catch (ParseException ex) {
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
            model.addAttribute("lstRoomsAvailable", lstRooms);
        } else {
            message = "Check in date and check out date aren't empty.";
        }
        if (pageName.equals("employee")) {
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (principal instanceof UserEntity) {
                UserEntity userEntity = (UserEntity) (principal);
                model.addAttribute("name", userEntity.getName());
                model.addAttribute("address", userEntity.getAddress());
                model.addAttribute("email", userEntity.getEmail());
            }
        }
        model.addAttribute("checkInDate", checkInDate);
        model.addAttribute("checkOutDate", checkOutDate);
        model.addAttribute("message", message);
        return pageName;
    }

    @RequestMapping(value = "/booking-room", method = RequestMethod.POST)
    public String BookingRoom(Model model,
            @ModelAttribute(value = "checkIn") String checkInDate,
            @ModelAttribute(value = "checkOut") String checkOutDate,
            @ModelAttribute(value = "roomId") int roomId, HttpSession session) {

        BookingEntity bookingEntity = (BookingEntity) session.getAttribute("bookingRoomSesion");

        RoomEntity roomEntity = roomService.getRoomById(roomId);
        SimpleDateFormat sc = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String bookingDate = sc.format(date);
        try {
            Date checkInDateFormat = sc.parse(checkInDate);
            Date checkOutDateFormat = sc.parse(checkOutDate);
            if (roomEntity != null && roomEntity.getId() > 0) {
                BookingDetailEntity bookingDetailEntity = new BookingDetailEntity();
                bookingDetailEntity.setRoomEnti(roomEntity);

                if (bookingEntity != null) {
                    double totalPrice = bookingEntity.getTotalPrice();
                    if (bookingEntity.getBookingDe() != null && bookingEntity.getBookingDe().size() > 0) {

                        boolean isExist = false;
                        for (BookingDetailEntity bookingDetail : bookingEntity.getBookingDe()) {
                            if (bookingDetail.getRoomEnti().getId() == bookingDetailEntity.getRoomEnti().getId()) {
                                isExist = true;
                                break;
                            }
                        }
                        if (!isExist) {
                            bookingEntity.getBookingDe().add(bookingDetailEntity);

                            long day = 0;
                            if (checkOutDate.compareTo(checkInDate) == 0) {
                                day = 1;
                            } else {
                                long diff = checkOutDateFormat.getTime() - checkInDateFormat.getTime();
                                day = diff / (24 * 60 * 60 * 1000);
                            }

                            totalPrice = totalPrice + roomEntity.getPrice() * day;
                        }
                        bookingEntity.setTotalPrice(totalPrice);
                    }

                } else {
                    bookingEntity = new BookingEntity();
                    bookingEntity.setDateBooking(date);
                    bookingEntity.setDateCheckin(checkInDateFormat);
                    bookingEntity.setDateCheckout(checkOutDateFormat);
                    List<BookingDetailEntity> lstBookDetail = new ArrayList<>();
                    lstBookDetail.add(bookingDetailEntity);
                    bookingEntity.setBookingDe(lstBookDetail);
                    long day = 0;
                    if (checkOutDate.compareTo(checkInDate) == 0) {
                        day = 1;
                    } else {
                        long diff = checkOutDateFormat.getTime() - checkInDateFormat.getTime();
                        day = diff / (24 * 60 * 60 * 1000);
                    }
                    bookingEntity.setTotalPrice(roomEntity.getPrice() * day);
                    bookingEntity.setStatus("Booking");
                }

                session.setAttribute("bookingRoomSesion", bookingEntity);

            }
        } catch (ParseException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        model.addAttribute("bookingDate", bookingDate);
        model.addAttribute("checkInDate", checkInDate);
        model.addAttribute("checkOutDate", checkOutDate);
        model.addAttribute("bookingEntity", bookingEntity);
        return "booking-room";
    }

    @RequestMapping(value = {"/booking"}, method = RequestMethod.GET)
    public String showPageBooking(Model model, HttpSession session) {
        BookingEntity bookingEntity = (BookingEntity) session.getAttribute("bookingRoomSesion");
        if (bookingEntity != null) {
            SimpleDateFormat sc = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            String bookingDate = sc.format(date);
            String checkInDate = sc.format(bookingEntity.getDateCheckin());
            String checkOutDate = sc.format(bookingEntity.getDateCheckout());
            model.addAttribute("bookingDate", bookingDate);
            model.addAttribute("checkInDate", checkInDate);
            model.addAttribute("checkOutDate", checkOutDate);
            model.addAttribute("bookingEntity", bookingEntity);
        }
        return "booking-room";
    }

    @RequestMapping(value = {"/delete/{roomId}"}, method = RequestMethod.GET)
    public String deleteRoomBooking(Model model, HttpSession session,
            @PathVariable(value = "roomId") int roomId) {
        BookingEntity bookingEntity = (BookingEntity) session.getAttribute("bookingRoomSesion");
        if (bookingEntity != null && bookingEntity.getBookingDe() != null && bookingEntity.getBookingDe().size() > 0) {
            for (BookingDetailEntity bookingDetailEntity : bookingEntity.getBookingDe()) {
                if (bookingDetailEntity.getRoomEnti().getId() == roomId) {
                    bookingEntity.getBookingDe().remove(bookingDetailEntity);
                    break;
                }
            }
        }
        return "redirect:/management/employee/booking";
    }

    @RequestMapping(value = {"/customer-info"}, method = RequestMethod.GET)
    public String showCustomerInfor(Model model) {
        model.addAttribute("customer", new CustomerEntity());
        model.addAttribute("genders", Gender.values());
        return "booking-customer";
    }

    @RequestMapping(value = {"/booking-action"}, method = RequestMethod.POST)
    public String bookingAction(Model model, HttpSession session,
            @ModelAttribute(value = "customer") CustomerEntity customer) throws MessagingException {

        if (customer != null) {

            CustomerEntity customerEntity = null;
            CustomerEntity ce = customerService.findByIDCard(customer.getIdentityCard());
            ce.setName(customer.getName());
            ce.setGender(customer.getGender());
            ce.setAddress(customer.getAddress());
            ce.setEmail(customer.getEmail());
            ce.setPhone(customer.getPhone());
            ce.setBirthDate(customer.getBirthDate());
            if (ce != null && ce.getId() > 0) {
                customerEntity = customerService.addNewCustomer(ce);
            } else {
                ce.setIdentityCard(customer.getIdentityCard());
                customerEntity = customerService.addNewCustomer(ce);
            }

            if (customerEntity != null && customerEntity.getId() > 0) {

                BookingEntity bookingEntity = (BookingEntity) session.getAttribute("bookingRoomSesion");
                if (bookingEntity != null && bookingEntity.getBookingDe() != null && bookingEntity.getBookingDe().size() > 0) {
                    bookingEntity.setStatus("Booking");
                    bookingEntity.setCustomerEn(customerEntity);
                    BookingEntity bookingRooms = bookingService.saveBookingRooms(bookingEntity);
                    boolean savePass = false;
                    if (bookingRooms != null && bookingRooms.getId() > 0) {
                        for (BookingDetailEntity bookingDetailEntity : bookingEntity.getBookingDe()) {
                            BookingDetailEntity bookingDetail = new BookingDetailEntity();
                            bookingDetail.setBookingEnt(bookingRooms);
                            bookingDetail.setRoomEnti(bookingDetailEntity.getRoomEnti());
                            BookingDetailEntity bookingDetailSave = bookingDetailService.saveBooking(bookingDetail);
                            if (bookingDetailSave != null && bookingDetailSave.getId() > 0) {
                                savePass = true;
                            } else {
                                savePass = false;
                            }
                        }
                    }
                    if (savePass) {
                        MimeMessage mime = mailSender.createMimeMessage();
                        MimeMessageHelper helper = new MimeMessageHelper(mime, false, "utf-8");
                        String htmlMsg = "You booked success" + "\n"
                                + "If your information is wrong please contact "
                                + "us through the hotline 1900 1010 to "
                                + "be corrected. If arriving at the time of"
                                + " booking without your arrival, we will automatically"
                                + " cancel your booking. Sincerely thank you! Have a nice day!"
                                + "\n"
                                + "<!DOCTYPE html>\n"
                                + "<html>\n"
                                + "    <head>\n"
                                + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                                + "        <title>Booking Rooms</title>\n"
                                + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                                + "    </head>\n"
                                + "    <body>\n"
                                + "        <div class=\"container\">\n"
                                + "            <section  class=\"paralla-section\">\n"
                                + "                <div class=\"row\">\n"
                                + "                    <div class=\"col-xs-12 col-sm-12 col-md-12\" style=\"text-align: center\">\n"
                                + "                        <h2>Information Booking</h2>\n"
                                + "                    </div>\n"
                                + "                </div>\n"
                                + "                <c:if test=\"${bookingEntity!=null}\">\n"
                                + "                    <div class=\"row\">\n"
                                + "                        <div class=\"col-xs-12 col-sm-12 col-md-12\">\n"
                                + "                            <p><span class=\"font-weight\">Name: </span>" + customerEntity.getName() + "</p>\n"
                                + "                            <p><span class=\"font-weight\">Email: </span>" + customerEntity.getEmail() + "</p>\n"
                                + "                            <p><span class=\"font-weight\">Phone: </span>" + customer.getPhone() + "</p>\n"
                                + "                            <p><span class=\"font-weight\">Address: </span>" + customer.getAddress() + "</p>\n"
                                + "                            <p><span class=\"font-weight\">Indentity Card: </span>" + customer.getIdentityCard() + "</p>\n"
                                + "                            <p><span class=\"font-weight\">ID Booking: </span>" + bookingEntity.getId() + "</p>\n"
                                + "                            <p><span class=\"font-weight\">Booking Date: </span>" + bookingEntity.getDateBooking() + "</p>\n"
                                + "                            <p><span class=\"font-weight\">Check In Date: </span>" + bookingEntity.getDateCheckin() + "</p>\n"
                                + "                            <p><span class=\"font-weight\">Check Out Date: </span>" + bookingEntity.getDateCheckout() + "</p>\n"
                                + "                        </div>\n"
                                + "                    </div>\n"
                                + "                </c:if>\n"
                                + "                <div class=\"row\">\n"
                                + "                    <div class=\"col-xs-12 col-sm-12 col-md-12\">\n"
                                + "                        <c:if test=\"${bookingEntity!=null}\">\n"
                                + "                            <c:if test=\"${bookingEntity.bookingDe!=null && func:length(bookingEntity.bookingDe)>0}\">\n"
                                + "                                <div class=\"table-responsive\">\n"
                                + "                                    <table class=\"table table-bordered table-hover\">\n"
                                + "                                        <tr>\n"
                                + "                                            <th>Room Number</th>\n"
                                + "                                            <th>Category Name</th>\n"
                                + "                                            <th >Desctiption</th>\n"
                                + "                                            <th>Price</th>\n"
                                + "                                        </tr>\n";

                        String t1 = "";
                        for (BookingDetailEntity bk : bookingEntity.getBookingDe()) {
                            t1 += "<tr>"
                                    + "<td>" + bk.getRoomEnti().getRoomNumber() + "</td>"
                                    + "<td>" + bk.getRoomEnti().getRoomCa().getCategoryRoomName() + "</td>"
                                    + "<td>" + bk.getRoomEnti().getRoomCa().getCategoryRoomDescription() + "</td>"
                                    + "<td>" + bk.getRoomEnti().getPrice() + "</td>" + "</tr>";
                        }
                        String t2 = ""
                                + "                                    </table>\n"
                                + "                                </div>\n"
                                + "                            </c:if>\n"
                                + "                        </c:if>\n"
                                + "                    </div>\n"
                                + "                </div>\n"
                                + "                <div class=\"row\">\n"
                                + "                    <c:if test=\"${bookingEntity!=null}\">\n"
                                + "                        <div class=\"col-xs-12 col-sm-12 col-md-12\" style=\"text-align: right\">\n"
                                + "                            <p><span class=\"font-weight\">Total Price: </span> $" + bookingEntity.getTotalPrice() + "</p>\n"
                                + "                        </div>\n"
                                + "                    </c:if>\n"
                                + "                </div>\n"
                                + "            </section>\n"
                                + "        </div>\n"
                                + "    </body>\n"
                                + "</html>\n"
                                + "";
                        mime.setContent(htmlMsg + t1 + t2, "text/html");
                        helper.setTo(customerEntity.getEmail());
                        helper.setSubject("Welcome to Modern Hotel");
                        mailSender.send(mime);

                        session.removeAttribute("bookingRoomSesion");
                        model.addAttribute("message", "Booking rooms success.");
                    } else {
                        model.addAttribute("message", "Booking rooms fail.");
                    }
                }
            }
        }
        return "booking-notification";
    }
}
