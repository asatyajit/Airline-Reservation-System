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
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con1 = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");
Statement state4=con1.createStatement();

String rnor1="";
String tnor1="";
String wtb="";

ResultSet que2=state4.executeQuery("select * from RT_No");
 if(que2.next())
{
    rnor1=que2.getString("R_Number");
     tnor1=que2.getString("T_Number");
      wtb=que2.getString("R_Code");
      
    }

que2.close();
state4.close();
con1.close();


   %>
    
    <% 
String tlt1=request.getParameter("Title1");    
String fn1=request.getParameter("name1");
String age1=request.getParameter("Age1");
String cas1=request.getParameter("Schedule1");
String sex1=request.getParameter("Gender1");
String liv1=request.getParameter("leaving_from1");
String ct1=request.getParameter("City1");
String sta1=request.getParameter("State1");
String pin1=request.getParameter("Pin_Number1");
String phn1=request.getParameter("Phone_Number1");
String nat1=request.getParameter("Nationality1");
String pap1=request.getParameter("Passport_Number1");
String fc1=request.getParameter("f_City1");
String tc1=request.getParameter("t_City1");
String dt1=request.getParameter("date1");
String paytp1=request.getParameter("paytype1");
String chno=request.getParameter("pay_no1");
String taka1=request.getParameter("payment");
String cmm1=request.getParameter("comments");
String today1=request.getParameter("TODA");
String RT1=request.getParameter("Reservation_Type");
String r_no1=request.getParameter("Reservations_Number");
String t_no1=request.getParameter("Ticket_Number");
String r_co1=request.getParameter("r_co");
String t_co1=request.getParameter("t_co");

String fno="";
String fna="";
String cap="";
String dp_time="";
String crp="";
String buk="";
String wbuk="";

Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");
Statement state=con.createStatement();
Statement state1=con.createStatement();
Statement state2=con.createStatement();

 try
      {
 
ResultSet que=state.executeQuery("select * from Flight_Information where Origln_City='"+fc1+"' and Destination_City='"+tc1+"'");
 if(que.next())
{
            fno=que.getString("Flight_No");
             fna=que.getString("Flight_Name");
              dp_time=que.getString("Departure_Time");
               cap=que.getString("Total_Seat");
                buk=que.getString("Booked_Seat");
                 wbuk=que.getString("Waiting_Seat");
}
que.close();

state.executeUpdate("insert into Reservation(Title,Name,Age,Schedule,Gender,Address,City,State,Pin_Number,Phone_Number,Nationality,Passport_Number,f_From,f_To,Paytype,pay_no,Payment,Comments,Ticket_No,Reservations_No,Flight_No,Flight_Name,Departure_Time,Departure_Date,Reservations_Date,Reservations_type) "
        + "values('"+tlt1+"','"+fn1+"','"+age1+"','"+cas1+"','"+sex1+"','"+liv1+"','"+ct1+"','"+sta1+"','"+pin1+"','"+phn1+"','"+nat1+"','"+pap1+"','"+fc1+"','"+tc1+"','"+paytp1+"','"+chno+"','"+taka1+"','"+cmm1+"','"+t_no1+"','"+r_no1+"','"+fno+"','"+fna+"','"+dp_time+"','"+dt1+"','"+today1+"','"+RT1+"')");  

//que1.close();
state.close();
      
      }
 
 catch(Exception e)
        {
          
        }
       finally
        {
            con.close();
           
        }
       
int tnor2=Integer.parseInt(t_co1)+1;
int rnor2=Integer.parseInt(r_co1)+1;
String tnor3=Integer.toString(tnor2);
String rnor3=Integer.toString(rnor2);
 
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con12 = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");

String sql = "UPDATE RT_No" + " SET R_Number='" +rnor3+ "'," + " T_Number='" +tnor3+ "'";
Statement state42=con12.createStatement();
int i = state42.executeUpdate(sql);
state42.close();
con12.close();

int buk1=0;
int wbuk1=0;
String TS="";
String BS="";
String RT="";
String buk2="";
String wbuk2="";

int buk19=Integer.parseInt(buk);
int cap19=Integer.parseInt(cap);

if (buk19==cap19)
{
wbuk1=Integer.parseInt(wbuk)+1;
wbuk2=Integer.toString(wbuk1);
buk2=buk;
}
else
 {
 buk1=Integer.parseInt(buk)+1; 
 buk2=Integer.toString(buk1);
 wbuk2=wbuk;
}

Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con14 = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");

String sql1 = "UPDATE Flight_Information" + " SET Booked_Seat='" +buk2+ "'," + " Waiting_Seat='" +wbuk2+ "'" + " WHERE Flight_No='" +fno+ "'";
Statement state40=con14.createStatement();
int h = state40.executeUpdate(sql1);
state40.close();
con14.close();


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
             <span><b>Airline Tickets  Reservations Form</b></span>
            </font></div></td></tr></tbody></table>
                            
<table valign="top" align="center" border="0" cellpadding="0" cellspacing="0" width="550">
        <tbody><tr><td>To check your airline tickets reservation,
                     please print out the ticket.
            </td></tr></tbody></table>
           
     <table valign="top" align="center" border="0" cellpadding="0" cellspacing="0" width="580">
        <tbody><tr><td style="font-size: 25px; background-color:#CC99CC" align="center" height="auto" width=100%>
         <div style="float:none;"><font face="Arial">
             <blink><b><%=RT1%>...</b></blink>
            </font></div></td></tr></tbody></table>         
         
     <form name="f3" method="" action="">
       
          <table width="100%" border="0" cellpadding="2" cellspacing="1">
    <tbody><tr><td align="right"> Name:</td>
            <td><input size="30" value="<%=tlt1%>&nbsp;<%=fn1%>"name="f_name" maxlength="40" type="text" readonly></td></tr>  
        
        <tr><td align="right">Ticket Number:</td>
              <td><input size="30" value="<%=t_no1%>" name="Ticket_Number1" maxlength="40" type="text" readonly></td></tr>
              
              <tr><td align="right">Reservations Number:</td>
                  <td><input size="30" value="<%=r_no1%>" name="Reservations_Number1" maxlength="40" type="text" readonly></td></tr>
             
              <tr><td align="right">Flight Number:</td>
                  <td><input size="30" value="<%=fno%>" name="Flight_Number" maxlength="40" type="text" readonly></td></tr>
              
              <tr><td align="right">Flight Name:</td>
                  <td><input size="30" value="<%=fna%>" name="Flight_Name" maxlength="40" type="text" readonly></td></tr>
              
              <tr><td align="right">Departure Date:</td>
                  <td><input size="30" value="<%=dt1%>" name="Reservations_Number" maxlength="40" type="text" readonly></td></tr>
              
              <tr><td align="right">Departure Time:</td>
                  <td><input size="30" value="<%=dp_time%>" name="Reservations_Number" maxlength="40" type="text" readonly></td></tr>
              
              <tr><td align="right">Reservations Date:</td>
                  <td><input size="30" value="<%=today1%>" name="Reservations_Number" maxlength="40" type="text" readonly></td></tr>
             
     <tr><td colspan="3" align="center">
             <input name="A3" value="&nbsp;&nbsp; Print &nbsp;&nbsp;" input type="button" onclick="javascript:window.print();">
              </td></tr>
           </form>
              </tbody></table> 
     
                </td></tr></tbody></table></div>
           
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
