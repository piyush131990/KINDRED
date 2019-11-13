using System;
using System.Collections.Generic;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace Kindred.MIT
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=RISHI\SQLEXPRESS;Initial Catalog=kindred;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
       
        public void userregister()
        {
            Guid id = Guid.NewGuid();
            string newid = id.ToString();
            string username = "";
            username = inputUsername.Value.ToString();
            string password = "";
            password = inputPassword.Value.ToString();
            string email = "";
            email = inputEmail.Value.ToString();
            string passconfirm = "";
            passconfirm = inputConfirmPassword.Value.ToString();
            string imgfile = "";
            if (ImageUpload.PostedFile != null)
            {
                 imgfile = Path.GetFileName(ImageUpload.PostedFile.FileName);
                ImageUpload.SaveAs(Server.MapPath("~/Images/") + imgfile);
            }
            SqlCommand cmd;
            SqlCommand cmd1;
            SqlCommand cmd2;
            SqlDataReader rdr;
            conn.Open();
            cmd2 = new SqlCommand("Select Username from K_User where Username=@username", conn);
            cmd2.Parameters.AddWithValue("@username", username);
            rdr = cmd2.ExecuteReader();
            if (rdr.HasRows == false)
            {
                if (password == passconfirm)
                {
                    string passencrypt = "";
                    passencrypt = Encrypt(password);
                    cmd = new SqlCommand("Insert into K_User(Id,Username,EmailId,Password,Image) VALUES(@Id,@UserName,@EmailId,@Password,@img)", conn);
                    cmd1 = new SqlCommand("Insert into K_UserRoles(Name,Role,Uid) VALUES(@UserName,'USER',@Id)", conn);
                    cmd.Parameters.AddWithValue("@Id", newid);
                    cmd.Parameters.AddWithValue("@UserName", username);
                    cmd.Parameters.AddWithValue("@EmailId", email);
                    cmd.Parameters.AddWithValue("@Password", passencrypt);
                    cmd.Parameters.AddWithValue("@img", "Images/" + imgfile);
                    cmd1.Parameters.AddWithValue("@UserName", username);
                    cmd1.Parameters.AddWithValue("@Id", newid);
                    rdr.Close();
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    Response.Redirect("Default.aspx");
                }
                else
                {

                }
            }
            else
            {
                string alert = "";
                alert =  "user id is already in use";
            }

        }
        private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        protected void Regbutton_Click(object sender, EventArgs e)
        {
            userregister();
        }

       
    }
}