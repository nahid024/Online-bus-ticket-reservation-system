
<%-- 
    Document   : availabelTrip
    Created on : Jul 27, 2019, 11:02:19 PM
    Author     : hemay
--%>

<%@page import="back.Customer"%>
<%@page import="admin.Trip"%>
<%@page import="java.sql.*"%>
<%@page import="admin.AdminLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page= "header.jsp"/>
<jsp:include page= "navebar.jsp"/>

                <div id ="gap">
                    <!--img src="img/back.png"/-->
<!--                    <img src="img/backpacker.png"  style="width: 260px; margin-left:40%"/>-->
                </div>
                <%
                    Customer ob = new Customer();
                    try{
                        if(session.getAttribute("userName").toString()==null){
                            response.sendRedirect("signin.jsp");
                        }
                        String email= session.getAttribute("userEmail").toString();
                        ob.setCustomerEmail(email);
                        ob.userInfo(ob);
                       }catch (Exception ex){
                           response.sendRedirect("signin.jsp");
                       }                    
                %>
 
                    <div class="profileContent">
                        <div class="tripInfo">
                            <h1 style="text-align: center;">All the  Trip</h1>
                            <table>
                                <tr>
                                <th><p>Booking Id</p></th>
                                <th><p>Source</p></th>
                                <th><p>Destination</p></th>
                                <th><p>Date</p></th>
                                <th><p>Time</p></th>
                                <th><p>Bus Type</p></th>
                                <th><p>Company</p></th>
                                <th><p>Seats</p></th>
                                <th><p>Operator</p></th>
                                <th><p>Fare</p></th>
                                </tr>
                                <%
                                    try{
                                    ResultSet res=ob.profilJourneyHistory(ob.getCustomerEmail());
                                    while(res.next()){
                                                                                                         
                                    %>
                                <tr>
                                    <td><p><%=res.getString("booking.id")%></p></td>
                                    <td><p><%=res.getString("source")%></p></td>
                                    <td><p><%=res.getString("destination")%></p></td>
                                    <td><p><%=res.getString("date")%></p></td>
                                    <td><p><%=res.getString("time")%></p></td>
                                    <td><p><%=res.getString("bus_type")%></p></td>
                                    <td><p><%=res.getString("company")%></p></td>
                                    <td><p><%=res.getString("seat_no")%></p></td>
                                    <td><p><%=res.getString("operator")%></p></td>
                                    <td><p><%=res.getString("fare")%></p></td>
                                </tr>
                                <%} 
                             }catch(Exception ex){
                                }%>
                                <tr>
                            </table>
                        </div>
                    </div>
                    


<jsp:include page="footer.jsp"/>

