<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Airline Reservation System</title>

</head>

<body background="Images/backgrnd[2].gif" link="#669900" vlink="#999933" alink="#FF9900" leftmargin="1" topmargin="1" marginheight="1" marginwidth="1">

           <table width="100%" border="0" cellpadding="0" cellspacing="0" height="78">
    <tbody><tr><td valign="top" width="326" height="78">
                <img src="Images/zigzag.jpg" width="326" height="78"></td>
        <td  width="100%" height="78" align="right" valign="top"  bgcolor="0A86E2" >
        </td></tr></tbody></table>
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0" height="10">
    <tbody><tr><td valign="top" width="100%" height="10">
                <img src="Images/fon-up00.jpg" width="100%" height="10">
            </td></tr></tbody></table>
    
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="15"width="950">
        <tbody><tr>
            <td valign="top"  width="8">
                <div style="float:left;">
                    <img src="Images/red_left_new.jpg" align="left" height="100%" width="6">
                   </div></td>
                   <td style="font-size: 15px;" valign="top"height="10" width="900">
                       <font face="Arial" color="red" ><center>
                <a  href="Home.html" style="text-decoration: none;">Home</a>
                |
                <a href="About.html" style="text-decoration: none;">About Us</a>
                |
                <a href="Destinations.html" style="text-decoration: none;">Destinations</a>
                |
                <a href="Corporate.html" style="text-decoration: none;">Corporate</a>
                |
                <a href="Support-Faq.html" style="text-decoration: none;">Support-Faq?</a>
                |
                <a href="Contact_Us.html" style="text-decoration: none;">Contact Us</a>
                |
                <a href="Flight_Information.jsp" style="text-decoration: none;">AIE Time Table</a>
                &nbsp;
                   <img src="Images/arrow_white_new.gif" title="Consolidators">  
                <a href="Reservation.html" style="text-decoration: none;">AIR Reservation</a>
                &nbsp;
                   <img src="Images/arrow_white_new.gif" title="Consolidators">     
                <a href="Cancel_Reservation.html" style="text-decoration: none;">Reservation Cancel</a>
                &nbsp;
                   <img src="Images/arrow_white_new.gif" title="Consolidators">     
                <a href="Home.html" style="text-decoration: none;">LogOut</a>
       </center></font></td>
           
                <td valign="top"  width="8">
                <div style="float:right;">
                    <img src="Images/red_right_new.jpg" align="left" height="100%" width="6">
                   </div></td></tr></tbody></table>

    <div><table align="center" border="0" cellpadding="0" cellspacing="0" width="950" height="3">
    <tbody><tr><td align="center" width="auto" height="10"></td></tr></tbody></table></div>
    
    <div><table valign="top" align="center" border="0" cellpadding="5" cellspacing="0" width="940">
            <tbody><tr align="left"><td align="left" height="20" style="font-size: 23px; color: darkviolet">
            <b>Reservation Information Display</b></td></tr></tbody></table></div>
	
    <div><table align="center" border="0" cellpadding="0" cellspacing="0" width="950" height="3">
    <tbody><tr><td align="center" width="auto" height="10"></td></tr>
    
                            <form name="f1" method="post" action="LogResv1.jsp"> 
                     
              <tr><td colspan="3" align="center">
             <input name="A2" value="&nbsp;&nbsp; Next Page &nbsp;&nbsp;" input type="submit"></td></tr>
                            <tr><td>&nbsp;</td></tr></tbody></table></div>
    
        <div><table valign="top" align="center" border="1" style="border-color: pink" cellpadding="2" cellspacing="1" width="930">
                <tbody>
                  
          <%   
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");
Statement st=con.createStatement();

             %>              
                <tr height="25" width="930">
            <td align="center"><b>Title</b></td>
            <td align="center"><b>Name</b></td>
            <td align="center"><b>Age</b></td>
            <td align="center"><b>Schedule</b></td>
            <td align="center"><b>Gender</b></td>
            <td align="center"><b>Address</b></td>
            <td align="center"><b>City</b></td>
            <td align="center"><b>State</b></td>
            <td align="center"><b>Pin Number</b></td>
            <td align="center"><b>Phone Number</b></td>
            <td align="center"><b>Nationality</b></td>
            <td align="center"><b>Passport Number</b></td>
            </tr> 
 <%
 ResultSet rs=st.executeQuery("select * from Reservation");
    
 while(rs.next())
               {

    %>               
      
     <tr height="25" width="930">
            <td align="center"><%=rs.getString("Title")%></td>
            <td align="center"><%=rs.getString("Name")%></td>
            <td align="center"><%=rs.getString("Age")%></td>
            <td align="center"><%=rs.getString("Schedule")%></td>
            <td align="center"><%=rs.getString("Gender")%></td>
            <td align="center"><%=rs.getString("Address")%></td>
            <td align="center"><%=rs.getString("City")%></td>
            <td align="center"><%=rs.getString("State")%></td>
            <td align="center"><%=rs.getString("Pin_Number")%></td>
            <td align="center"><%=rs.getString("Phone_Number")%></td>
            <td align="center"><%=rs.getString("Nationality")%></td>
            <td align="center"><%=rs.getString("Passport_Number")%></td>
            </tr>
<%
                }
rs.close();
st.close();
con.close();  
    %>                 
          </tbody></table></div>
        
    <div><table align="center" border="0" cellpadding="0" cellspacing="0" width="950" height="3">
    <tbody><tr><td align="center" width="auto" height="10"></td></tr>
    
     <tr><td colspan="3" align="center">
             <input name="A3" value="&nbsp;&nbsp; Next Page &nbsp;&nbsp;" input type="submit"></td></tr>
                 </form>
            <tr><td>&nbsp;</td></tbody></table></div>

        <table width="950" align="center" border="0" cellpadding="0" cellspacing="0" height="10">
        <tbody><tr><td style="font-size: 10px;"  height="10" width="683">
                <div  style="float:right;">
             <font face="Arial" color="black" >
          <A HREF="#top" style="text-decoration: none; color: red">Go Top</A>
            </font></div></td></tr></tbody></table>
        
    <table  width="950" align="center" border="0" cellpadding="0" cellspacing="0" height="10">
    <tbody><tr><td style="font-size: 10px;" valign="top" align="center" height="10" width="683">
          <img src="Images/sep (2).png" align="center" width="683" height="10">
    </tbody></table>

    <table  width="950" align="center" border="0" cellpadding="0" cellspacing="0" height="15">
    <tbody><tr> <td style="font-size: 10px;" valign="bottom" height="10" width="683">
            <font face="Arial" color="black" ><center><br>
            The site can be best viewed on 1024 X 768 pixels screen resolution and above.
        </td></tr></center></font>
    </tbody></table>

<table  width="950" align="center" border="0" cellpadding="0" cellspacing="0" height="15">
    <tbody><tr> <td style="font-size: 10px;" valign="bottom" height="10" width="683">
    <div style="float:left;">
        <DD>
    <img src="Images/pic_powerby.gif" title="Airline Reservation System" align="left" width="60%" height="5%">
        </dd>
    </div>
    <div  style="float:right;">
        <font face="Arial" color="black" ><br>
       <a >Terms &amp; Conditions</a>  | <a >Contact Us</a> | <a >Sitemap</a>| <a >Vigilance</a>
  </div></td></tr>
    </tbody></table>

</body>
</html>

