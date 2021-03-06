

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/project.css"/>" />

        <link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="resources/css/util.css">
        <link rel="stylesheet" type="text/css" href="resources/css/main.css">
    </head>
    <body>


        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="<c:url value='j_spring_security_check' />" method='POST'>
                        <span class="login100-form-title p-b-26">
                            Welcome
                        </span>
                        <span class="login100-form-title p-b-48">
                            <i class="zmdi zmdi-font"></i>
                        </span>
                        <c:if test="${message !=null}">
                            <div class="row">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <div class="alert alert-danger">
                                        ${message}
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                            <input class="input100" id="inputEmail" type="text" name="email">
                            <span class="focus-input100" data-placeholder="Email"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <span class="btn-show-pass">
                                <i class="zmdi zmdi-eye"></i>
                            </span>
                            <input class="input100" type="password" id="inputPassword" name="pass">
                            <span class="focus-input100" data-placeholder="Password"></span>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button type="submit" class="login100-form-btn">
                                    Login
                                </button>
                            </div>
                        </div>
                        <br>
                        <br>
                        <br>

                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />
                    </form>
                </div>

            </div>
        </div>


        <div id="dropDownSelect1"></div>

        <script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="resources/vendor/animsition/js/animsition.min.js"></script>
        <script src="resources/vendor/bootstrap/js/popper.js"></script>
        <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/vendor/select2/select2.min.js"></script>
        <script src="resources/vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <script src="resources/vendor/countdowntime/countdowntime.js"></script>
        <script src="resources/js/main.js"></script>
    </body>
</html>
