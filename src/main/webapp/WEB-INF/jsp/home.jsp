
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modern Hotel </title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="">
        <meta name="description" content="">


        <%@include file="include/includeCss.jsp" %>



    </head>
    <body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">


        <section id="home" class="parallax-section">
            <div class="wrap">
                <div class="container">
                    <div class="row">
                        <div id="availability">
                            <form action="#">
                                <div class="a-col">
                                    <label style="color: white;">MODERN HOTEL</label>
                                </div>

                                <div class="a-col alternate">
                                    <div class="input-field">
                                        <label for="date-start">Check In</label>
                                        <input type="date" class="form-control" id="date-start" />
                                    </div>
                                </div>
                                <div class="a-col alternate">
                                    <div class="input-field">
                                        <label for="date-end">Check Out</label>
                                        <input type="date" class="form-control" id="date-end" />
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


        <section class="navbar navbar-default navbar-fixed-top sticky-navigation" role="navigation">
            <div class="container">

                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>
                    <a href="#" class="navbar-brand">Modern Hotel</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right main-navigation">
                        <li><a href="#home" class="smoothScroll">HOME</a></li>
                        <li><a href="#about" class="smoothScroll">ABOUT US</a></li>
                        <li><a href="#testimonial" class="smoothScroll">TESTIMONIALS</a></li>
                        <li><a href="#blog" class="smoothScroll">BLOG</a></li>

                    </ul>
                </div>

            </div>
        </section>


        <section id="about" class="paralla-section">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 col-sm-12">
                        <img src="resources/images/ks2.jpg" class="img-responsive" alt="about img 1">
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="about-des">
                            <h4>Modern Hotel</h4>
                            <h3>Nhu cầu đa dạng</h3>
                            <p> Là thương hiệu khách sạn 5 sao cao cấp tọa lạc tại trung tâm các thành phố lớn và các trung tâm du lịch nổi tiếng của Việt Nam.  Được ưu ái tọa lạc tại những vị trí đắc địa của những đô thị lớn, các khách sạn thuộc phân khúc 4 sao Modern Hotel đã và đang mang đến một không gian nghỉ dưỡng tuyệt vời cho những kỳ nghỉ và chuyến công tác cho quý khách.
                            </p>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-md-6 col-sm-12">
                        <div class="about-des">
                            <h4>Chất lượng</h4>
                            <h3>Tiêu chuẩn 4 sao</h3>
                            <p>Modern Hotel là nhóm khách sạn đạt tiêu chuẩn 4 sao trở lên, tọa lạc ở các địa điểm du lịch, nghỉ dưỡng nổi tiếng trên toàn quốc với thiết kế tinh tế cùng phong cách phục vụ chuyên nghiệp nhằm mang đến cho du khách kì nghỉ tiện nghi và thoải mái. </p>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <img src="resources/images/ks3.jpg" class="img-responsive" alt="about img 2">
                    </div>

                </div>
            </div>
        </section>

        <section id="testimonial" class="parallax-section">
            <div class="container">
                <div class="row">

                    <div id="owl-testimonial" class="owl-carousel">


                        <div class="item">
                            <div class="row">
                                <div class="col-md-offset-2 col-md-8">
                                    <img src="resources/images/ta.jpg" class="img-responsive img-circle" alt="testimonial img">
                                    <h2>Tien Anh</h2>
                                    <p>Lorem ipsum dolor sit amet, maecenas eget vestibulum justo imperdiet, wisi risus purus augue vulputate voluptate neque, curabitur dolor libero sodales vitae elit massa.</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-offset-2 col-md-8">
                                    <img src="resources/images/testimonial-img-3.jpg" class="img-responsive img-circle" alt="testimonial img">
                                    <h2>SANDAR - Developer</h2>
                                    <p>Lorem ipsum dolor sit amet, maecenas eget vestibulum justo imperdiet, wisi risus purus augue vulputate voluptate neque, curabitur dolor libero sodales vitae elit massa.</p>
                                </div>
                            </div>
                        </div>

                    </div>


                </div>
            </div>
        </section>



        <section id="counter" class="paralla-section">
            <div class="container">
                <div class="row">

                    <div class="col-md-3 col-sm-3 counter-item">	
                        <h3 class="counter-number" data-from="1" data-to="256" data-speed="1000"></h3>
                        <span class="counter-text">CUSTOMERS</span>
                    </div> 
                    <div class="col-md-3 col-sm-3 counter-item">	
                        <h3 class="counter-number" data-from="1" data-to="512" data-speed="2000"></h3>
                        <span class="counter-text">DEVELOPERS</span>
                    </div>   
                    <div class="col-md-3 col-sm-3 counter-item">	
                        <h3 class="counter-number" data-from="1" data-to="1024" data-speed="3000"></h3>
                        <span class="counter-text">AWESOME PROJECTS</span>
                    </div> 
                    <div class="col-md-3 col-sm-3 counter-item">
                        <h3 class="counter-number" data-from="1" data-to="2048" data-speed="4000"></h3>
                        <span class="counter-text">DESIGNERS</span>
                    </div> 


                </div>
            </div>
        </section>


        <section id="blog" class="paralla-section">
            <div class="container">
                <div class="row">

                    <h2>OUR BLOG</h2>
                    <h4>Simple and Powerful tips</h4>

                    <div class="blog-masonry masonry-true">

                        <div class="post-masonry col-md-4 col-sm-6 wow fadeInUp">
                            <div class="blog-wrapper">
                                <img src="resources/images/g2.jpg" class="img-responsive" alt="blog img">
                                <h3><a href="#">Superior Room</a></h3>
                                <small>August 26, 2016</small>
                                <p>Decorated in a modern style, our Superior Rooms offer free WiFi, 32-inch LCD TVs, DVD players, writing desks and in-room tea and coffee making facilities. Our bathroom features walk-in rain showers and hairdryers. </p>
                            </div>
                        </div>
                        <div class="post-masonry col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.2s">
                            <div class="blog-wrapper">
                                <img src="resources/images/g4.jpg" class="img-responsive" alt="blog img">
                                <h3><a href="#">Deluxe Room</a></h3>
                                <small>August 22, 2016</small>
                                <p>These Deluxe Rooms let you relax as you admire a beautiful view of the pool. Stay connected as you enjoy our free WiFi and watch movies with our 32-inch LCD TV and DVD player. Refresh yourself as you take a step into our rain shower.Blending modern design with touches. </p>
                            </div>
                        </div>
                        <div class="post-masonry col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.4s">
                            <div class="blog-wrapper">
                                <img src="resources/images/g6.jpg" class="img-responsive" alt="blog img">
                                <h3><a href="#">Grand Deluxe Room</a></h3>
                                <small>August 14, 2016</small>
                                <p>Overseeing our swimming pool, the Grand Deluxe Rooms provide a private balcony for a refreshing time. </p>
                            </div>
                        </div>
                        <div class="post-masonry col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.6s">
                            <div class="blog-wrapper">
                                <img src="resources/images/g8.jpg" class="img-responsive" alt="blog img">
                                <h3><a href="#">Grand Deluxe Terrace Room </a></h3>
                                <small>July 23, 2016</small>
                                <p>Take a dip in our swimming pool right from the private balcony of our Grand Deluxe Terrace Room Terrace rooms. With a blend of modern design and added touches of comfort, we'll keep you entertained with our free WiFi, 32-inch LCD TVs, and DVD players. Work away with our writing desks and stay energised with our in-room tea and coffee-making.</p>
                            </div>
                        </div>
                        <div class="post-masonry col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.8s">
                            <div class="blog-wrapper">
                                <img src="resources/images/g5.jpg" class="img-responsive" alt="blog img">
                                <h3><a href="#">Standard Room</a></h3>
                                <small>July 19, 2016</small>
                                <p>Lorem ipsum dolor sit amet, maecenas eget vestibulum justo imperdiet, wisi risus purus augue vulputate voluptate neque.  Our spacious bathrooms feature walk-in rain showers and separate bathtubs, hairdryers and upgraded bathroom amenities.</p>
                            </div>
                        </div>
                        <div class="post-masonry col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="1.0s">
                            <div class="blog-wrapper">
                                <img src="resources/images/g7.jpg" class="img-responsive" alt="blog img">
                                <h3><a href="#">Suite Room</a></h3>
                                <small>July 12, 2016</small>
                                <p>Lorem ipsum dolor sit amet, maecenas eget vestibulum justo imperdiet, wisi risus purus augue vulputate 	voluptate neque, curabitur dolor libero sodales vitae elit massa.</p>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>

        <footer style="background-color: black; color: white;">
    <div class="container" >
        <div class="row">
            <div class="col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                <h2>Modern Hotel</h2>
                <p>Lorem ipsum dolor sit amet, maecenas eget vestibulum justo imperdiet, wisi risus purus augue vulputate voluptate neque, curabitur dolor libero sodales vitae elit massa.</p>
                <p>Copyright &copy; 2018 Modern Hotel 

                    | Design: <a rel="nofollow" href="https://www.facebook.com/thoa.tran.9256" target="_parent">Thoa Tran</a></p>
            </div>
            <div class="link-list col-md-2 col-sm-2 wow fadeInUp" data-wow-delay="0.6s">
                <h2>Company</h2>
                <a href="#">About</a>
                <a href="#">Blog</a>
                <a href="#">Team</a>
                <a href="#">Career</a>
            </div>
            <div class="link-list col-md-2 col-sm-2 wow fadeInUp" data-wow-delay="0.6s">
                <h2>Support</h2>
                <a href="#">Email Us</a>
                <a href="#">FAQs</a>
                <a href="#">Service Terms</a>
                <a href="#">Licenses</a>
            </div>
            <div class="col-md-2 col-sm-2 wow fadeInUp" data-wow-delay="0.9s">
                <h2>Network</h2>
                <ul class="social-icon">
                    <li><a href="#" class="fa fa-facebook wow fadeIn" data-wow-delay="0.3s"></a></li>
                    <li><a href="#" class="fa fa-twitter wow fadeIn" data-wow-delay="0.6s"></a></li>
                    <li><a href="#" class="fa fa-dribbble wow fadeIn" data-wow-delay="0.9s"></a></li>
                    <li><a href="#" class="fa fa-behance wow fadeIn" data-wow-delay="1s"></a></li>
                </ul>
            </div>
            <div class="col-md-12 col-sm-12">
                <div class="copyright-text wow bounceIn">
                </div>
            </div>
        </div>
    </div>
</footer>

                    <script src="resources/js/jquery.js"></script>
                    <script src="resources/js/bootstrap.min.js"></script>
                    <script src="resources/js/smoothscroll.js"></script>
                    <script src="resources/js/jquery.nav.js"></script>
                    <script src="resources/js/jquery.parallax.js"></script>
                    <script src="resources/js/owl.carousel.min.js"></script>
                    <script src="resources/js/isotope.min.js"></script>
                    <script src="resources/js/wow.min.js"></script>
                    <script src="resources/js/counter.js"></script>
                    <script src="resources/js/custom.js"></script>



                    </body>
                    </html>
