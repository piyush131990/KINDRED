using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kindred.MIT
{
    public partial class SiteMaster : MasterPage
    {
        SqlConnection conn = new SqlConnection(@"Data Source=RISHI\SQLEXPRESS;Initial Catalog=kindred;Integrated Security=True");
        public static string frndaccept = "";
        public static string comments = "";
        public static string frndnumber = "";
        public static string commentnumber = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                frnd_comment();
                frndreq_accept();
            }
            bool val1 = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (!string.IsNullOrEmpty(Session["UserName"] as string))
            {
                maindiv1.Visible = false;
                maindiv.Visible = true;
            }
            else
            {
                maindiv1.Visible = true;
                maindiv.Visible = false;
            }

        }
        protected void LogOut_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
        public string frnd_comment()
        {
            SqlCommand cmd;
            SqlDataReader rdr;
            comments = string.Empty;
            int numb;
            if (System.Web.HttpContext.Current.Session["UserId"] != null)
            {
                cmd = new SqlCommand(@"select K_User.Username,K_Comment.Postid,K_Comment.Readtrue,K_Comment.Unreadtrue from K_Comment inner join K_user on K_Comment.UserId= K_user.Id where FriendId=@u1id and K_Comment.Readtrue=@rdtrue and K_Comment.Unreadtrue=@unredtrue", conn);
                cmd.Parameters.AddWithValue("u1id", Session["UserId"].ToString());
                cmd.Parameters.AddWithValue("rdtrue", false);
                cmd.Parameters.AddWithValue("unredtrue", true);
                conn.Open();
                rdr = cmd.ExecuteReader();
                var newlist = new List<Tuple<string, string>>();
                while (rdr.Read())
                {
                    newlist.Add(Tuple.Create(rdr["Username"].ToString(), rdr["Postid"].ToString()));
                }
                numb = newlist.Count;
                commentnumber = numb.ToString();
                rdr.Close();
                conn.Close();
                if (numb == 0)
                {
                    comments += "<span>No Comments Yet!!! </span>";
                    comments += "<div class='w3-row w3-opacity'>";
                    comments += "<div class='w3-half'>";
                    comments += "</div>";
                    comments += "<div class='w3-half'>";
                    comments += "</div>";
                    comments += "</div>";
                }
                else
                {
                    foreach (Tuple<string, string> item in newlist)
                    {
                        string username = item.Item1;
                        string postid = item.Item2;
                        //comments += "<span>" + username.ToString() + "</span>";
                        comments += "<div  class='w3-row w3-opacity'>";
                        comments += "<div runat='server' id='A" + postid.ToString() + "'>";
                       // comments += "<asp:Button runat='server' class='w3-button w3-theme fa fa-pencil' OnClientClick='" + String.Format("myFunc(\"{0}\")", "comment"+ postid.ToString()) + "' Text='" + username + " commented on your post!"+"'/>" ;
                        comments += "<button runat='server' OnClick='" + String.Format("myFunc(\"{0}\")", "comment" + postid.ToString()) + "' type='button' class='w3-button w3-block w3-green' style='width:100%' title='Accept'>"+ username + " commented on your post!" + "</button>";
                        // comments += "<a href='comment" + postid.ToString()+"'>" + username +"commented on your post!"+"</a>";
                        comments += "</div>";
                        //comments += "<div class='w3-half'>";
                        //comments += "</div>";
                        comments += "</div>";

                    }


                }
                return comments;
            }
            else
            {
                comments += "<span>No Friend Request Yet!!! </span>";
                comments += "<div class='w3-row w3-opacity'>";
                comments += "<div class='w3-half'>";
                comments += "</div>";
                comments += "<div class='w3-half'>";
                comments += "</div>";
                comments += "</div>";
                return comments;
            }
        }
        public string frndreq_accept()
        {
            SqlCommand cmd;
            SqlDataReader rdr;
            frndaccept = string.Empty;
            int numb;
            if (System.Web.HttpContext.Current.Session["UserId"] != null)
            {
                cmd = new SqlCommand(@"select Username,Userid,Friendid,IsFriend,AcceptFriend from K_Friends inner join K_User on K_Friends.Userid = K_User.Id where IsFriend='true' and (AcceptFriend IS NULL or AcceptFriend=0) and K_Friends.Friendid=@uid", conn);
                cmd.Parameters.AddWithValue("uid", Session["UserId"].ToString());
                conn.Open();
                rdr = cmd.ExecuteReader();
                var newlist = new List<Tuple<string, string>>();
                while (rdr.Read())
                {
                    newlist.Add(Tuple.Create(rdr["Username"].ToString(), rdr["Userid"].ToString()));
                }
                numb = newlist.Count;
                frndnumber = numb.ToString();
                rdr.Close();
                conn.Close();
                if (numb == 0)
                {
                    frndaccept += "<span>No Friend Request Yet!!! </span>";
                    frndaccept += "<div class='w3-row w3-opacity'>";
                    frndaccept += "<div class='w3-half'>";
                    frndaccept += "</div>";
                    frndaccept += "<div class='w3-half'>";
                    frndaccept += "</div>";
                    frndaccept += "</div>";
                }
                else
                {
                    foreach (Tuple<string, string> item in newlist)
                    {
                        string username = item.Item1;
                        string friendid = item.Item2;
                        frndaccept += "<span>" + username.ToString() + "</span>";
                        frndaccept += "<div  class='w3-row w3-opacity'>";
                        frndaccept += "<div runat='server' id='A" + friendid.ToString() + "' class='w3-half'>";
                        frndaccept += "<button runat='server' id='frndaccpt" + username.ToString() + "' OnClick='" + String.Format("myFunction3(\"{0}\")", username.ToString()) + "' type='button' class='w3-button w3-block w3-green w3-section' title='Accept'>Accept</button>";
                        frndaccept += "</div>";
                        frndaccept += "<div runat='server' id='R" + friendid.ToString() + "' class='w3-half'>";
                        frndaccept += "<button runat='server' id='frndreject" + username.ToString() + "' OnClick='" + String.Format("myFunction4(\"{0}\")", username.ToString()) + "' type='button' class='w3-button w3-block w3-red w3-section' title='Decline'><i class='fa fa-remove'></i></button>";
                        frndaccept += "</div>";
                        frndaccept += "</div>";

                    }


                }
                return frndaccept;
            }
            else
            {
                frndaccept += "<span>No Friend Request Yet!!! </span>";
                frndaccept += "<div class='w3-row w3-opacity'>";
                frndaccept += "<div class='w3-half'>";
                frndaccept += "</div>";
                frndaccept += "<div class='w3-half'>";
                frndaccept += "</div>";
                frndaccept += "</div>";
                return frndaccept;
            }
        }
    }
}