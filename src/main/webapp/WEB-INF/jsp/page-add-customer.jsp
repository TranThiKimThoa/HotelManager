

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Room</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css"
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            .error {
                color: red;
            }
        </style>

    </head>
    <body>
        <div class="container">

            <div class="col-xs-12 col-sm-12 col-md-12">
                <f:form style=" margin-left: 350px; margin-top: 50px;" action="addCustomer" method="post" modelAttribute="customer" class="container col-md-4 panel panel-primary panel-body" >
                    <input type="text" hidden name="id" value="${customer.id}"/>
                    
                    <div class="panel-heading" style="text-align: center;">Add Customer</div>
                    <c:if test="${message != null && message != ''}">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="alert alert-danger">
                                ${message}
                            </div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label >Name: </label>
                        <input type="text" class="form-control" name="name" />
                        <f:errors path="name" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label >Gender:</label>
                        <c:forEach var="g" items="${genders}">
                            <c:if test="${customer.gender == g}">
                                <label class="radio-inline">
                                    <input type="radio" checked name="customer.gender" value="${g}">${g}
                                </label>
                            </c:if>
                           <c:if test="${customer.gender != g}">
                                <label class="radio-inline">
                                    <input type="radio" name="customer.gender" value="${g}">${g}
                                </label>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="form-group">
                        <label >Age: </label>
                        <input type="text" class="form-control" name="age" />
                        <f:errors path="age" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label >ID Card:</label>
                        <input type="text" class="form-control" name="identityCard" />
                        <f:errors path="identityCard" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label >Email: </label>
                        <input type="email" class="form-control" name="email" />
                        <f:errors path="email" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label >Phone:</label>
                        <input type="text" class="form-control" name="phone" />
                        <f:errors path="phone" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label >Date Booking</label>
                        <input type="text" class="form-control" placeholder="yyyy-MM-dd" name="bookingEn.dateBooking" />
                    </div>
        
                    <div class="form-group" >

                        <input type="submit" value="Save"/>

                    </div>
                </f:form>
            </div>
        </div>
    </body>
</html>
