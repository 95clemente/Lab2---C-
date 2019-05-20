<!-- Mercy Clemente
JMU HONOR CODE: By submitting this Lab I pledge to abide by the JMU honor code. 
I have neither received nor given help on this assignment. -->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lab1.aspx.cs" Inherits="Lab1" %>

<!DOCTYPE html>
<p>
&nbsp;
</p>
​<script runat="server">

     protected void Page_Load(object sender, EventArgs e)
     {

         if (txtCountry.Text == "United States" || txtCountry.Text =="USA" || txtCountry.Text =="US" || txtCountry.Text=="U.S.A" || txtCountry.Text =="U.S." || txtCountry.Text =="usa" || txtCountry.Text=="United States of America" || txtCountry.Text=="united states" || txtCountry.Text=="united states of america")
         {
             DropDownState.Enabled = true;
         }
         else
         {
             DropDownState.Enabled = false;
         }

         string JQueryVer = "1.11.13";


         ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
         new ScriptResourceDefinition
         {
             Path = "~/js/jquery-" + JQueryVer + ".min.js",
             DebugPath = "/js/jquery" + JQueryVer + ".min.js",
             CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".min.js",
             CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".js",
             CdnSupportsSecureConnection = true,
             LoadSuccessExpression = "window.jQuery"
         });
     }


     //Validate lengths
     protected void TextValidate(object source, ServerValidateEventArgs args)
     {
         args.IsValid = (args.Value.Length >= 1);
     }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab1 - Mercy Clemente</title>
 
</head>
    
<body>
    <configuration>
    <appSettings>
        <add key="ValidationSettings:UnobtrusiveValidationMode" value="None" />

    </appSettings>
</configuration>
    <style>
        body
        { 
            background-color:#cceeff;   
        }
        h1{font-variant:small-caps;}
        h3{font-variant:small-caps;}
    </style>

    <configuration>
    <appSettings>
        <add key="ValidationSettings:UnobtrusiveValidationMode" value="None" />
    </appSettings>
</configuration>

    <form id="form1" runat="server">

        <section style="height: 876px">
            &nbsp;

    <center><h1> Student Enrollment Form </h1>
        <p> 
            <asp:Label ID="errorMessage" runat="server" Text="Student already exists" Visible="false" ForeColor="red"></asp:Label>
        </p></center>
            <!--Mercy Clemente-->
            <section id="PersonalInfo">
                <h3>Enter Personal Information </h3>
                &nbsp;<br />
                &nbsp;
        First Name:<asp:TextBox ID="FirstName" placeholder="Required" runat="server" pattern="[A-Za-z]{1,30}" title="Between 1-30 characters" ValidationGroup="validate" Width="210px" Style="margin-left: 25px; margin-right: 6px; margin-bottom: 0px;" Height="22px"></asp:TextBox>
            <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" 
            runat="server" 
            ControlToValidate="FirstName"
            Text="* Required"
            ForeColor="Red"></asp:RequiredFieldValidator>
                <%--pattern="[A-Za-z]{1,25}" title="Between 1-50 characters"--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              Middle Name:&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:TextBox ID="MiddleName" runat="server" Width="210px" Height="22px" Style="margin-right: 0px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Last Name:&nbsp;       
    <asp:TextBox ID="LastName" runat="server" placeholder="Required" pattern="[A-Za-z]{1,30}" title="Between 1-30 letters" ValidationGroup="validate" Width="210px" Height="22px"></asp:TextBox>
               <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2" 
            runat="server" 
            ControlToValidate="LastName"
            Text="* Required"
            ForeColor="Red"></asp:RequiredFieldValidator>

                <br />
                <br />
    Date of Birth:&nbsp;&nbsp; &nbsp; <asp:TextBox ID="txtDOB" runat="server" Width="210px" Type ="Date" 
        placeholder ="mm/dd/yyyy"

        pattern ="(?:(?:0[1-9]|1[0-2])[\/\\-. ]?(?:0[1-9]|[12][0-9])|(?:(?:0[13-9]|1[0-2])[\/\\-. ]?30)|(?:(?:0[13578]|1[02])[\/\\-. ]?31))[\/\\-. ]?(?:19|20)[0-9]{2}"
        title ="Enter correct format mm/dd/yyyy"
        ></asp:TextBox>
    <asp:CompareValidator ID="Valid" runat="server" Operator="DataTypeCheck"
        Type="Date" ControlToValidate="txtDOB" ErrorMessage="Please enter mm/dd/yyyy"
        ForeColor = "red"  Height="22px" Width="210px" 
        />

    
    <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator3" 
            runat="server" 
            ControlToValidate="txtDOB"
            Text="Required"
            ForeColor="Red"
      
        >
    </asp:RequiredFieldValidator>
                <asp:RangeValidator ID="dobValidation" runat="server"
                        ControlToValidate="txtDOB"
                        ErrorMessage="Must be 16-70 years old"
                        MaximumValue="1/1/2003" 
                        MinimumValue="1/1/1949" 
                        Type="Date"
                        ValidationGroup="validate"
                        ForeColor ="red">
</asp:RangeValidator>
                
                <asp:TextBox ID="txtAge" runat="server" BackColor="#CCEEFF" BorderStyle="None" Height="22px" OnTextChanged="txtAge_TextChanged" Width="210px" TabIndex="200"></asp:TextBox>
                <br />
                <asp:Label ID="Age" runat="server" Text='<%#Session["age"]%>'></asp:Label>
           
                <br />
            </section>
   <section id="AddressInfo">
     <h3>Enter Address Information </h3>
                Home Number:
                    &nbsp;&nbsp;      
 <asp:TextBox ID="HomeNumber" runat="server" placeholder="Required" pattern="[0-9]{0,9}+" title="9 Digit #" ValidationGroup="validate" Width="210px" Style="margin-right: 1px; margin-bottom: 0px;" OnTextChanged="HomeNumber_TextChanged" Height="22px"></asp:TextBox>
                 <asp:RangeValidator ID="RangeValidator13" runat="server" ControlToValidate="HomeNumber" ErrorMessage="*" MaximumValue="999999999" MinimumValue="1" Type="Integer" ForeColor="Red"></asp:RangeValidator>
                 <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator4" 
            runat="server" 
            ControlToValidate="HomeNumber"
            Text="Required"
            ForeColor="Red"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Street: <asp:TextBox ID="Street" runat="server" placeholder="Required" pattern="([A-Za-z])+{1,30}" title="Between 1-30 letters" ValidationGroup="validate" Width="277px" Style="margin-left: 5px" Height="22px" MaxLength="30"></asp:TextBox>
           <asp:RequiredFieldValidator
               ID="RequiredFieldValidator20"
               runat ="server"
               ControlToValidate ="street"
               ForeColor ="red">* Required</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtArray" runat="server" Width="337px" BackColor="#CCEEFF" BorderStyle="None"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        City:<asp:TextBox ID="CityCounty" runat="server" placeholder="Required" pattern="[A-Za-z]{1,30}" title="Between 1-30 letters" ValidationGroup="validate" Width="210px" Style="margin-left: 15px" Height="22px"></asp:TextBox>
                 <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator6" 
            runat="server" 
            ControlToValidate="CityCounty"
            Text="* Required"
            ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country:<asp:TextBox ID="txtCountry" runat="server" AutoPostBack="True" Height="22px" Width="210px" style="margin-left: 13px" placeholder ="Required"></asp:TextBox>
    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtCountry" ErrorMessage="*" pattern="([A-Za-z]+{1,30}" ForeColor="Red">* Required</asp:RequiredFieldValidator>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     Zip:<asp:TextBox ID="Zip" runat="server" placeholder="Required" pattern="[0-9]{0,9}+" title="9 Digit #" ValidationGroup="validate" Width="210px" Style="margin-left: 23px" Height="22px" MaxLength="9" TextMode="Number"></asp:TextBox>
                 <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator8" 
            runat="server" 
            ControlToValidate="Zip"
            Text="* Required"
            ForeColor="Red"></asp:RequiredFieldValidator>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;State:
   <!--Mercy Clemente -->      
                <asp:DropDownList ID="DropDownState" runat="server" OnSelectedIndexChanged="DropDownState_SelectedIndexChanged" Height="25px" Style="margin-left: 11px" Width="210px" AutoPostBack="True">
           <asp:ListItem>Select State </asp:ListItem>
           <asp:ListItem Value="AL">Alabama</asp:ListItem>
           <asp:ListItem Value=" AK">Alaska </asp:ListItem>
           <asp:ListItem Value="AZ">Arkansas </asp:ListItem>
           <asp:ListItem Value="AR">Arizona </asp:ListItem>
           <asp:ListItem Value="CA">Colorado </asp:ListItem>
           <asp:ListItem Value="CO">California</asp:ListItem>
           <asp:ListItem Value="CT">Delaware </asp:ListItem>
           <asp:ListItem Value="DE">Connecticut</asp:ListItem>
           <asp:ListItem Value="FL">Georgia</asp:ListItem>
           <asp:ListItem Value="GA">Florida </asp:ListItem>
           <asp:ListItem Value="HI">Idaho </asp:ListItem>
           <asp:ListItem Value="ID">Hawaii </asp:ListItem>
           <asp:ListItem Value="IL">Indiana </asp:ListItem>
           <asp:ListItem Value="IN">Illinois</asp:ListItem>
           <asp:ListItem Value="IA">Kansas </asp:ListItem>
           <asp:ListItem Value="KS">Iowa </asp:ListItem>
           <asp:ListItem Value="KY">Louisiana </asp:ListItem>
           <asp:ListItem Value="LA">Kentucky</asp:ListItem>
           <asp:ListItem Value="ME">Maryland</asp:ListItem>
           <asp:ListItem Value="MD">Maine </asp:ListItem>
           <asp:ListItem Value="MA">Michigan </asp:ListItem>
           <asp:ListItem Value="MI">Masachusetts</asp:ListItem>
           <asp:ListItem Value="MN">Mississippi </asp:ListItem>
           <asp:ListItem Value="MS">Minnesota</asp:ListItem>
           <asp:ListItem Value="MO">Montana </asp:ListItem>
           <asp:ListItem Value="MT">Missouri</asp:ListItem>
           <asp:ListItem Value="NE">Nevada </asp:ListItem>
           <asp:ListItem Value="NV">Nebraska </asp:ListItem>
           <asp:ListItem Value="NH">New Jersey</asp:ListItem>
           <asp:ListItem Value="NJ">New Hampshire</asp:ListItem>
           <asp:ListItem Value="NM">New York</asp:ListItem>
           <asp:ListItem Value="NY">New Mexico </asp:ListItem>
           <asp:ListItem Value="NC">North Dakota </asp:ListItem>
           <asp:ListItem Value="ND">North Carolina </asp:ListItem>
           <asp:ListItem Value="OH">Oklahoma </asp:ListItem>
           <asp:ListItem Value="OK">Ohio </asp:ListItem>
           <asp:ListItem Value="OR">Pennsylvania</asp:ListItem>
           <asp:ListItem Value="PA">Oregon </asp:ListItem>
           <asp:ListItem Value="RI">South Carolina</asp:ListItem>
           <asp:ListItem Value="SC">Rhode Island</asp:ListItem>
           <asp:ListItem Value="SD">Tennessee </asp:ListItem>
           <asp:ListItem Value="TN">South Dakota </asp:ListItem>
           <asp:ListItem Value="TX">Utah </asp:ListItem>
           <asp:ListItem Value="UT">Texas </asp:ListItem>
           <asp:ListItem Value="VT">Virginia </asp:ListItem>
           <asp:ListItem Value="VA">Vermont </asp:ListItem>
           <asp:ListItem Value="WA">West Virginia </asp:ListItem>
           <asp:ListItem Value="WV">Washington </asp:ListItem>
           <asp:ListItem Value="WI">Wyoming </asp:ListItem>
           <asp:ListItem Value="WY">Wisconsin</asp:ListItem>
       </asp:DropDownList>
                <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator7" 
            runat="server" 
            ControlToValidate="DropDownState"
            Text="*"
            ForeColor="Red"
        ValidationGroup ="validate">
    </asp:RequiredFieldValidator>
    
                <br>&nbsp;</br>
            </section>
<!--MercyClemente-->
            <section id="AcademicInfo">
                <h3>Enter Academic Information</h3>
                &nbsp;Academic Year:<asp:DropDownList ID="DropDownListAcademicYr" runat="server" Width="210px" Style="margin-left: 11px; margin-top: 0px;" Height="25px">
                    <asp:ListItem>Select Academic Year </asp:ListItem>
                    <asp:ListItem>Freshman</asp:ListItem>
                    <asp:ListItem>Sophomore</asp:ListItem>
                    <asp:ListItem>Junior</asp:ListItem>
                    <asp:ListItem>Senior</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator10" 
            runat="server" 
            ControlToValidate="DropDownListAcademicYr"
            Text="* Required"
            ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="StudentID" runat="server" Style="margin-left: 14px" Width="210px" Height="22px" BackColor="#CCEEFF" Enabled="False" ForeColor="Black" OnTextChanged="StudentID_TextChanged" Visible="False" BorderStyle="None"></asp:TextBox>

                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; School:&nbsp;<asp:DropDownList ID="SchoolName" runat="server" Height="25px" style="margin-left: 1px" Width="210px" OnSelectedIndexChanged="Activities_SelectedIndexChanged" DataTextField="SchoolName"  DataValueField="SchoolID" DataSourceID="SqlDataSource1">
                    <asp:ListItem>Select Activity</asp:ListItem>
                </asp:DropDownList>
           
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab1ConnectionString %>" SelectCommand="SELECT [SchoolName], [SchoolID] FROM [School]"></asp:SqlDataSource>
           
                &nbsp;<asp:RequiredFieldValidator ID="schoolNameValidator" runat="server" ControlToValidate="SchoolName" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                &nbsp;<br />
                &nbsp;
                Activity Name:&nbsp;<asp:DropDownList ID="Activities" runat="server" Height="25px" style="margin-left: 4px" Width="210px" OnSelectedIndexChanged="Activities_SelectedIndexChanged" DataTextField="ActivityDescription"  DataValueField="ActivityID" DataSourceID="SqlDataSource4">
                    <asp:ListItem>Select Activity</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Lab1ConnectionString %>" SelectCommand="SELECT [ActivityDescription], [ActivityID] FROM [Activity]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="Activities" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                   
                &nbsp;<asp:TextBox ID="TextBox1" runat="server" style="margin-left: 673px" Width="210px" BackColor="#CCEEFF" BorderStyle="None" Height="22px"></asp:TextBox>
                   
                <br />
                <br />
                <br />
            </section>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnExit" runat="server" Height="30px" OnClick="btnExit_Click" Text="Exit" Width="80px" CausesValidation="false" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="btnClear" runat="server" Style="margin-left: 0px" Text="Clear" Width="80px" OnClick="btnClear_Click" Height="30px" CausesValidation="false" />
            <asp:Button ID="btnCommit" runat="server" Style="margin-left: 79px" Text="Commit" Height="30px" Width="80px" OnClick="btnCommit_Click" />
            <asp:Button ID="btnPopulate" runat="server" Style="margin-left: 81px" Text="Populate" Height="30px" OnClick="btnPopulate_Click" Width="80px" CausesValidation="false" />
            <asp:Button ID="Insert" runat="server" Height="30px" style="margin-left: 65px" Text="Insert" Width="80px" OnClick="Insert_Click" CausesValidation =" true"/>
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Last Updated:
    <asp:TextBox ID="txtLastUpdated" runat="server" Enabled="False" Height="22px" Style="margin-left: 14px" Width="210px" TextMode="DateTimeLocal" OnTextChanged="txtLastUpdated_TextChanged" BackColor="#CCEEFF" ForeColor="Black" BorderStyle="None"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
   Last Updated By:
   <asp:TextBox ID="LastUpdatedBy" runat="server" Enabled="False" Height="22px" Style="margin-left: 11px" Width="210px" BackColor="#CCEEFF" ForeColor="Black" ReadOnly="True" BorderStyle="None">        Mercy Clemente</asp:TextBox>
        </section>
    </form>
    <footer style="height: 150px">
        <small>
        <br />
        Mercy Clemente - &copy 2019</small>
        <br />
        <center> <a href="Default.aspx"> HOME</a></center>
    </footer>
</body>
</html>
