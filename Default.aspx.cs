using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kindred.MIT
{
    public partial class _Default : Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=RISHI\SQLEXPRESS;Initial Catalog=kindred;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
       
        protected void loginbtn_Click(object sender, EventArgs e)
        {
            string username = inputUserame.Value.ToString();
            Session.Add("UserName", username);
            string password = inputPassword.Value.ToString();
            SqlCommand cmd;
            SqlCommand cmd1;
            SqlDataReader rdr;
            SqlDataReader rdr1;
            conn.Open();
            cmd = new SqlCommand("Select Id,Password from K_User where Username=@username", conn);
            cmd.Parameters.AddWithValue("@username", username);
            rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                string userid = rdr["Id"].ToString();
                Session.Add("UserId", userid);
                string finalpass = rdr["password"].ToString();
                rdr.Close();
                string passdecrypt = "";
                passdecrypt = Decrypt(finalpass);
                    if (passdecrypt == password)
                    {
                    cmd1 = new SqlCommand("select Role from K_UserRoles where Name=@username", conn);
                    cmd1.Parameters.AddWithValue("@username", username);
                    rdr1 = cmd1.ExecuteReader();
                    if(rdr1.Read())
                    { 
                    if(rdr1["Role"].ToString() == "ADMIN")
                    {
                        Response.Redirect("AdminUser.aspx");
                    }
                    else
                    {
                        Response.Redirect("JournalUser.aspx");
                    }
                    }
                    else
                    {
                        Session["UserName"] = "";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "soemthingwrong();", true);
                       // Response.Write("<script>swal('Something went wrong! Please try again later.')</script>");
                    }
                }
                    else
                    {
                    Session["UserName"] = "";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                    //Response.Write("<script>swal('PLease check the password!')</script>");
                    }
                
                
            }
            else
            {
                Session["UserName"] = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "checkusername();", true);
                //Response.Write("<script>swal('PLease check the username entered')</script>");
            }
        }
        private string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }

    }
}