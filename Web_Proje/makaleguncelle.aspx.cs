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
    public partial class makaleguncelle : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string makaleid = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            makaleid = Request.QueryString["makaleid"];
            if (!IsPostBack)
            {
                baglanti.Open();
                string sec = "select * from makale where makaleid=@makaleid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@makaleid", makaleid);
                OleDbDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable("tablo");
                dt.Load(dr);
                DataRow row = dt.Rows[0];
                tbgbaslik.Text = row["baslik"].ToString();
                tbgozet.Text = row["ozet"].ToString();
                tbgicerik.Text = row["icerik"].ToString();
                baglanti.Close();
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
                baglanti.Open();
                string sec = "update makale set baslik=@baslik ,ozet=@ozet,icerik=@icerik, tarih=@tarih where makaleid=@makaleid";//makaleid eklendi
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@baslik", tbgbaslik.Text);
                cmd.Parameters.AddWithValue("@ozet", tbgozet.Text);
                cmd.Parameters.AddWithValue("@icerik", tbgicerik.Text);
                cmd.Parameters.AddWithValue("@tarih", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@makaleid", makaleid);
                cmd.ExecuteNonQuery();
                Response.Redirect("makaleler.aspx");
                baglanti.Close();
            }
          
        }
    }
