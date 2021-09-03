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
    public partial class kategoriguncelle : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string kategoriid = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            kategoriid = Request.QueryString["kategoriid"];
            if (!IsPostBack)
            {
                baglanti.Open();
                string sec = "select * from kategori where kategoriid=@kategoriid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@kategoriid", kategoriid);
                OleDbDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable("tablo");
                dt.Load(dr);
                DataRow row = dt.Rows[0];
                tbkad.Text = row["kategoriad"].ToString();
                baglanti.Close();
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile)
            {
                FileUpload2.SaveAs(Server.MapPath("/kresim/") + FileUpload2.FileName);
                baglanti.Open();
                string sec = "update kategori set kategoriad=@kategoriad ,kategoriresim=@kategoriresim where kategoriid=@kategoriid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@kategoriad", tbkad.Text);
                cmd.Parameters.AddWithValue("@kategoriresim", FileUpload2.FileName);
                cmd.Parameters.AddWithValue("@kategoriid", kategoriid);
                cmd.ExecuteNonQuery();
                Response.Redirect("kategoriler.aspx");
                baglanti.Close();
            }
            else
            {
                baglanti.Open();
                string sec = "update kategori set kategoriad=@kategoriad where kategoriid=@kategoriid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@kategoriad", tbkad.Text);
                cmd.Parameters.AddWithValue("@kategoriid", kategoriid);
                cmd.ExecuteNonQuery();
                Response.Redirect("kategoriler.aspx");
                baglanti.Close();
            }
        }
    }
}