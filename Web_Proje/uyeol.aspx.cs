using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;//
using System.Data.OleDb;

namespace Web_Proje
{
    public partial class uyegiris : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
        }

        protected void kaydol_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sec = "insert into uyeler(adivesoyadi,uyeemail,kullaniciadi,uyesifre,uyeyas)values (@adivesoyadi,@uyeemail,@kullaniciadi,@uyesifre,@uyeyas)";
            OleDbCommand cmd = new OleDbCommand(sec, baglanti);
            cmd.Parameters.AddWithValue("@adivesoyadi", adsoyad.Text);
            cmd.Parameters.AddWithValue("@uyeemail", eposta.Text);
            cmd.Parameters.AddWithValue("@kullaniciadi", ka.Text);
            cmd.Parameters.AddWithValue("@uyesifre", sf.Text);
            cmd.Parameters.AddWithValue("@uyeyas", yas.Text);
            cmd.ExecuteNonQuery();
            Label1.Text = "Üye oldunuz";
            baglanti.Close();
            adsoyad.Text = "";
            eposta.Text = "";
            ka.Text = "";
            yas.Text = "";
        }
    }
}