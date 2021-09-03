using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;//
using System.Data.OleDb;
using System.Text;

namespace Web_Proje
{
    public partial class duyurugoster : System.Web.UI.Page
    {
        public string tutbaslik;
        public StringBuilder tuticerik = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            OleDbConnection baglanti = new OleDbConnection();
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            baglanti.Open();
            DataSet ds = new DataSet();
            string gelenid;
            if (Request.QueryString.Count > 0) gelenid = Request.QueryString["duyurularid"].ToString();
            else gelenid = "1";//bu yazılmazsa hata verir.. ilk defa açıyorsa
           // string gelenid = Request.QueryString["duyurularid"].ToString();
            string sec = "select * from duyurular where duyurularid=" + gelenid;
            OleDbDataAdapter da = new OleDbDataAdapter(sec, baglanti);
            da.Fill(ds, "duyurular");
            if (ds.Tables["duyurular"].Rows.Count > 0)
            {
                tutbaslik = ds.Tables["duyurular"].Rows[0]["dbaslik"].ToString();
                tuticerik.Append(ds.Tables["duyurular"].Rows[0]["dicerik"].ToString());
            }
        }
    }
}