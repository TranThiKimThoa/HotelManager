
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Customer</title>
        <%@include file="include/includeCss.jsp" %>
    </head>
    <body>
        <%@include file="include/headerEmployee.jsp" %>
        <section id="bookingCustomer" class="parallax-section">
        </section>
        <div class="container">
            <section  class="paralla-section">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                        <h2>Customer Information</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <f:form action="${pageContext.request.contextPath}/management/employee/booking-action" method="post" 
                                modelAttribute="customer" class="container panel panel-primary panel-body" >
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label >Name: <span class="required-input">(*)</span></label>
                                    <input type="text" class="form-control" required name="name" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label >ID Card:<span class="required-input">(*)</label>
                                    <input type="text" class="form-control" required name="identityCard" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label >Email: <span class="required-input">(*)</label>
                                    <input type="email" class="form-control" required name="email" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label >Birth Date: <span class="required-input">(*)</label>
                                    <input type="text" class="form-control" required placeholder="yyyy-MM-dd" name="birthDate" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label >Address: </label>
                                    <input type="text" class="form-control" name="address" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label >Phone:</label>
                                    <input type="text" class="form-control" name="phone" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label >Gender:</label>
                                    <c:forEach var="g" items="${genders}">
                                        <c:if test="${customer.gender == g}">
                                            <label class="radio-inline">
                                                <input type="radio" checked name="gender" value="${g}">${g}
                                            </label>
                                        </c:if>
                                        <c:if test="${customer.gender != g}">
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" value="${g}">${g}
                                            </label>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                                <div class="form-group" >
                                    <input type="submit" class="btn btn-primary" value="Booing Rooms"/>
                                </div>
                            </div>
                        </f:form>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="include/footer.jsp" %>    
        <%@include file="include/includeJs.jsp" %>
    </body>
</html>
