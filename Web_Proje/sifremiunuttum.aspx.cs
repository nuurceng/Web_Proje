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
    public partial class sifremiunuttum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gonder_Click(object sender, EventArgs e)
        {
            OleDbConnection baglanti = new OleDbConnection();
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            OleDbCommand sorgu = new OleDbCommand("select * from uyeler where kullaniciadi=@kullaniciadi", baglanti);
            sorgu.Parameters.Add("@kullaniciadi", OleDbType.VarChar).Value = tbka.Text;
            baglanti.Open();
            OleDbDataReader oku = sorgu.ExecuteReader(CommandBehavior.CloseConnection);
            if (oku.Read())
            {
                Label1.Text = oku["uyesifre"].ToString();
            }
            else // Böyle bir kayıt okunamadıysa
            {
                Label1.Text = "Böyle bir kullanıcı bulunamadı !!!";
            }
            baglanti.Close();
        }
    }
}