<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<html>
<head>
   <title>Airline Reservation System</title>

  <script language="javascript">       
	function City()
	{
        if (document.f2.originCity.value=="NO"){
	   alert("Please Select Origin City");
           document.f2.originCity.focus();
	   return false;
	   }
	if (document.f2.Destination_City.value=="NO"){
	   alert("Please Select Destination City");
           document.f2.Destination_City.focus();
	   return false;
	   }
        if (document.f2.originCity.value==document.f2.Destination_City.value){
	   alert("Error City . Please Select City");
           document.f2.Destination_City.focus();
	   return false;
	   } 

document.f2.dy.value=document.f2.DayFrom.value + "-" + document.f2.MonthFrom.value + "-" + document.f2.YearFrom.value;

        return true;
	}
	</script>
   
</head>

<body background="Images/backgrnd[2].gif" link="#669900" vlink="#999933" alink="#FF9900" leftmargin="1" topmargin="1" marginheight="1" marginwidth="1">
  
      <% 
String rno=request.getParameter("Reservations_Number");    
String tno=request.getParameter("Ticket_Number");

String tt="";
String buk="";
String wbuk="";
String cap="";
String tit="";
String nam="";
String fif="";
String FC="";
String TC="";
String Tp="";
String TPY="Your Reservation Successful";
String TPY1="Your Reservation Waiting";
String ttn="";
String rrn="";

Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");
Statement state=con.createStatement();
 try
      {
ResultSet que=state.executeQuery("select * from Reservation where Reservations_No='"+rno+"' and Ticket_No='"+tno+"'");
 if(que.next())
{
            tit=que.getString("Title");
            nam=que.getString("Name");
            fif=que.getString("Flight_No");
            FC=que.getString("f_From");
            TC=que.getString("f_To");
            Tp=que.getString("Reservations_type");
            }
            state.executeUpdate("delete from Reservation where Reservations_No='"+rno+"'");
            
que.close();
state.close();
con.close();

}
 catch(Exception e)
        {
  
        }
       finally
        {
            
        }

Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con7 = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");
Statement state1=con7.createStatement();

ResultSet rs=state1.executeQuery("select * from Flight_Information where Flight_No='"+fif+"'");

 if(rs.next())

          {
            cap=rs.getString("Total_Seat");
            buk=rs.getString("Booked_Seat");
            wbuk=rs.getString("Waiting_Seat");
           }
rs.close();
state1.close();
con7.close();
     
       
 if(tit=="" || nam=="")
   {
   }
else
   {
int buk1=0;
int wbuk1=0;            
String buk2="";
String wbuk2="";

int buk19=Integer.parseInt(buk);
int cap19=Integer.parseInt(cap);
int wbuk19=Integer.parseInt(wbuk);

if (wbuk19!=0)
{
wbuk1=Integer.parseInt(wbuk)-1;
wbuk2=Integer.toString(wbuk1);
buk2=buk;
}
if (wbuk19==0)
 {
 buk1=Integer.parseInt(buk)-1; 
 buk2=Integer.toString(buk1);
 wbuk2=wbuk;
}

Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con14 = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");

String sql1 = "UPDATE Flight_Information" + " SET Booked_Seat='" +buk2+ "'," + " Waiting_Seat='" +wbuk2+ "'" + " WHERE Flight_No='" +fif+ "'";
Statement state40=con14.createStatement();
int h = state40.executeUpdate(sql1);
state40.close();
con14.close();

if(Tp.equals(TPY))
       {
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con23 = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");
Statement state4=con23.createStatement();
ResultSet rs1=state4.executeQuery("select * from Reservation where f_From='" +FC+ "' and f_To='"+TC+"' and Reservations_type='" +TPY1+ "'");
 if(rs1.next())
          {
            ttn=rs1.getString("Ticket_No");
            rrn=rs1.getString("Reservations_No");
           }
rs1.close();
state4.close();
con23.close();

Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con33 = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");
String sql5 = "UPDATE Reservation" + " SET Reservations_type='" +TPY+ "' WHERE Ticket_No='" +ttn+ "' and Reservations_No='"+rrn+"'";
Statement state7=con33.createStatement();
int y = state7.executeUpdate(sql5);
state7.close();
con33.close();
 }   
 }
%>

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
                <a href="Login.html" style="text-decoration: none;">Login</a>
       </center></font></td>
           
                <td valign="top"  width="8">
                <div style="float:right;">
                    <img src="Images/red_right_new.jpg" align="left" height="100%" width="6">
                   </div></td></tr></tbody></table>

    <div><table align="center" border="0" cellpadding="0" cellspacing="0" width="auto" height="3">
    <tbody><tr><td align="center" width="auto" height="7"></td></tr></tbody></table></div>
    
    <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" height="900">
    <tbody><tr><td valign="top" align="left" width="350" height="900">
        <div valign="top" bgcolor="red" align="left" width="50" height="10">
            <span><font color="red" face="Arial" style="font-size: 18px;">
                Welcome Guest</font></span> </div>
                
                <div><table bgcolor="WhiteSmoke" border="0" cellpadding="0" cellspacing="0" width="350" height="10">
  <tbody><tr><td valign="top" width="6" height="10">
              <img src="Images/panel1.jpg" align="left"></td>
             <td height="10" width="260">
  <font color="red" face="Arial" style="font-size: 18px;"><center>
      Flights
  </center></font></td>
    <td valign="top" align="right" width="6" height="10">
        <img src="Images/panel12.jpg" align="right"></td></tr>
    
    <tr><td valign="top" width="6" height="auto"></td>
        <td height="auto" width="260"></td>
    <td valign="top" align="right" width="6" height="auto">
                 <img src="Images/panel22_top.jpg" align="right" height="5" width="9">
    </td></tr></tbody></table> </div>     
            
                 <form name="f2" method="post" onsubmit="return City()" action="Flight_Information.jsp">  
                
    <div><table bgcolor="WhiteSmoke" align="center" border="0" cellpadding="0" cellspacing="0" width="340" height="auto">
    <tbody>
        <tr> <td width="29%"><span> &nbsp; From</span></td>
            
            <td width="68%"><select name="originCity">
	<option selected="selected" value="NO">Select Origin City</option>
	                            <option value="Bangalore">Bangalore</option>
                                    <option value="Goa">Goa</option>
                                    <option value="Gurgaon">Gurgaon</option>
                                    <option value="Kodaikanal">Kodaikanal</option>
                                    <option value="Kolkata">Kolkata</option>
                                    <option value="Manali">Manali</option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="New Delhi">New Delhi</option>
                                    <option value="Ooty">Ooty</option>
                                    <option value="Shimla">Shimla</option>
                                    <option value="Chennai">Chennai</option></select></td></tr>       
          <tr><td width="29%"><span> &nbsp; To</span> </td>                           
              <td width="68%"><select name="Destination_City">
	<option selected="selected" value="NO">Select Destination City</option>
	                            <option value="Bangalore">Bangalore</option>
                                    <option value="Goa">Goa</option>
                                    <option value="Gurgaon">Gurgaon</option>
                                    <option value="Kodaikanal">Kodaikanal</option>
                                    <option value="Kolkata">Kolkata</option>
                                    <option value="Manali">Manali</option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="New Delhi">New Delhi</option>
                                    <option value="Ooty">Ooty</option>
                                    <option value="Shimla">Shimla</option>
                                    <option value="Chennai">Chennai</option>
</select></td></tr>                            
                <tr><td width="29%" valign="top">
                    &nbsp; Departure
                </td>
                <td width="68%">
                  <select name="DayFrom">
	<option selected="selected" value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	<option value="18">18</option>
	<option value="19">19</option>
	<option value="20">20</option>
	<option value="21">21</option>
	<option value="22">22</option>
	<option value="23">23</option>
	<option value="24">24</option>
	<option value="25">25</option>
	<option value="26">26</option>
	<option value="27">27</option>
	<option value="28">28</option>
	<option value="29">29</option>
	<option value="30">30</option>
	<option value="31">31</option></select>
         
                    <select name="MonthFrom">
	<option selected="selected" value="January">January</option>
	<option value="February">February</option>
	<option value="March">March</option>
	<option value="April">April</option>
	<option value="May">May</option>
	<option value="June">June</option>
	<option value="July">July</option>
	<option value="August">August</option>
	<option value="September">September</option>
	<option value="October">October</option>
	<option value="November">November</option>
	<option value="December">December</option></select>
                    
                    <select name="YearFrom">
	<option selected="selected" value="2020">2020</option>
	<option value="2021">2021</option>
	<option value="2022">2022</option>
	<option value="2023">2023</option>
	<option value="2024">2024</option>
	<option value="2025">2025</option>
	<option value="2026">2026</option>
        <option value="2027">2027</option>
        <option value="2028">2028</option></select> 
                    
<span><img src="Images/cal.png" title="DD/MM/YYYY" width="24" align="absmiddle"></span>
(DD/MM/YYYY)
   </td></tr>
                 <tr style="display: none"><td colspan="3" align="center" width="250"></td>
              <td><input size="8" name="dy" value="" maxlength="40" type="text">
              </td></tr> 
                 
      <tr><td width="29%"></td>
          <td align="right" width="68%">
      <input name="FlightSearch" src="Images/b_search.gif" type="image"></td>
          <td valign="top" align="right" width="10" height="auto"></td></tr>
             <td valign="top"height="5" width="9"></td></tr>
             </tbody></table></div></form>
                
     <div><table bgcolor="WhiteSmoke" align="center" border="0" cellpadding="0" cellspacing="0" width="350" height="auto">
    <tbody><tr><td colspan="8" align="center"><img src="Images/panel_btm.jpg" height="47" width="100%"></td></tr>
	</tbody></table></div>
                
       <div><table align="center" border="0" cellpadding="0" cellspacing="0" width="350" height="auto">
    <tbody><tr><td><img src="Images/icon_news.gif" height="39" width="290"></td></tr>
      </tbody></table></div>
      
   <div><table align="center" border="0" cellpadding="0" cellspacing="0" width="350" height="auto">
    <tbody><tr><td>&nbsp;</td></tr></tbody></table></div>
  
    <div><table align="center" border="0" cellpadding="0" cellspacing="0" width="350" height="auto">
    <tbody><tr><td><div>
  <marquee scrollamount="1" direction="up" loop="true" onmouseover="this.scrollAmount=0" onmouseout="this.scrollAmount=1" height="125px">
   <ul style="margin-left:15px;">
       <li>All passenger travelling to UAE are requested to have their VISA on ARRIVAL 
message updated from Air India Express in Dubai/Abu Dhabi/Sharjah unless they are carrying the original Visa with them. If the passenger only 
has a photocopy or faxed copy of the Visa, VISA ON ARRIVAL message is mandatory. The airline would not be responsible if same is not 
reflecting in the PNR and Passengers may be denied boarding.</li> <br><br></ul></marquee></div></td></tr>
 </tbody></table></div>
        <div><table align="center" border="0" cellpadding="0" cellspacing="0" width="350" height="auto">
    <tbody><tr><td>&nbsp;</td></tr>
 <tr><td><img src="Images/123.jpg" height="230" width="100%"></img> </td></tr>
 <tr><td><img src="Images/airplane.gif" height="230" width="100%"></img> </td></tr>
</tbody></table></div>

        <td valign="top" align="right" width="600" height="900">
            
      <div><table valign="top" align="center" border="0" cellpadding="0" cellspacing="0" height="100" width="580">                           
     <tbody><tr><td valign="top" align="right" width="580" height="auto">
     <marquee scrollamount="3" loop="true" onmouseover="this.scrollAmount=0" onmouseout="this.scrollAmount=3">
             <a  align="center">
                 <img src="Images/Payday_thumb_tcm61-41705.jpg" height="auto"></img>
                 <img src="Images/HolyWeek_small_tcm61-62345.jpg" height="auto"></img>
                 <img src="Images/hotdealspromofares_tcm61-12454.gif" height="auto"></img>
                 <img src="Images/InsuranceSmall2_tcm61-49505.jpg" height="auto"></img></a>
         	</marquee></td></tr></tbody></table></div>    
         
       <div><table valign="top" align="center" border="0" cellpadding="0" cellspacing="0" height="auto" width="580">                           
     <tbody><tr><td>  
                
        <table valign="top" align="center" border="0" cellpadding="0" cellspacing="0" width="500">
        <tbody><tr><td style="font-size: 20px;" align="center" height="auto" width="auto">
         <div  style="float:left;"><font face="Arial" color="red" >
             <span><b>Airline Tickets  Reservations Cancel Form</b></span>
            </font></div></td></tr></tbody></table>
                            
<table valign="top" align="center" border="0" cellpadding="0" cellspacing="0" width="550">
        <tbody><tr><td>To make your airline tickets reservation,
                     please fill out all fields marked with*.
            </td></tr></tbody></table>
                 
         <div><table width="100%" border="0" cellpadding="2" cellspacing="0">
    <tbody><tr><td colspan="2" bgcolor="E61606">
        <div  style="color: white">
<b>&nbsp;&nbsp;Reservation Cancel form:</b></div></td></tr>

         <tr> <td> &nbsp;</td></tr>
         
         
  <%
  if(tit!="" || nam!="")
           {
    %>
 <table valign="top" align="center" border="0" cellpadding="0" cellspacing="0" width="580">
        <tbody><tr><td style="font-size: 24px;" align="center" height="auto" width=100%>
         <div style="float:none;"><font face="Arial">
            <b><%=tit%>&nbsp;<%=nam%>&nbsp;</b>
            </font></div></td></tr>
	
         <tr><td> &nbsp;</td></tr>
         
         <tr><td style="font-size: 24px;" align="center" height="auto" width=100%>
         <div style="float:none;"><font face="Arial">
            <blink><b>Your Reservation Cancel...</b></blink>
            </font></div></td></tr>

          <tr><td> &nbsp;</td></tr>
          
       <tr><td style="font-size: 25px;" align="center" height="auto" width=100%>
         <div style="float:none;"><font face="Arial">
             <b>Successful...</b>
            </font></div></td></tr></tbody></table>
 
  <%
   }
  if(tit=="" || nam=="")
           {
    %>
 
<table valign="top" align="center" border="0" cellpadding="0" cellspacing="0" width="580">
        <tbody><tr><td style="font-size: 25px;" align="center" height="auto" width=100%>
         <div style="float:none;"><font face="Arial">
             <blink><b>Reservation Number and Ticket Number...</b></blink>
            </font></div></td></tr>
	
         <tr><td> &nbsp;</td></tr>

      <tr><td style="font-size: 25px;" align="center" height="auto" width=100%>
         <div style="float:none;"><font face="Arial">
             <b>Error...</b>
            </font></div></td></tr></tbody></table>  
       <%
          }
      %>                 
        
</tbody></table></div>

                </td></tr></tbody></table></div>
           
              </td></tr>
            
        </td></tr></tbody></table> 
                    

    <table width="950" align="center" border="0" cellpadding="0" cellspacing="0" height="10">
        <tbody><tr><td style="font-size: 10px;"  height="10" width="683">
                <div  style="float:right;">
             <font face="Arial" color="black" >
          <A HREF="#top" style="text-decoration: none; color: red">Go Top</A>
            </td></tr></font></div>
    </tbody></table>
        
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
  </div>
 
 </td></tr></font>
    </tbody></table>
        

</body>
</html>
