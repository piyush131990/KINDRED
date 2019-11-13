using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kindred.MIT
{
    public partial class AdminUser : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=RISHI\SQLEXPRESS;Initial Catalog=kindred;Integrated Security=True");
        public static string htm = "";
        public static string journal = "";
        public static string frndaccept = "";
        public static string totjournal = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            logincheck();
            datafill();
            if (!Page.IsPostBack)
            {
                journalsindividuals();
               frndreq_accept();
                frndcount();
                userjournallist();
                dropdownfill();
            }
        }
        public void logincheck()
        {
            if (string.IsNullOrEmpty(Session["UserName"] as string))
            {
                Response.Redirect("Default.aspx");
            }

        }
        public void datafill()
        {
            SqlCommand cmd;
            SqlDataReader rdr;
            conn.Open();
            cmd = new SqlCommand(@"select Username, EmailId, Image from K_User where Username=@username", conn);
            cmd.Parameters.AddWithValue("username", Session["UserName"].ToString());
            rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                UName.InnerText = rdr["Username"].ToString();
                Email.InnerText = rdr["EmailId"].ToString();
                usrimage.Src = rdr["Image"].ToString();
            }
            else
            {
                UName.InnerText = "No UserName available";
                Email.InnerText = "No email id found";
            }
            rdr.Close();
        }
        public void dropdownfill()
        {
            SqlCommand cmd1;
            cmd1 = new SqlCommand(@"Select Id,CategoryName,Description from K_Category", conn);
            SqlDataReader rdr = cmd1.ExecuteReader();
            drop1.DataSource = rdr;
            drop1.DataBind();
            drop1.Items.FindByText("Love").Selected = true;
            rdr.Close();

        }

        public void savedata()
        {
            SqlCommand cmd;
            SqlCommand cmd1;
            SqlDataReader rdr;
            string role;
            var Post = myTextarea.Value;
            cmd = new SqlCommand(@"Insert into K_UserPostData(Userid,Role,Post,Authorize,Category,PostingDate) VALUES(@userid,@role,@post,@auth,@cat,@pDate)", conn);
            cmd.Parameters.AddWithValue("userid", Session["UserId"].ToString());
            cmd.Parameters.AddWithValue("post", Post.ToString());
            cmd.Parameters.AddWithValue("auth", drop2.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("cat", drop1.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("pDate", DateTime.Now.ToString());
            cmd1 = new SqlCommand(@"select Role from K_UserRoles where Uid=@id", conn);
            cmd1.Parameters.AddWithValue("id", Session["UserId"].ToString());
            rdr = cmd1.ExecuteReader();
            if (rdr.Read())
            {
                role = rdr["Role"].ToString();
                cmd.Parameters.AddWithValue("role", role);
            }
            rdr.Close();
            if (Post == "" || Post == null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "notempty();", true);
            }
            else
            {
                cmd.ExecuteNonQuery();
            }
            drop1.SelectedIndex = 0;
            SqlCommand sql3;
            SqlDataReader rdr3;
            sql3 = new SqlCommand(@"SELECT cast(Post AS XML).query('.').value('.', 'varchar(MAX)') as Post from K_UserPostData order by Id desc", conn);
            rdr3 = sql3.ExecuteReader();
            if (rdr3.Read())
            {
                string ppost = "";
                ppost = rdr3["Post"].ToString();
                List<string> result = ppost.Split(' ').ToList();
                foreach (string item in result)
                {
                    string newitem = item.Trim(new Char[] { ' ', '*', '.', '@', '/', '?', '!', '#', '$', '%', '^', '&', '(', ')', '-', '_', '+', '[', ']', '{', '}', '<', '>', ',', '"', ';', ';' });
                    if (newitem == "suicide" || newitem == "death" || newitem == "kill" || newitem == "Killing" || newitem == "murder" || newitem == "Kill myself" || newitem == "overdose" || newitem == "self harm" || newitem == "cut myself" || newitem == "hang myself" || newitem == "guns" || newitem == "die" || newitem == "self" || newitem == "cut" || newitem == "hang")
                    {
                        rdr3.Close();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "redalert();", true);
                    }
                }
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "success();", true);

        }
        protected void Postbutton_Click(object sender, EventArgs e)
        {
            savedata();
        }
        protected void Commentbutton_Click(object sender, EventArgs e)
        {
            var dt = date.Value;
            var userid = usid.Value;
            var commt = cmmnt.Value;
            SqlCommand cmd;
            cmd = new SqlCommand(@"Insert into K_Comment(UserId,FriendId,Comment,postingdate,Postid) values(@uid,@fid,@cmmnt,@pdate,@pid)", conn);
            cmd.Parameters.AddWithValue("uid", Session["UserId"].ToString());
            cmd.Parameters.AddWithValue("fid", userid.ToString());
            cmd.Parameters.AddWithValue("cmmnt", commt.ToString());
            cmd.Parameters.AddWithValue("pid", dt.ToString());
            cmd.Parameters.AddWithValue("pdate", DateTime.Now.ToString());
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "comment();", true);
        }

        //protected void frndreq_Click(object sender, EventArgs e)
        //{
        //    var frndid = frndrequestto.Value;
        //    SqlCommand cmd;
        //    cmd = new SqlCommand(@"Insert into K_Friends(Userid,Friendid,IsFriend) values(@uid,@fid,@isfrnd)", conn);
        //    cmd.Parameters.AddWithValue("uid", Session["UserId"].ToString());
        //    cmd.Parameters.AddWithValue("fid", frndid.ToString());
        //    cmd.Parameters.AddWithValue("isfrnd", true);
        //    cmd.ExecuteNonQuery();
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "frndsuccess();", true);
        //}

        //protected void frndaccpt_Click(object sender, EventArgs e)
        //{
        //    var frndid = friendaccept.Value;
        //    SqlCommand cmd;
        //    cmd = new SqlCommand(@"update K_Friends set AcceptFriend=@accptfrnd where Userid=@uid and Friendid=@fid and  IsFriend=@isfrnd", conn);
        //    cmd.Parameters.AddWithValue("fid", Session["UserId"].ToString());
        //    cmd.Parameters.AddWithValue("uid", frndid.ToString());
        //    cmd.Parameters.AddWithValue("isfrnd", true);
        //    cmd.Parameters.AddWithValue("accptfrnd", true);
        //    string testcmd = cmd.ToString();
        //    cmd.ExecuteNonQuery();
        //    Response.Write("<script>alert('Friend Request Accepted!!')</script>");
        //    Response.Redirect("JournalUser.aspx");
        //}
        //protected void frndreject_Click(object sender, EventArgs e)
        //{
        //    var frndid = frnaccinput.Value;
        //    SqlCommand cmd;
        //    cmd = new SqlCommand(@"delete from K_Friends where Userid=@uid and Friendid=@fid", conn);
        //    cmd.Parameters.AddWithValue("fid", Session["UserId"].ToString());
        //    cmd.Parameters.AddWithValue("uid", frndid.ToString());
        //    cmd.ExecuteNonQuery();
        //    Response.Write("<script>alert('Friend Request Rejected!!')</script>");
        //    Response.Redirect("JournalUser.aspx");
        //}
        //protected void unfrind_Click(object sender, EventArgs e)
        //{
        //    var frndid = unfriend.Value;
        //    SqlCommand cmd;
        //    cmd = new SqlCommand(@"delete from K_Friends where Userid=@uid and Friendid=@fid", conn);
        //    cmd.Parameters.AddWithValue("fid", Session["UserId"].ToString());
        //    cmd.Parameters.AddWithValue("uid", frndid.ToString());
        //    cmd.ExecuteNonQuery();
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "unfriend();", true);
        //    //Response.Write("<script>alert('Friend Request Rejected!!')</script>");
        //    //Response.Redirect("JournalUser.aspx");
        //}
        public string frndcount()
        {
            SqlCommand cmd;
            SqlDataReader rdr;
            totjournal = string.Empty;
            cmd = new SqlCommand(@"select COUNT(*) as count1 from K_User", conn);
            rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                totjournal += "<span runat='server' id='cntt23'>" + rdr["count1"].ToString() + " </span>";
                totjournal += "<div class='w3-row w3-opacity'>";
                totjournal += "<div class='w3-half'>";
                totjournal += "</div>";
                totjournal += "<div class='w3-half'>";
                totjournal += "</div>";
                totjournal += "</div>";
            }
            else
            {
                rdr.Close();
                totjournal += "<span> No User yet!! </span>";
                totjournal += "<div class='w3-row w3-opacity'>";
                totjournal += "<div class='w3-half'>";
                totjournal += "</div>";
                totjournal += "<div class='w3-half'>";
                totjournal += "</div>";
                totjournal += "</div>";
            }
            rdr.Close();
            return frndaccept;
        }
        public string frndreq_accept()
        {
            SqlCommand cmd;
            SqlDataReader rdr;
            frndaccept = string.Empty;
            cmd = new SqlCommand(@"select COUNT(*) as count1 from K_UserPostData", conn);
            rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                frndaccept += "<span runat='server' id='cntt'>"+ rdr["count1"].ToString() + " </span>";
                frndaccept += "<div class='w3-row w3-opacity'>";
                frndaccept += "<div class='w3-half'>";
                frndaccept += "</div>";
                frndaccept += "<div class='w3-half'>";
                frndaccept += "</div>";
                frndaccept += "</div>";
            }
            else
            {
                rdr.Close();
                frndaccept += "<span> No journal posted yet!! </span>";
                frndaccept += "<div class='w3-row w3-opacity'>";
                frndaccept += "<div class='w3-half'>";
                frndaccept += "</div>";
                frndaccept += "<div class='w3-half'>";
                frndaccept += "</div>";
                frndaccept += "</div>";
            }
            rdr.Close();
            return frndaccept;
        }

        private string userjournallist()
        {
            SqlCommand cmd;
            SqlDataReader rdr;
            int numb;
            journal = string.Empty;
            cmd = new SqlCommand(@"select Category from K_UserPostData where Userid=@uid group by Category", conn);
            cmd.Parameters.AddWithValue("uid", Session["UserId"].ToString());
            rdr = cmd.ExecuteReader();
            var journallist = new List<string>();
            while (rdr.Read())
            {
                journallist.Add(rdr["Category"].ToString());
            }
            numb = journallist.Count;

            if (numb == 0)
            {
                journal += "<div runat='server' class='w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small'>No Journal Entry yet!! </div>";
            }
            else
            {
                foreach (string jrnl in journallist)
                {
                    string MyText = jrnl;
                    //string[] query = MyText.Split(' ').Take().ToArray();
                    //MyText = String.Join(" ", query);
                    journal += "<div runat='server' class='w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small'>" + MyText + " <a runat='server' target='_blank' href='PersonalJournal.aspx?dt=" + MyText + "'" + ">Read more...</a> </div> ";
                }
            }
            rdr.Close();
            return journal;
        }
        private string journalsindividuals()
        {
            SqlCommand cmd1;
            SqlCommand cmd2;
            SqlDataReader rdr1;
            SqlDataReader rdr2;
            int numb;
            htm = string.Empty;
            var newlist = new List<Tuple<string, string, string, string, string>>();
            cmd1 = new SqlCommand(@"select K_UserPostData.Id as id,Username,userid,Role,Post,Authorize,Category,PostingDate from K_UserPostData inner join K_User on K_UserPostData.Userid = K_User.Id where Authorize='PUBLIC'  order by PostingDate desc", conn);
            rdr1 = cmd1.ExecuteReader();
            while (rdr1.Read())
            {
                newlist.Add(Tuple.Create(rdr1["userid"].ToString(), rdr1["id"].ToString(), rdr1["Username"].ToString(), rdr1["Post"].ToString(), rdr1["PostingDate"].ToString()));
            }
            numb = newlist.Count;
            rdr1.Close();

            if (numb == 0)
            {
                htm += "No Journal written yet!!!";
            }
            else
            {
                foreach (Tuple<string, string, string, string, string> item in newlist)
                {
                    string usrid = item.Item1;
                    string pid = item.Item2;
                    string usname = item.Item3;
                    string post = item.Item4;
                    string date1 = item.Item5;
                    cmd2 = new SqlCommand(@"select comment,Username from K_Comment inner join K_User on K_Comment.Userid=K_User.Id where FriendId=@Fid and postid=@pid", conn);
                    cmd2.Parameters.AddWithValue("Fid", usrid.ToString());
                    cmd2.Parameters.AddWithValue("pid", pid.ToString());
                    rdr2 = cmd2.ExecuteReader();

                  //  string checkresult = frndcheck(Session["UserId"].ToString(), usrid.ToString());
                    htm += "<div ID=" + usrid.ToString() + " class='w3-container w3-card w3-white w3-round w3-margin'>" + "<br>";
                    htm += "<span class='w3-right w3-opacity'>" + date1.ToString() + "</span>";

                    htm += "<h4>" + usname.ToString() + "</h4><br>";
                    htm += "<hr class='w3-clear'>";
                    htm += "<p>" + post.ToString() + "</p>";
                    htm += "<div class='w3-row-padding' style='margin: 0 - 16px'> </div> ";
                    htm += "<button id='klike' type='button' style='background:transparent; font-size:30px; border:none;' class='w3-margin-bottom'><i style='color: blueviolet;' class='fa fa-thumbs-up'></i><span class='w3-badge w3-right w3-small w3-green'>1</span></button> ";
                    htm += "<button id='ksmile' type='button' style='background:transparent; font-size:30px; border:none;' class='w3-margin-bottom'><i style='color: deeppink' class='fa fa-smile-o'></i><span class='w3-badge w3-right w3-small w3-green'>2</span></button> ";
                    htm += "<button id='kheart' type='button' style='background:transparent; font-size:30px; border:none;' class='w3-margin-bottom'><i style='color: red' class='fa fa-heart'></i><span class='w3-badge w3-right w3-small w3-green'>3</span></button> ";

                    while (rdr2.Read())
                    {
                        htm += "<p style='text-transform: uppercase; font-weight: bold;'>" + rdr2["Username"].ToString() + "</p>";
                        htm += "<p style='border-radius:10px; background-color:#dfe5e8 !important'contenteditable='false' class='w3-border w3-padding'>" + rdr2["comment"].ToString() + "</p>";
                        htm += "<br/>";
                    }
                    if (rdr2.HasRows == false)
                    {
                        htm += "<p>" + "No Comments Yet!!" + "</p>";
                    }
                    rdr2.Close();
                    //if (checkresult == "True")
                    //{
                    //    htm += "<button type='button' class='w3-button w3-theme-d1 w3-margin-bottom'><i class='fa fa-check'></i>  Approval Pending</button> ";
                    //    htm += "</div>";
                    //}
                    //else if (checkresult == "False")
                    //{
                    //    htm += "<button runat='server' id='frndreq" + usname.ToString() + "' OnClick='" + String.Format("myFunction2(\"{0}\")", usname.ToString()) + "' type='button' class='w3-button w3-theme-d2 w3-margin-bottom'>  Add Friend</button>";
                    //    htm += "</div>";
                    //}
                    //else
                    //{
                    //    htm += "<p contenteditable='true' class='w3-border w3-padding' runat='server' id='comment" + pid.ToString() + "'></p>";
                    //    htm += "<button type='button' OnClick='" + String.Format("myFunction1(\"{0}\")", pid.ToString()) + "' class='w3-button w3-right w3-theme-d1 w3-margin-bottom'><i class='fa fa-comment'></i> COMMENT</button>";
                    //    if (checkresult != "myjournal")
                    //    {
                    //        htm += "<button type='button' id='unfrnd" + usrid.ToString() + "' OnClick='" + String.Format("myFunction6(\"{0}\")", usrid.ToString()) + "' class='w3-button w3-left w3-theme-d1 w3-margin-bottom'><i class='fa fa-cancel'></i> UNFRIEND</button>";
                    //    }
                    htm += "<p contenteditable='true' class='w3-border w3-padding' runat='server' id='comment" + pid.ToString() + "'></p>";
                    htm += "<button type='button' OnClick='" + String.Format("myFunction1(\"{0}\")", pid.ToString()) + "' class='w3-button w3-right w3-theme-d1 w3-margin-bottom'><i class='fa fa-comment'></i> COMMENT</button>";
                    htm += "</div>";
                    //}

                }

            }
            return htm;
        }




        //public string frndcheck(string uid, string fid)
        //{
        //    SqlConnection connnew = new SqlConnection(@"Data Source=RISHI\SQLEXPRESS;Initial Catalog=kindred;Integrated Security=True");
        //    SqlCommand cmd2;
        //    SqlDataReader rdr2;
        //    string isfriend = "";
        //    string accptfrnds = "";
        //    connnew.Open();
        //    cmd2 = new SqlCommand(@"select IsFriend,AcceptFriend from K_Friends where (Userid=@uid and Friendid=@fid) or (Userid=@fid and Friendid=@uid)", connnew);
        //    cmd2.Parameters.AddWithValue("uid", uid);
        //    cmd2.Parameters.AddWithValue("fid", fid);
        //    rdr2 = cmd2.ExecuteReader();
        //    if (rdr2.Read())
        //    {
        //        isfriend = rdr2["IsFriend"].ToString();
        //        accptfrnds = rdr2["AcceptFriend"].ToString();
        //        if (accptfrnds == "True" && isfriend == "True")
        //        {
        //            isfriend = "myfriend";
        //        }
        //    }
        //    else
        //    {
        //        if (uid == fid)
        //        {
        //            isfriend = "myjournal";
        //        }
        //        else
        //        {
        //            isfriend = "False";
        //        }
        //    }
        //    rdr2.Close();
        //    connnew.Close();
        //    return isfriend;
        //}

    }
}