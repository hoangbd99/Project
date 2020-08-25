<%-- 
    Document   : submit
    Created on : 23-07-2020, 15:54:54
    Author     : GL552VW
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>          

            <jsp:include page="header.jsp"></jsp:include>

            </div>
            <div id="carouselId" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselId" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselId" data-slide-to="1"></li>
                    <li data-target="#carouselId" data-slide-to="2"></li>
                    <li data-target="#carouselId" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img src="images/K01.jpg" alt="First slide">

                    </div>
                    <div class="carousel-item">
                        <img src="images/K02.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img src="images/K03.jpg" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img src="images/K04.jpg" alt="four slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselId" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselId" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div><br/>

            <section>
                <div class="container">
                    <div class="row col-md-6">
                        <div class="col-md-6" >
                            <div class="panel-heading">
                                <h4 style="color: #955851" class="panel-title">Thông tin đặt phòng</h4>
                            </div>


                            <input type="hidden" name="subkid" value=""></input>

                            <div class="panel panel-info col-md-12" style="border: 1px solid #bce8f1;">

                                <form action="submit" id="bookf01" method="post" class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="name">Họ và tên:</label>
                                            <input class="form-control" readonly="" type="text" name="name" id="CheckOut" value="${accounts.name}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="fromf01">Ng&#224;y đến<span class="required">*</span></label>
                                        <input class="form-control" type="text" readonly="" id="datefromf01" name="subfrom" value="${requestScope.from}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="tof01">Ng&#224;y đi<span class="required">*</span></label>
                                        <input class="form-control" type="text" readonly="" id="datetof01" name="subto" value="${requestScope.to}" />

                                    </div>
                                    <div class="form-group">
                                        <label for="rid">Tên phòng : </label>
                                        <input class="form-control" readonly="" type="text" name="subroomnum" id="CheckOut" value="${requestScope.roomnumber}" />
                                        <input type="hidden" name="subrid" value="${rid}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="kind">Loại phòng : </label>
                                        <input class="form-control" readonly="" type="text" name="subkind" id="CheckOut" value="${kind}" />
                                        <input type="hidden" name="subkid" value="${kid}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="kind">Hình thức :</label>
                                        <input class="form-control" readonly="" type="text" name="subform" id="CheckOut" value="${form}" />
                                        <input type="hidden" name="subfid" value="${fid}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="kind">Giá phòng</label>
                                        <input class="form-control" readonly="" type="text" name="price" id="CheckOut" value="${requestScope.priceday}" />
                                        <span>${requestScope.error}</span>
                                    </div>
                                    <div style="padding: 15px 15px">
                                        <input type="${(requestScope.error eq null)?"button":"submit"}" value="Đặt phòng" class="btn btn-primary"/>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>                   
    </body>
</html>
