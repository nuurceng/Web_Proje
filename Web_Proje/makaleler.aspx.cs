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
    public partial class makaleler : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string makaleid = "";
        string islem = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            makaleid = Request.QueryString["makaleid"];
            islem = Request.QueryString["islem"];
            if (islem == "sil")
            {
                baglanti.Open();
                string sec = "delete from makale where makaleid=@makaleid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@makaleid", makaleid);
                cmd.ExecuteNonQuery();
                baglanti.Close();
            }
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
            }

            //----------kategorileri dropdownliste çek----//
            baglanti.Open();
            OleDbCommand cmd2 = new OleDbCommand("select* from kategori", baglanti);
            OleDbDataReader dr2 = cmd2.ExecuteReader();
            ddlistkategori.DataTextField = "kategoriad";
            ddlistkategori.DataValueField = "kategoriid";
            ddlistkategori.DataSource = dr2;
            ddlistkategori.DataBind();
            baglanti.Close();

            //--------makaleleri dataliste çek--------//
            baglanti.Open();
            OleDbCommand cmd1 = new OleDbCommand("select* from makale", baglanti);
            OleDbDataReader dr1 = cmd1.ExecuteReader();
            DataList1.DataSource = dr1;
            DataList1.DataBind();
            baglanti.Close();
        }

        protected void btnekle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sec = "insert into makale(baslik,ozet,icerik,tarih,kategoriid)values (@baslik,@ozet,@icerik,@tarih,@kategoriid)";
            OleDbCommand cmd = new OleDbCommand(sec, baglanti);
            cmd.Parameters.AddWithValue("@baslik", tbbaslik.Text);
            cmd.Parameters.AddWithValue("@ozet", tbozet.Text);
            cmd.Parameters.AddWithValue("@icerik", tbicerik.Text);
            cmd.Parameters.AddWithValue("@tarih", DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@kategoriid", ddlistkategori.SelectedValue);
            cmd.ExecuteNonQuery();
            Response.Redirect("makaleler.aspx");
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

        protected void btnmdarti_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
        }

        protected void btnmdeksi_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }
    }
}