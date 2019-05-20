using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lab1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Commit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid){
            comittStudent();
            clearStudent();
        }
    }

    public void comittStudent()
    {
        //Student student = new Student(First.Text);

        //Database connection
        var connString = System.Configuration.ConfigurationManager.ConnectionStrings["Lab1"];
        string con = connString.ConnectionString;
        SqlConnection connection = new SqlConnection(con);
        connection.Open();

        String first = FirstName.Text;
        String last = "Hagstoz";
        DateTime lastupdated = DateTime.Now;
        String lastupdatedby = "Mercy";
       // DateTime dob = DateTime.Parse(dob.Text);

        //Insert Student into table
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = connection;
        insert.CommandText = "Insert into Student (FirstName,LastName,LastUpdated,LastUpdatedBy) values (@first,@last,@updated,@by)";
        insert.Parameters.AddWithValue("@first", first);
        insert.Parameters.AddWithValue("@last", last);
        insert.Parameters.AddWithValue("@updated", lastupdated);
        insert.Parameters.AddWithValue("@by", lastupdatedby);

        insert.ExecuteNonQuery();

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        clearStudent();
    }
    public void clearStudent()
    {
        FirstName.Text = "";
        MiddleName.Text = "";
        LastName.Text = "";
        DoB.Text = "";
        HomeNumber.Text = "";
        Street.Text = "";
        DropDownState.SelectedIndex = 0;
        Zip.Text = "";
        CityCounty.Text = "";
        ListCountry.SelectedIndex = 0;
        DropDownListAcademicYr.SelectedIndex = 0;
        StudentID.Text = "";
        SchoolID.Text = "";
        SchoolName.Text = "";
        
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
      
    }

   
}