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
    public partial class uyeler : System.Web.UI.Page
    {

        OleDbConnection baglanti = new OleDbConnection();
        string uyeid = "";
        string islem = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            uyeid = Request.QueryString["uyeid"];
            islem = Request.QueryString["islem"];
            if (islem == "sil")
            {
                baglanti.Open();
                string sec = "delete from uyeler where uyeid=@uyeid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@uyeid", uyeid);
                cmd.ExecuteNonQuery();
                Response.Redirect("uyeler.aspx");
                baglanti.Close();
            }
            if (!IsPostBack)
            {
                Panel1.Visible = false;
            }
            baglanti.Open();
            //-----uyeleri dataliste çek--------//
            OleDbCommand cmd2 = new OleDbCommand("select* from uyeler", baglanti);
            OleDbDataReader dr2 = cmd2.ExecuteReader();
            DataList1.DataSource = dr2;
            DataList1.DataBind();
            baglanti.Close();
        }

        protected void btnarti_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void btneksi_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }
    }
}