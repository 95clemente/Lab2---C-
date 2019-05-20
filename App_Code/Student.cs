
 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// Mercy Clemente
/// JMU HONOR CODE: By submitting this Lab I pledge to abide by the JMU honor code. 
/// I have neither received nor given help on this assignment. 
public class Student
{
    public static Student[] studentArray = new Student[3];
    public static int count = 0;
    private int studentID = 0;

    private string firstName;
    private string middleName;
    private string lastName;
    private string houseNum;
    private string street;
    private string cityCounty;
    private string state;
    private string country;
    private string zip;
    private DateTime dob;
    private string academicYr;
    private static int IDcount = 0;
    private DateTime lastUpdated;
    private string by = "Mercy C";
    private string addressStreet;
    private string addressZip;
    private string lastUpdated1;
    private string states;
    private string addressCountry;
    private DateTime birthday;
    private string academic;
    private string lastUpdated2;
    public static int arraySpot;
    public static int filled;

    public Student (string firstName, string MiddleName, string LastName, string houseNumber, string street, string cityCounty,  string state, string zip, string country, DateTime dob, string academicYr, int studentID, DateTime lastUpdated, string lastUpdatedBy)
    {
        setFirst(this.firstName);
        setMiddle(this.middleName);
        setLast(this.lastName);
        setHouse(this.houseNum);
        setStreet(this.street);
        setCity(this.cityCounty);
        setState(this.state);
        setCountry(this.country);
        setZip(this.zip);
        setBday(this.dob);
        setYr(this.academicYr);
        setID(this.studentID);
        setUpdated(this.lastUpdated);
        ++count;
    }

    public Student(string firstName, string middleName, string lastName, string houseNum, string street, string citycounty, string zip, DateTime lastUpdated, string state, string country, DateTime dob, string academicYr, string by)
    {
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.houseNum = houseNum;
        this.street = street;
        cityCounty = citycounty;
        this.zip = zip;
        this.lastUpdated = lastUpdated;
        this.state = state;
        this.country = country;
        this.dob = dob;
        this.academicYr = academicYr;
        this.by = by;
    }

    public Student(string firstName, string middleName, string lastName, string houseNum, string addressStreet, string citycounty, string addressZip, string lastUpdated1, string states, string addressCountry, DateTime birthday, string academic, string by)
    {
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.houseNum = houseNum;
        this.addressStreet = addressStreet;
        cityCounty = citycounty;
        this.addressZip = addressZip;
        this.lastUpdated1 = lastUpdated1;
        this.states = states;
        this.addressCountry = addressCountry;
        this.birthday = birthday;
        this.academic = academic;
        this.by = by;
    }

    public Student(string firstName, string middleName, string lastName, DateTime birthday, string houseNum, string addressStreet, string addressZip, string addressCountry, string citycounty, string academic, string states, string stID, string by, string lastUpdated2)
    {
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.birthday = birthday;
        this.houseNum = houseNum;
        this.addressStreet = addressStreet;
        this.addressZip = addressZip;
        this.addressCountry = addressCountry;
        cityCounty = citycounty;
        this.academic = academic;
        this.states = states;
       // this.stID = stID;
        this.by = by;
        this.lastUpdated2 = lastUpdated2;
    }

    //Getters and setters of variables
    public void setFirst(string firstName)
        {
        this.firstName = firstName;
        }
    public string getFirst()
    {
        return firstName; 
    }
        public void setMiddle (string middleName)
        {
        this.middleName = middleName;
        }
    public string getMiddle()
    {
        return middleName; 
    }
        public void setLast (string lastName)
        {
        this.lastName = lastName;
        }
    public string getLast()
    {
        return lastName;
    }
        public void setHouse (string houseNum)
        {
        this.houseNum = houseNum;
        }
    public string getHouse()
    {
        return houseNum;
    }
        public void setStreet(string street)
        {
        this.street = street;
        }
    public string getStreet()
    {
        return street;
    }
        public void setCity (string cityCounty)
        {
        this.cityCounty = cityCounty;
        }
    public string getCity()
    {
        return cityCounty;
    }
    public void setState (string state)
     {
        this.state = state;
     }
    public string getState()
    {
        return state;
    }
    public void setCountry (string country)
     {
       this.country = country; 
     }
    public string getCountry()
    {
        return country;
    }
    public void setZip (string zip)
    {
      this.zip = zip;
     }
    public string getZip()
    {
        return zip;
    }
    public void setBday(DateTime dob)
     {
       this.dob = dob; 
     }
    public DateTime getDoB()
    {
        return dob; 
    }
   public void setYr (string academicYr)
    {
      this.academicYr = academicYr;
    }
    public string getAcademic()
    {
        return academicYr;
    }
    public void setUpdated(DateTime lastUpdated)
    {
        this.lastUpdated = lastUpdated;
    }
    public DateTime getUpdated()
    {
        return lastUpdated;
    }
    public void setID (int count)
    {
        this.studentID = count;
        ++count;
    }
    public int getID ()
    {
        return studentID;
    }
    public void setBy(string by)
    {
        this.by = by;
    }
    public string getBy()
    {
        return by;
    }
    public static void clear()
    {
        Array.Clear(studentArray, 0, studentArray.Length);
        arraySpot = 0;
        filled = 0;
    }
    public static void fillArray(Student nextStudent)
    {
        studentArray[arraySpot] = nextStudent;
        //arraySpot++;
        filled = arraySpot - 1;
    }
}
