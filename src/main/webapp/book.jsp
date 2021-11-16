<%-- 
    Document   : book
    Created on : Jul 28, 2019, 1:46:22 AM
    Author     : hemay
--%>

<%@page import="back.Booking"%>
<%@page import="back.Customer"%>
<%@page import="admin.Trip"%>
<%@page import="java.sql.*"%>
<%@page import="admin.AdminLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page= "header.jsp"/>
<jsp:include page= "adminNavebar.jsp"/>

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
                
                <%
                    String tripId=request.getParameter("tripId");
                    Booking bp=new Booking();
                    try{                          
                        ResultSet res = bp.Seats(tripId);
                    %>
 
                    <div class="profileContent">
                        <div class="profileInfo">
                            <h1 style="text-align: center;">Select Seat</h1>
                            <form action="ticket.jsp">
                                                            <table>
                                <tr>
                                <th><p>Trip Id</p></th>
                                <th><p>Source</p></th>
                                <th><p>Destination</p></th>
                                <th><p>Journey Date</p></th>
                                <th><p>Time</p></th>
                                <th><p>Bus Type</p></th>
                                <th><p>Company</p></th>
                                <th><p>Available Seat</p></th>
                                <th><p>Operator</p></th>
                                <th><p>Fare</p></th>
                                </tr>
                                <%
                                    Trip tp=new Trip();
                                    try{                          
                                        ResultSet tripRes = tp.findTripById(tripId);
                                        while(tripRes.next()){
                                                                                                         
                                %>
                                <tr>
                                    <td><p><%=tripRes.getString("id")%></p></td>
                                    <td><p><%=tripRes.getString("source")%></p></td>
                                    <td><p><%=tripRes.getString("destination")%></p></td>
                                    <td><p><%=tripRes.getString("date")%></p></td>
                                    <td><p><%=tripRes.getString("time")%></p></td>
                                    <td><p><%=tripRes.getString("bus_type")%></p></td>
                                    <td><p><%=tripRes.getString("company")%></p></td>
                                    <td><p><%=tripRes.getString("available_seat")%></p></td>
                                    <td><p><%=tripRes.getString("operator")%></p></td>
                                    <td><p><%=tripRes.getString("fare")%></p></td>
                                </tr>
                                <%} 
                             }catch(Exception ex){
                                }%>
                                
                                
                                <%
                                    String status=null;
                                    String seat_no=null;
                                    String temp="Not-Sold";
                                      while(res.next()){
                                          
                                %>
                                <tr>
                                    <%status=res.getString("customer_email");
                                          seat_no=res.getString("seat_no");%>
                                    <td>
                                        <p>
                                            <%if(status.compareTo(temp)==0){%>
                                            <input type="checkbox" name="seat" value="<%=seat_no%>">
                                            <%=seat_no%>
                                            <%}else{%>
                                            <%=seat_no%>                                            
                                        </p>
                                    </td>
                                    <% }res.next();
                                        status=res.getString("customer_email");
                                          seat_no=res.getString("seat_no"); %>
                                    <td>
                                        <p>
                                            <%if(status.compareTo(temp)==0){%>
                                            <input type="checkbox" name="seat" value="<%=seat_no%>">
                                            <%=seat_no%>
                                            <%}else{%>
                                            <%=seat_no%>                                            
                                        </p>
                                    </td>
                                    <% }res.next();
                                        status=res.getString("customer_email");
                                          seat_no=res.getString("seat_no"); %>
                                    <td>
                                        <p>
                                            <%if(status.compareTo(temp)==0){%>
                                            <input type="checkbox" name="seat" value="<%=seat_no%>">
                                            <%=seat_no%>
                                            <%}else{%>
                                            <%=seat_no%>                                            
                                        </p>
                                    </td>
                                    <%} res.next();
                                        status=res.getString("customer_email");
                                          seat_no=res.getString("seat_no"); %>
                                    <td>
                                        <p>
                                            <%if(status.compareTo(temp)==0){%>
                                            <input type="checkbox" name="seat" value="<%=seat_no%>">
                                            <%=seat_no%>
                                            <%}else{%>
                                            <%=seat_no%>                                            
                                        </p>
                                    </td>
                                </tr>                                
                                <%}
                                }//end of while 
                        }catch (Exception ex){
                                out.println(ex);
                        }%>
                                <tr>
                                <td><p></p></td>
                                <td><p></p></td>
                                <input type ="hidden" name ="tripId" value="<%=tripId%>" >
                                <td><button type="submit" style="height: 40px; width: 120px; font-size: 30px;border-radius: 10px;"><b>Submit</b></button></td>
                                </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    


<jsp:include page="footer.jsp"/>
