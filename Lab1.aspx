<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lab1.aspx.cs" Inherits="Lab1" %>

<!DOCTYPE html>
​<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //cmpHired.ValuetoCompare = DateTime.Now.ToString("mm-dd-yyyy");

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
    <style>
        body
        { 
            background-color:#99ccff;   
        }
    </style>

    <form id="form1" runat="server">

        <section style="height: 876px">
            &nbsp;

    <center> <h2> Student Enrollment Form </h2></center>

            <section id="PersonalInfo">
                <h3>Enter Personal Information </h3>
                &nbsp;<br />
                &nbsp;
        First Name:<asp:TextBox ID="FirstName" runat="server" pattern="[A-Za-z]{1,30}" title="Between 1-30 characters" ValidationGroup="validate" Width="210px" Style="margin-left: 25px; margin-right: 99px; margin-bottom: 0px;" Height="22px"></asp:TextBox>
                &nbsp;
              Middle Name:&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:TextBox ID="MiddleName" runat="server" Width="210px" Height="22px" Style="margin-right: 33px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Last Name:&nbsp;       
    <asp:TextBox ID="LastName" runat="server" pattern="[A-Za-z]{1,30}" title="Between 1-30 letters" ValidationGroup="validate" Width="210px" Height="22px"></asp:TextBox>
                <br />
                <br />
                Date of Birth:&nbsp;
  <asp:TextBox ID="DoB" runat="server" pattern="[A-Za-z]{1,30}" title="Between 1-30 characters" ValidationGroup="validate" Width="210px" OnTextChanged="DoB_TextChanged" Style="margin-left: 9px"></asp:TextBox>
                <br />
                <br />
            </section>
            <section id="AddressInfo">
                <h3>Enter Address Information </h3>
                Home Number:
                    &nbsp;&nbsp;      
 <asp:TextBox ID="HomeNumber" runat="server" pattern="[A-Za-z]{1,30}" title="Between 1-30 characters" ValidationGroup="validate" Width="208px" Style="margin-right: 1px; margin-bottom: 0px;" OnTextChanged="HomeNumber_TextChanged"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        Street: 
    <asp:TextBox ID="Street" runat="server" pattern="[A-Za-z]{1,30}" title="Between 1-30 letters" ValidationGroup="validate" Width="277px" Style="margin-left: 5px" Height="22px"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        City:<asp:TextBox ID="CityCounty" runat="server" pattern="[A-Za-z]{1,30}" title="Between 1-30 letters" ValidationGroup="validate" Width="210px" Style="margin-left: 15px" Height="22px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       State:<asp:DropDownList ID="DropDownState" runat="server" OnSelectedIndexChanged="DropDownState_SelectedIndexChanged" Height="22px" Style="margin-left: 11px" Width="210px">
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
           <asp:ListItem Value="MO">Montanta </asp:ListItem>
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
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     Zip:<asp:TextBox ID="Zip" runat="server" pattern="[A-Za-z]{1,30}" title="Between 1-9 characters" ValidationGroup="validate" Width="210px" Style="margin-left: 23px" Height="22px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country:
         <asp:DropDownList ID="ListCountry" runat="server" Height="22px" Width="210px" Style="margin-left: 9px">
             <asp:ListItem>Select Country</asp:ListItem>
         </asp:DropDownList>
                <br></br>
            </section>

            <section id="AcademicInfo">
                <h3>Enter Academic Information</h3>
                <br />
                Academic Year:<asp:DropDownList ID="DropDownListAcademicYr" runat="server" Width="210px" Style="margin-left: 11px" Height="22px">
                    <asp:ListItem>Select Academic Year </asp:ListItem>
                    <asp:ListItem>Freshman</asp:ListItem>
                    <asp:ListItem>Sophomore</asp:ListItem>
                    <asp:ListItem>Junior</asp:ListItem>
                    <asp:ListItem>Senior</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
              <br />
                <br />
                Student ID:<asp:TextBox ID="StudentID" runat="server" Style="margin-left: 36px" Width="210px" Height="22px"></asp:TextBox>


                <br />
                <br />
                School Name:<asp:TextBox ID="SchoolName" runat="server" Style="margin-left: 19px" Width="210px" Height="22px"></asp:TextBox>
                &nbsp;
              <br />
                <br />
                School ID:<asp:TextBox ID="SchoolID" runat="server" Width="210px" Height="22px" Style="margin-left: 39px"></asp:TextBox>

                <br />
                <br />
                <br />
            </section>

            <asp:Button runat="server" ID="Commit" Text="Commit" ValidationGroup="validate" OnClick="Commit_Click" Style="margin-left: 322px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnExit" runat="server" Height="27px" OnClick="btnExit_Click" Text="Exit" Width="63px" />
            <asp:Button ID="btnClear" runat="server" Style="margin-left: 82px" Text="Clear" Width="72px" OnClick="btnClear_Click" />
            <asp:Button ID="btnCommit" runat="server" Style="margin-left: 79px" Text="Commit" />
            <asp:Button ID="btnPopulate" runat="server" Style="margin-left: 106px" Text="Populate" />
            <br />
            <br />
            <br />
            Last Updated:
    <asp:TextBox ID="txtLastUpdated" runat="server" Enabled="False" Height="22px" Style="margin-left: 14px" Width="210px" TextMode="DateTimeLocal"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
   Last Updated By:
   <asp:TextBox ID="LastUpdatedBy" runat="server" Enabled="False" Height="22px" Style="margin-left: 11px" Width="210px">Mercy Clemente</asp:TextBox>
        </section>
        <p>
            &nbsp;
        </p>
    </form>
    <footer>
        <small>Mercy Clemente - &copy 2019</small>
    </footer>
</body>
</html>
