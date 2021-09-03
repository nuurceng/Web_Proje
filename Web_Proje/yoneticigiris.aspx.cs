using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Web_Proje
{
    public partial class yoneticigiris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["yenimi"] = "false";
            }
        }

        protected void btngiris_Click(object sender, EventArgs e)
        {
            OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb"));
            baglanti.Open();
            OleDbCommand cmd = new OleDbCommand("select *from yonetici where yoneticiadsoyad='" + tbadivesoyadi.Text + "'and kullanici='" + tbka.Text + "'and sifre='" + tbsifre.Text + "'", baglanti);
            OleDbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["kullanici"] = dr["kullanici"];
                Response.Redirect("yonetici.aspx");
            }
            else
            {
                Label1.Text = "Hatalı Giriş Yaptınız!!!";
            }
            baglanti.Close();
        }
    }
}