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
    public partial class ziyaretciler : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
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
            }
            baglanti.Open();
            //-------ziyaretçileri dataliste çek-------//
            OleDbCommand cmd = new OleDbCommand("select* from sayac", baglanti);
            OleDbDataReader dr = cmd.ExecuteReader();
            DataList1.DataSource = dr;
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