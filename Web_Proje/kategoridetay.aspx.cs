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
    public partial class kategoridetay : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection();
        string kategoriid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            kategoriid = Request.QueryString["kategoriid"];
            baglanti.Open();
            DataSet ds = new DataSet();
            string sec = "select * from makale where kategoriid=@kategoriid";
            OleDbCommand cmd = new OleDbCommand(sec, baglanti);
            cmd.Parameters.AddWithValue("@kategoriid",kategoriid);
            OleDbDataReader dr = cmd.ExecuteReader();
            DataList1.DataSource = dr;
            DataList1.DataBind();
            baglanti.Close();
        }
    }
}