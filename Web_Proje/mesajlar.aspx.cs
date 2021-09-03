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
    public partial class mesajlar : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string iletisimid = "";
        string islem = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            iletisimid = Request.QueryString["iletisimid"];
            islem = Request.QueryString["islem"];
            if (islem == "sil")
            {
                baglanti.Open();
                string sec = "delete from iletisim where iletisimid=@iletisimid";
                OleDbCommand cmd = new OleDbCommand(sec, baglanti);
                cmd.Parameters.AddWithValue("@iletisimid", iletisimid);
                cmd.ExecuteNonQuery();
                Response.Redirect("mesajlar.aspx");
                baglanti.Close();
            }
            if (!IsPostBack)
            {
                Panel1.Visible = false;
            }
            baglanti.Open();
            OleDbCommand cmd2 = new OleDbCommand("select* from iletisim", baglanti);
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