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
    public partial class sgaleri : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //--------Galeri-----//
            OleDbConnection baglanti = new OleDbConnection();
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            baglanti.Open();
            OleDbCommand cmd = new OleDbCommand("select* from kategori ", baglanti);
            OleDbDataReader dr = cmd.ExecuteReader();
            DataList1.DataSource = dr;
            DataList1.DataBind();
            baglanti.Close();


        }
    }
}