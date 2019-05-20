using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// Mercy Clemente
/// JMU HONOR CODE: By submitting this Lab I pledge to abide by the JMU honor code. 
/// I have neither received nor given help on this assignment. 
/// //ADJUSTED THE ORDER OF INSERT STATEMENT TO COINCIDE WITH HOW THE DATABASE BASED OFF OF PROFESSOR COLE'S INSERT STATEMENTS WERE SETUP 

public partial class Lab1 : System.Web.UI.Page
{
    Student[] studentArray = new Student[3];
    int max = 1;
    int counter = 0;
    public static int var = 0;
    public static int count; 

    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {

        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        try
        {
            sc.ConnectionString = @"Server=localhost;Database=Lab1;Trusted_Connection=Yes;";
        }
        catch
        {
            txtAge.Text = "NO";
        }
        ++max;
    }


    protected void Insert_Click(object sender, EventArgs e)
    {
        ++max;
        count++;
        createInsert();
       
        //DOB Validation
        dobValidation.MinimumValue = DateTime.Today.AddYears(-70).AddDays(1).ToShortDateString();
        dobValidation.MaximumValue = DateTime.Today.AddYears(-16).AddDays(1).ToShortDateString();
        if(var==2)
        {
            txtArray.Text = "Array is Full";
        }
        var++;
    }
    protected void btnCommit_Click(object sender, EventArgs e)
    {
        ++max;
        count++;
        createCommit();
        var = 0;
    }
    public void createInsert()
    {
        //clearStudent();
        //Commit students 

        //Database connection
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = "Server=localhost;Database=Lab1;Trusted_Connection=Yes;";
        sc.Open();



        //Select max ID and add one to it 
        System.Data.SqlClient.SqlCommand MAX = new System.Data.SqlClient.SqlCommand();
        MAX.Connection = sc;
        MAX.CommandText = "Select MAX(StudentID) FROM Student";
        MAX.ExecuteNonQuery();
        max += count;


        System.Data.SqlClient.SqlCommand delete = new System.Data.SqlClient.SqlCommand();
        delete.Connection = sc;

        delete.CommandText = "Delete FROM [dbo].[StudentActivity]";
        delete.ExecuteNonQuery();

        delete.CommandText = "Delete FROM [dbo].[Student]";
        delete.ExecuteNonQuery();


        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;


        //Check database for existing person
        System.Data.SqlClient.SqlCommand getname = new System.Data.SqlClient.SqlCommand();
        getname.Connection = sc;
        getname.CommandText = "Select FirstName,LastName FROM [dbo].[Student] where FirstName like '%' + @firstName + '%' AND LastName like '%' + @lastname + '%'";
        getname.Parameters.AddWithValue("@firstName", FirstName.Text);
        getname.Parameters.AddWithValue("@lastname", LastName.Text);
        //int name = (int)(getname.ExecuteScalar());


        if (getname.ExecuteScalar() == null)
        {


            System.Data.SqlClient.SqlCommand insertID = new System.Data.SqlClient.SqlCommand();
            insertID.Connection = sc;

            //////Taking text from textboxes and appyling to sql statements
            String first = FirstName.Text;
            String last = LastName.Text;
            String middle = MiddleName.Text;
            String houseNum = HomeNumber.Text;
            String street = Street.Text;
            String city = CityCounty.Text;
            String state = DropDownState.SelectedValue;
            String zip = Zip.Text;
            String country = txtCountry.Text;
            String aYr = DropDownListAcademicYr.SelectedValue;
            String st_ID = StudentID.Text;
            String by = LastUpdatedBy.Text;
            DateTime lastupdated = DateTime.Now;
            DateTime dob = Convert.ToDateTime(txtDOB.Text);
            int schoolID = Convert.ToInt32(SchoolName.SelectedValue);
            int activityID = Convert.ToInt32(Activities.SelectedValue);


            ////Insert Student into table  
            //insert.CommandText = "INSERT INTO [dbo].[Student](StudentID,FirstName,LastName,MiddleName, HouseNumber, Street,CityCounty,HomeState,Country, Zip,DateOfBirth,AcademicYear, LastUpdatedBy,LastUpdated,SchoolID) values " +
            //    "(@id,@first,@last,@middle,@house, @street,@city, @state, @country,@zip, @dob, @aYr,@by,@updated,@schoolid)";
            //insert.Parameters.AddWithValue("@id", max);
            //insert.Parameters.AddWithValue("@first", first);
            //insert.Parameters.AddWithValue("@last", last);
            //insert.Parameters.AddWithValue("@middle", middle);
            //insert.Parameters.AddWithValue("@house", houseNum);
            //insert.Parameters.AddWithValue("@street", street);
            //insert.Parameters.AddWithValue("@city", city);
            //insert.Parameters.AddWithValue("@state", state);
            //insert.Parameters.AddWithValue("@country", country);
            //insert.Parameters.AddWithValue("@zip", zip);
            //insert.Parameters.AddWithValue("@dob", dob);
            //insert.Parameters.AddWithValue("aYr", aYr);
            //insert.Parameters.AddWithValue("@by", by);
            //insert.Parameters.AddWithValue("@updated", lastupdated);
            //insert.Parameters.AddWithValue("@schoolid", schoolID);

            //insert.ExecuteNonQuery();

               //INSERT INTO ACTIVITY
            //System.Data.SqlClient.SqlCommand insertAct = new System.Data.SqlClient.SqlCommand();
            //insertAct.Connection = sc;
            //insertAct.CommandText = "INSERT INTO [dbo].[Activity](ActivityID,ActivityDescription,LastUpdatedBy,LastUpdated)" +
            //  "values (@param20,@param21,@param22,@param23)";
            //insertAct.Parameters.AddWithValue("param20", Activities.SelectedIndex);
            //insertAct.Parameters.AddWithValue("param21", Activities.SelectedValue);
            //insertAct.Parameters.AddWithValue("param22", LastUpdatedBy.Text);
            //insertAct.Parameters.AddWithValue("param23", txtLastUpdated.Text);

            //insertAct.ExecuteNonQuery();

            //insertID.CommandText = "INSERT INTO [dbo].[StudentActivity](StudentID,ActivityID,LastUpdatedBy,LastUpdated)" +
            //         "values (@param20,@param21,@param22,@param23)";
            //insertID.Parameters.AddWithValue("param20", max);
            //insertID.Parameters.AddWithValue("param21", Activities.SelectedValue);
            //insertID.Parameters.AddWithValue("param22", LastUpdatedBy.Text);
            //insertID.Parameters.AddWithValue("param23", txtLastUpdated.Text);
            //insertID.ExecuteNonQuery();



            Session["age"] = GetAge(lastupdated, dob);

            errorMessage.Visible = false;
        } 
        else
        {   // Calculating age to display
            Session["age"] = GetAge(DateTime.Now, DateTime.Parse(txtDOB.Text));
            Session["age"].ToString();
            string calc = Convert.ToString(Session["age"]);
            txtAge.Text = "You are " + calc + " years old";


        }
    }

    public void createCommit()
    {

        //Database connection
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = "Server=localhost;Database=Lab1;Trusted_Connection=Yes;";
        sc.Open();



        //Select max ID and add one to it 
        System.Data.SqlClient.SqlCommand MAX = new System.Data.SqlClient.SqlCommand();
        MAX.Connection = sc;
        MAX.CommandText = "Select MAX(StudentID) FROM Student";
        MAX.ExecuteNonQuery();
        max += count;



        System.Data.SqlClient.SqlCommand delete = new System.Data.SqlClient.SqlCommand();
        delete.Connection = sc;

        delete.CommandText = "Delete FROM [dbo].[StudentActivity] WHERE StudentID != (SELECT MAX (StudentID) from [dbo].[StudentActivity])";
        delete.ExecuteNonQuery();

        delete.CommandText = "Delete FROM [dbo].[Student] WHERE StudentID != (SELECT MAX (StudentID) from [dbo].[Student])";
        delete.ExecuteNonQuery();



        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;


        //Check database for existing person
        System.Data.SqlClient.SqlCommand getname = new System.Data.SqlClient.SqlCommand();
        getname.Connection = sc;
        getname.CommandText = "Select FirstName,LastName FROM [dbo].[Student] where FirstName like '%' + @firstName + '%' AND LastName like '%' + @lastname + '%'";
        getname.Parameters.AddWithValue("@firstName", FirstName.Text);
        getname.Parameters.AddWithValue("@lastname", LastName.Text);
        //int name = (int)(getname.ExecuteScalar());


        if (getname.ExecuteScalar() == null)
        {


            System.Data.SqlClient.SqlCommand insertID = new System.Data.SqlClient.SqlCommand();
            insertID.Connection = sc;

            //////Taking text from textboxes and appyling to sql statements
            String first = FirstName.Text;
            String last = LastName.Text;
            String middle = MiddleName.Text;
            String houseNum = HomeNumber.Text;
            String street = Street.Text;
            String city = CityCounty.Text;
            String state = DropDownState.SelectedValue;
            String zip = Zip.Text;
            String country = txtCountry.Text;
            String aYr = DropDownListAcademicYr.SelectedValue;
            String st_ID = StudentID.Text;
            String by = LastUpdatedBy.Text;
            DateTime lastupdated = DateTime.Now;
            DateTime dob = Convert.ToDateTime(txtDOB.Text);
            int schoolID = Convert.ToInt32(SchoolName.SelectedValue);
            int activityID = Convert.ToInt32(Activities.SelectedValue);


            //Insert Student into table  
            insert.CommandText = "INSERT INTO [dbo].[Student](StudentID,FirstName,LastName,MiddleName, HouseNumber, Street,CityCounty,HomeState,Country, Zip,DateOfBirth,AcademicYear, LastUpdatedBy,LastUpdated,SchoolID) values " +
                "(@id,@first,@last,@middle,@house, @street,@city, @state, @country,@zip, @dob, @aYr,@by,@updated,@schoolid)";
            insert.Parameters.AddWithValue("@id", max);
            insert.Parameters.AddWithValue("@first", first);
            insert.Parameters.AddWithValue("@last", last);
            insert.Parameters.AddWithValue("@middle", middle);
            insert.Parameters.AddWithValue("@house", houseNum);
            insert.Parameters.AddWithValue("@street", street);
            insert.Parameters.AddWithValue("@city", city);
            insert.Parameters.AddWithValue("@state", state);
            insert.Parameters.AddWithValue("@country", country);
            insert.Parameters.AddWithValue("@zip", zip);
            insert.Parameters.AddWithValue("@dob", dob);
            insert.Parameters.AddWithValue("aYr", aYr);
            insert.Parameters.AddWithValue("@by", by);
            insert.Parameters.AddWithValue("@updated", lastupdated);
            insert.Parameters.AddWithValue("@schoolid", schoolID);

            insert.ExecuteNonQuery();

            ////INSERT INTO ACTIVITY
            //System.Data.SqlClient.SqlCommand insertAct = new System.Data.SqlClient.SqlCommand();
            //insertAct.Connection = sc;
            //insertAct.CommandText = "INSERT INTO [dbo].[Activity](ActivityID,ActivityDescription,LastUpdatedBy,LastUpdated)" +
            //  "values (@param20,@param21,@param22,@param23)";
            //insertAct.Parameters.AddWithValue("param20", Activities.SelectedIndex);
            //insertAct.Parameters.AddWithValue("param21", Activities.SelectedItem);
            //insertAct.Parameters.AddWithValue("param22", LastUpdatedBy.Text);
            //insertAct.Parameters.AddWithValue("param23", txtLastUpdated.Text);

            //insertAct.ExecuteNonQuery();

            insertID.CommandText = "INSERT INTO [dbo].[StudentActivity](StudentID,ActivityID,LastUpdatedBy,LastUpdated)" +
                     "values (@param20,@param21,@param22,@param23)";
            insertID.Parameters.AddWithValue("param20", max);
            insertID.Parameters.AddWithValue("param21", Activities.SelectedValue);
            insertID.Parameters.AddWithValue("param22", LastUpdatedBy.Text);
            insertID.Parameters.AddWithValue("param23", txtLastUpdated.Text);
            insertID.ExecuteNonQuery();

    

            Session["age"] = GetAge(lastupdated, dob);

            clearStudent();


            //insert.ExecuteNonQuery();

            errorMessage.Visible = false;
            ////// Calculating age to display
            //Session["age"] = GetAge(DateTime.Now, Convert.ToDateTime(txtDOB.Text));
            //Session["age"].ToString();
            //string calc = Convert.ToString(Session["age"]);
            //txtAge.Text = "You are " + calc + " years old";

        }

        else
        {
            errorMessage.Visible = true;
        }
        clearStudent();

    }




    protected void btnClear_Click(object sender, EventArgs e)
    {
        clearStudent();


    }
    protected void btnPopulate_Click(object sender, EventArgs e)
    {
        populateStudent();

    }

    public void clearStudent()
    {
        FirstName.Text = "";
        MiddleName.Text = "";
        LastName.Text = "";
        txtDOB.Text = "";
        HomeNumber.Text = "";
        Street.Text = "";
        DropDownState.SelectedIndex = 0;
        Zip.Text = "";
        CityCounty.Text = "";
        txtCountry.Text = "";
        DropDownListAcademicYr.SelectedIndex = 0;
        StudentID.Text = "";
        Activities.SelectedIndex = 0;
    }
    //Prepopulating method
    public void populateStudent()
    {
        FirstName.Text = "Mercy";
        MiddleName.Text = "R";
        LastName.Text = "Clemente";
        txtDOB.Text = "03/08/1995";
        HomeNumber.Text = "1252";
        Street.Text = "Devon Ln";
        CityCounty.Text = "Fairfax";
        Zip.Text = "22525";
        DropDownListAcademicYr.SelectedIndex = 3;
        txtCountry.Text = "Italy";
        StudentID.Text = "1";
        //Calculating age to display
        //Session["age"] = GetAge(DateTime.Now, Convert.ToDateTime(txtDOB.Text));
        //Session["age"].ToString();
        //string calc = Convert.ToString(Session["age"]);
        //txtAge.Text = calc;
    }


    protected void DropDownState_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DoB_TextChanged(object sender, EventArgs e)
    {

    }

    protected void HomeNumber_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    protected void txtLastUpdated_TextChanged(object sender, EventArgs e)
    {
    }

    //clearing student array
    public void clearArray()
    {
        for (int i = 0; i < Student.studentArray.Length; i++)
        {
            Student.studentArray[i] = null;
        }
    }
    protected void ListCountry_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Activities_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void StudentID_TextChanged(object sender, EventArgs e)
    {

    }


    protected void txtAge_TextChanged(object sender, EventArgs e)
    {

    }

    //Get age method
    public static int GetAge(DateTime reference, DateTime birthday)
    {
        int age = reference.Year - birthday.Year;
        if (reference < birthday.AddYears(age)) age--;

        return age;
    }

}

//Mercy Clemente

