using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace Web_Proje
{
    public partial class uyeyeozel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Eğer zaten bir kullanıcı giriş yapmış ise Default sayfasına yönlendir
            //if (Session["uyeid"] != null)
            //{
            //    Response.Redirect("uyeyeozelsayfa.aspx");
            //}
        }

        protected void giris_Click(object sender, EventArgs e)
        {
            OleDbConnection baglanti = new OleDbConnection();
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            OleDbCommand sorgu = new OleDbCommand("select * from uyeler where kullaniciadi='" + tbka.Text + "' and uyesifre='" + tbsf.Text + "'", baglanti);
            baglanti.Open();
            OleDbDataReader oku = sorgu.ExecuteReader();
        if (oku.Read())
        {
            Response.Redirect("uyeyeozelsayfa.aspx");
        }

        else // Böyle bir kayıt okunamadıysa
        {
            Label1.Text = "Böyle bir kullanıcı bulunamadı!!!";
            tbka.Text = "";

        }
        baglanti.Close();
        }
        
    }
}