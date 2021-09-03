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
    public partial class duyuruguncelle : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string duyurularid = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            duyurularid = Request.QueryString["duyurularid"];
            if (!IsPostBack)
            {
                baglanti.Open();
                string sec = "select * from duyurular where duyurularid=@duyurularid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@duyurularid", duyurularid);
                OleDbDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable("tablo");
                dt.Load(dr);
                DataRow row = dt.Rows[0];
                tbdbaslik.Text = row["dbaslik"].ToString();
                tbdicerik.Text = row["dicerik"].ToString();
                baglanti.Close();
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sec = "update duyurular set dbaslik=@dbaslik ,dicerik=@dicerik where duyurularid=@duyurularid";
            OleDbCommand cmd = new OleDbCommand(sec, baglanti);
            cmd.Parameters.AddWithValue("@dbaslik", tbdbaslik.Text);
            cmd.Parameters.AddWithValue("@dicerik", tbdicerik.Text);
            cmd.Parameters.AddWithValue("@duyurularid", duyurularid);
            cmd.ExecuteNonQuery();
            Response.Redirect("duyurular.aspx");
            baglanti.Close();
        }
    }
}