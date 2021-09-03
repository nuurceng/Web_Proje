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
    public partial class uyeyeozel1 : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string uoid = "";
        string islem = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                Panel2.Visible = false;


            }
            uoid = Request.QueryString["uoid"];
            islem = Request.QueryString["islem"];
            if (islem == "sil")
            {
                baglanti.Open();
                string sec = "delete from uyeyeozel where uoid=@uoid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@uoid", uoid);
                cmd.ExecuteNonQuery();
                baglanti.Close();
            }
            //-------uyeye ozel dataliste çek----//
            baglanti.Open();
            OleDbCommand cmd1 = new OleDbCommand("select* from uyeyeozel", baglanti);
            OleDbDataReader dr1 = cmd1.ExecuteReader();
            DataList1.DataSource = dr1;
            DataList1.DataBind();
            baglanti.Close();
        }

        protected void btnekle_Click1(object sender, EventArgs e)
        {
            baglanti.Open();
            string sec = "insert into uyeyeozel(uobaslik,uoicerik)values ('" + tbbaslik.Text + "','" + tbicerik.Text + "')";
            OleDbCommand cmd = new OleDbCommand(sec, baglanti);
            cmd.ExecuteNonQuery();
            Response.Redirect("uyeyeozel.aspx");
            baglanti.Close();
        }

        protected void btnarti_Click1(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void btneksi_Click1(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }

        protected void btnddarti_Click1(object sender, EventArgs e)
        {
            Panel2.Visible = true;
        }

        protected void btnddeksi_Click1(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }
    }
}