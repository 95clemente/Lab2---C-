using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StudentActivity
/// </summary>
public class StudentActivity
{
    private int studentID;
    private int activityID;
    private string activityDescription;
    private DateTime lastUpdated;
    private DateTime lastUpdatedBy;
    public static StudentActivity[] studentActivity = new StudentActivity[3];
    public static int filled = 0;
    public static int arraySpot = 0;

    public StudentActivity(int studentID, int activityID)
    {
        setStudentID(studentID);
        setActivityID(activityID);

    }

    public void setStudentID(int studentID)
    {
        this.studentID = studentID;
    }

    public int getStudentID()
    {
        return this.studentID;
    }

    public void setActivityID(int activityID)
    {
        this.activityID = activityID;
    }

    public int getActivityID()
    {
        return this.activityID;
    }



    public static void clearArray()
    {
        Array.Clear(studentActivity, 0, studentActivity.Length);
        arraySpot = 0;
        filled = 0;
    }

    public static void fillArray(StudentActivity nextStudentActivity)
    {
        studentActivity[arraySpot] = nextStudentActivity;
        arraySpot++;
        filled = arraySpot - 1;
    }
}