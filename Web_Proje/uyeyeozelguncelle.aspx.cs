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
    public partial class uyeyeozelguncelle : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string uoid = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            uoid = Request.QueryString["uoid"];
            if (!IsPostBack)
            {
                baglanti.Open();
                string sec = "select * from uyeyeozel where uoid=@uoid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@uoid", uoid);
                OleDbDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable("tablo");
                dt.Load(dr);
                DataRow row = dt.Rows[0];
                tbubaslik.Text = row["uobaslik"].ToString();
                tbuicerik.Text = row["uoicerik"].ToString();
                baglanti.Close();
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sec = "update uyeyeozel set uobaslik=@uobaslik ,uoicerik=@uoicerik where uoid=@uoid";
            OleDbCommand cmd = new OleDbCommand(sec, baglanti);
            cmd.Parameters.AddWithValue("@uobaslik", tbubaslik.Text);
            cmd.Parameters.AddWithValue("@uoicerik", tbuicerik.Text);
            cmd.Parameters.AddWithValue("@uoid", uoid);
            cmd.ExecuteNonQuery();
            Response.Redirect("uyeyeozel.aspx");
            baglanti.Close();
        }
    }
}