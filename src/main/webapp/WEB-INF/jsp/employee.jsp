
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee</title>
        <%@include file="include/includeCss.jsp" %>
    </head>
    <body>
        <%@include file="include/headerEmployee.jsp" %>
        <section id="home" class="parallax-section">
            <div class="wrap">
                <div class="container">
                    <div class="row">
                        <div id="availability">
                            <c:if test="${message!=null && message!=''}">
                                <div class="alert alert-info">
                                    ${message}
                                </div>
                            </c:if>
                            <form action="${pageContext.request.contextPath}/management/employee/search-room-booked" method="post">
                                <div class="a-col">
                                    <label style="color: white;">MODERN HOTEL</label>
                                </div>

                                <div class="a-col alternate">
                                    <div class="input-field">
                                        <label for="date-start">Check In</label>
                                        <input type="date" class="form-control" id="date-start" name="checkIn" value="${checkInDate}" />
                                    </div>
                                </div>
                                <div class="a-col alternate">
                                    <div class="input-field">
                                        <label for="date-end">Check Out</label>
                                        <input type="date" class="form-control" id="date-end" name="checkOut" value="${checkOutDate}"/>
                                    </div>
                                </div>
                                <div class="a-col action">
                                    <input type="submit" class="form-control" value="Search" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>	
        </section>
        <div class="container">
            <section  class="paralla-section">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                        <h2>MODERN HOTEL</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <p>Welcome Employee: ${name}</p>
                        <p>Email: ${email}</p>
                        <p>Address: ${address}</p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-8" style="border-left: 2px solid grey">
                        <div style="margin-left: 15px;">
                            <h4>Tổng quan khách sạn:</h4>
                            <p>Được xây dựng theo tiêu chuẩn 5 sao, Khách sạn MODERN hotel Đà Nẵng nằm bên bờ biển Mỹ Khê xinh đẹp, sẽ mang đến cho du khách một không gian sang trọng, quý phái khi đển thăm thành phố Đà Nẵng.</p>	
                            <h4>Địa Chỉ:</h4>
                            <div class="divArticle">Khách sạn MODERN hotel Đà Nẵng<br>Số 270 Đường Võ Nguyên Giáp, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng, Việt Nam.<br>Tel: 0236 3956789<br>Fax: 0236 3968789<br>Email: info@luxurydanang.modern.vn<br>www.modern.com/luxurydanang<br><table border="0" cellpadding="0" cellspacing="0" width="974" style="width: 732pt;"> <colgroup><col width="189" style="width: 142pt;"> <col width="153" style="width: 115pt;"> <col width="181" style="width: 136pt;"> <col width="69" style="width: 52pt;"> <col width="118" style="width: 89pt;"> <col width="264" style="width: 198pt;"> </colgroup><tbody>  </tbody></table><div><br><br></div></div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="include/footer.jsp" %> 
        <%@include file="include/includeJs.jsp" %>
    </body>
</html>
