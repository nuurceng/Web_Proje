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
    public partial class duyurular : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string duyurularid = "";
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
            duyurularid = Request.QueryString["duyurularid"];//sorgu dizesi iste
            islem = Request.QueryString["islem"];
            if (islem == "sil")
            {
                baglanti.Open();
                string sec = "delete from duyurular where duyurularid=@duyurularid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@duyurularid", duyurularid);
                cmd.ExecuteNonQuery();
                baglanti.Close();
            }
            //------------duyuruları dataliste çekme-------------//
            baglanti.Open();
            OleDbCommand cmd1 = new OleDbCommand("select* from duyurular", baglanti);
            OleDbDataReader dr1 = cmd1.ExecuteReader();
            DataList1.DataSource = dr1;
            DataList1.DataBind();
            baglanti.Close();
        }

        protected void btnekle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sec = "insert into duyurular(dbaslik,dicerik,dtarih)values ('" + tbbaslik.Text + "','" + tbicerik.Text + "','" + DateTime.Now + "')";
            OleDbCommand cmd = new OleDbCommand(sec, baglanti);
            cmd.ExecuteNonQuery();
            Response.Redirect("duyurular.aspx");
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

        protected void btnddarti_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
        }

        protected void btnddeksi_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }
    }
}