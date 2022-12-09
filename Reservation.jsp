<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<html>
<head>
   <title>Airline Reservation System</title>
   
<script language="javascript">
   
	function next()
	{
        if (isNaN(document.f1.payment.value))
	{
            alert(" Age should be in Numericals");	
	    document.f1.payment.value="";
	    document.f1.payment.focus();
            return false;
	 } 
        if (document.f1.payment.value!=document.f1.payrs.value){
	   alert("Error Payment . Please enter your Payment = " + document.f1.payrs.value);
           document.f1.payment.value="";
           document.f1.payment.focus();
            return false;
	   }
        if (document.f1.comments.value.length<2){
	   alert("Please enter your Comments ");
           document.f1.comments.value="";
           document.f1.comments.focus();
	   return false;
	   }
      var d=new Date();
var monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
	   document.f1.TODA.value= d.getDate() + "-" + monthname[d.getMonth()] + "-" + d.getFullYear();
 
         return true;
	}
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
String tlt=request.getParameter("Title");    
String fn=request.getParameter("first_name") + " " + request.getParameter("last_name");
String age=request.getParameter("Age");
String cas=request.getParameter("Schedule");
String sex=request.getParameter("Gender");
String liv=request.getParameter("leaving_from");
String ct=request.getParameter("City");
String sta=request.getParameter("State");
String pin=request.getParameter("Pin_Number");
String phn=request.getParameter("Phone_Number");
String nat=request.getParameter("Nationality");
String pap=request.getParameter("Passport_Number");
String fc=request.getParameter("f_City");
String tc=request.getParameter("t_City");
String dt=request.getParameter("departure_day") + "-" + request.getParameter("departure_mon") + "-" + request.getParameter("departure_year");
String paytp=request.getParameter("paytype");
String payno=request.getParameter("pay_no");

String taka="";
int taka22=0;
String TS="";
String BS="";
String RT="";
String r_no22="";
String t_no22="";
String r_co22="";
String t_co22="";
String r_no="";
String t_no="";

Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con = DriverManager.getConnection("jdbc:ucanaccess://C://Users/acer/Desktop/Airline Reservation System/web/DataBases/AIR.accdb");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from Flight_Information where Origln_City='"+fc+"' and Destination_City='"+tc+"'");

 if(rs.next())

{
            taka=rs.getString("Rs");
            TS=rs.getString("Total_Seat");
            BS=rs.getString("Booked_Seat");
            
                        }
rs.close();

ResultSet que2=st.executeQuery("select * from RT_No");
 if(que2.next())
{
            r_no22=que2.getString("R_Code");
             t_no22=que2.getString("T_Code");
               r_co22=que2.getString("R_Number");
                t_co22=que2.getString("T_Number");
}
que2.close();
st.close();
con.close();

r_no=r_no22+"-"+r_co22;
t_no=t_no22+"-"+t_co22;

int TS1=Integer.parseInt(TS);
int BS1=Integer.parseInt(BS);
        
 if(TS1==BS1)
           {
      RT=("Your Reservation Waiting") ;   
            }
else
       {
      RT=("Your Reservation Successful") ;     
       }

if(cas.equals("UR"))
         {
    taka22=Integer.parseInt(taka); 
          }
else
       {
 if(cas.equals("ST"))
           {
     taka22=80*Integer.parseInt(taka)/100;     
            }
 if(cas.equals("SC"))
           {
    taka22=80*Integer.parseInt(taka)/100; 
            }
 if(cas.equals("OBC"))
           { 
    taka22=85*Integer.parseInt(taka)/100; 
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
             <span><b>Airline Tickets  Reservations Form</b></span>
            </font></div></td></tr></tbody></table>
                            
<table valign="top" align="center" border="0" cellpadding="0" cellspacing="0" width="550">
        <tbody><tr><td>To make your airline tickets reservation,
                     please fill out all fields marked with*.
            </td></tr></tbody></table>
                 
         <div><table width="100%" border="0" cellpadding="2" cellspacing="1">
    <tbody><tr><td colspan="2" bgcolor="E61606">
        <div  style="color: white">
<b>&nbsp;&nbsp;Reservation form:</b></div></td></tr></tbody></table></div>
        
         <form name="f1" method="post" action="Reservation1.jsp">
       
          <table width="100%" border="0" cellpadding="2" cellspacing="1">
              <tbody><tr><td align="right" width="250">Reservation Type:</td>
                      <td><input size="40" value="<%=RT%>" name="Reservation_Type" maxlength="19" type="text" readonly>
              </td></tr>
                  
                  <tr><td align="right" width="250">* Payment:</td>
                      <td><input size="40" name="payment" maxlength="6" type="text"><td align="left" width="150">Rs <%=taka22%></td>
              </td></tr>
              
     <tr><td align="right" valign="top" width="250">* Comments:</td>
              <td><textarea name="comments" cols="30" rows="3"></textarea>
              </td></tr>
     
     <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="r_co" maxlength="10" type="text" value="<%=r_co22%>">
              </td></tr>
     
     <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="t_co" maxlength="10" type="text" value="<%=t_co22%>">
              </td></tr>
     
     <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="payrs" maxlength="10" type="text" value="<%=taka22%>">
              </td></tr>
      
        <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="Title1" maxlength="40" type="text" value="<%=tlt%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="name1" maxlength="40" type="text" value="<%=fn%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="Age1" maxlength="40" type="text" value="<%=age%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="Schedule1" maxlength="40" type="text" value="<%=cas%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="Gender1" maxlength="40" type="text" value="<%=sex%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="leaving_from1" maxlength="40" type="text" value="<%=liv%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="City1" maxlength="40" type="text" value="<%=ct%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="State1" maxlength="40" type="text" value="<%=sta%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="Pin_Number1" maxlength="40" type="text" value="<%=pin%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="Phone_Number1" maxlength="40" type="text" value="<%=phn%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="Nationality1" maxlength="40" type="text" value="<%=nat%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="Passport_Number1" maxlength="40" type="text" value="<%=pap%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="f_City1" maxlength="40" type="text" value="<%=fc%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="t_City1" maxlength="40" type="text" value="<%=tc%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="date1" maxlength="40" type="text" value="<%=dt%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="paytype1" maxlength="40" type="text" value="<%=paytp%>">
              </td></tr>
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="pay_no1" maxlength="40" type="text" value="<%=payno%>">
              </td></tr>
    <tr style="display: none"><td></td>
              <td><input size="30" value="<%=t_no%>" name="Ticket_Number" maxlength="40" type="text" readonly></td></tr>
              
    <tr style="display: none"><td></td>
                  <td><input size="30" value="<%=r_no%>" name="Reservations_Number" maxlength="40" type="text" readonly></td></tr>
      
   <tr style="display: none"><td colspan="3" align="center" width="250"></td>
         <td><input size="8" name="TODA" maxlength="40" type="text">
              </td></tr>

     <tr><td colspan="3" align="center" width="250">
             <input name="A4" value="Submit" input type="submit" onclick="return next()">
                   <input value="Reset" input type="reset"></td></tr>
     
              </tbody></table> 
     </form>
  
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
