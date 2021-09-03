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
    public partial class kategoriler : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string kategoriid = "";
        string islem = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            kategoriid = Request.QueryString["kategoriid"];
            islem = Request.QueryString["islem"];
            if (islem == "sil")
            {
                baglanti.Open();
                string sec = "delete from kategori where kategoriid=@kategoriid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@kategoriid", kategoriid);
                cmd.ExecuteNonQuery();
                baglanti.Close();
            }
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
            }

            //-------kategorileri dataliste çekme------//
            baglanti.Open();
            OleDbCommand cmd1 = new OleDbCommand("select* from kategori", baglanti);
            OleDbDataReader dr = cmd1.ExecuteReader();
            DataList1.DataSource = dr;
            DataList1.DataBind();
            baglanti.Close();
        }

        protected void btnekle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("/kresim/") + FileUpload1.FileName);
                string sec = "insert into kategori(kategoriad,kategoriresim)values (@kategoriad,@kategoriresim)";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@kategoriad", tbadi.Text);
                cmd.Parameters.AddWithValue("@kategoriresim", FileUpload1.FileName);
                cmd.ExecuteNonQuery();
                Response.Redirect("kategoriler.aspx");
            }
            else
            {
                Label1.Text = "Resim eklenmedi...";
            }
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

        protected void btnkdarti_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
        }

        protected void btnkdeksi_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }
    }
}