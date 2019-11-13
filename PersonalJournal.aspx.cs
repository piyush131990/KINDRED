using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kindred.MIT
{
    public partial class PersonalJournal : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=RISHI\SQLEXPRESS;Initial Catalog=kindred;Integrated Security=True");
        public static string journal = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            logincheck();
            loadJournal();
        }

        private void logincheck()
        {
            if (string.IsNullOrEmpty(Session["UserName"] as string))
            {
                Response.Redirect("Default.aspx");
            }

        }

        public void loadJournal()
        {
            SqlCommand cmd;
            SqlDataReader rdr;
            journal = string.Empty;
            cmd = new SqlCommand("select Post from K_UserPostData where Userid=@uid and Category=@cat", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("uid",Session["UserId"].ToString());
            cmd.Parameters.AddWithValue("cat", Request.QueryString["dt"]);
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                journal += "<div class='w3-card w3-round w3-white' style='min-height:750px;'>";
                journal += "<div class='w3-container w3-padding'>";
                journal += rdr["Post"].ToString();
                journal += "</div>";
                journal += "</div>";
                journal += "</br>";
                journal += "</br>";
            }
            if(rdr.HasRows==false)
            {
                journal += "<div class='w3-card w3-round w3-white' style='min-height:750px;'>";
                journal += "<div class='w3-container w3-padding'>";
                journal += "No Journal found!!";
                journal += "</div>";
                journal += "</div>";
            }
            rdr.Close();
        }
    }
}