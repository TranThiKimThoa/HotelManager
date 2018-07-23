

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
                <f:form style=" margin-left: 350px; margin-top: 50px;" action="${pageContext.request.contextPath}/management/employee/editRoom" method="post" modelAttribute="room" class="container col-md-4 panel panel-primary panel-body" >
                    
                   <input type="text" hidden name="id" value="${room.id}"/>
                    <div class="panel-heading" style="text-align: center;">Edit room</div>
                    <c:if test="${message != null && message != ''}">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="alert alert-danger">
                                ${message}
                            </div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label >Number Room: </label>
                        <input type="number" readonly="true" class="form-control" min="0" required name="roomNumber" value="${room.roomNumber}"/>
                        <f:errors path="roomNumber" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label >Price: </label>
                        <input type="text" class="form-control" name="price" min="0" required value="${room.price}"/>
                        <f:errors path="price" cssClass="error" />
                    </div>

                    <div class="form-group">
                        <label >Category Room: </label>
                        <select name="roomCa.id" class="form-control" readonly="true">
                            <c:forEach var="c" items="${categories}">
                                <c:if test="${room.roomCa.id == c.id}">
                                    <option value="${c.id}" selected>${c.categoryRoomName}</option>
                                </c:if>
                                <c:if test="${room.roomCa.id != c.id}">
                                    <option value="${c.id}">${c.categoryRoomName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group" >

                        <input type="submit" value="Save"/>

                    </div>
                </f:form>
            </div>
        </div>
    </body>
</html>
