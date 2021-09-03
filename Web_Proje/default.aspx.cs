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
    public partial class _default : System.Web.UI.Page
    {   
        public StringBuilder menutut = new StringBuilder();
        public StringBuilder iceriktut = new StringBuilder();
        public string menuismi;

        OleDbConnection baglanti = new OleDbConnection();
        public string tutbaslik;
        public string tutozet;
        public StringBuilder tuticerik = new StringBuilder();
        public string tuttarih;

    
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds1 = new DataSet();
            //---------Dinamik menu -----------//
            ds1.ReadXml(Server.MapPath("menu.xml"));
            menutut.Append("<ul class='navbar-nav ml-auto'>");
            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                if (i == 0) menutut.Append(" <li class='nav-item active'>");
                else menutut.Append("<li class='nav-item'>");
                menutut.Append("<a class='nav-link' href='default.aspx?id=" + ds1.Tables[0].Rows[i]["id"] + "'>");
                menutut.Append(ds1.Tables[0].Rows[i]["Ad"]);
                menutut.Append("</a>");
                menutut.Append("</li>");
            }
            menutut.Append("</ul>");

            //--------------İçerik veritabanından çekiliyor--------//
            string id;
            if (Request.QueryString.Count > 0) id = Request.QueryString[0];
            else id = "1";//bu yazılmazsa hata verir.. ilk defa açıyorsa

            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = "Provider=Microsoft.Jet.OleDb.4.0;Data Source=" + Server.MapPath("~/blog.mdb");
            conn.Open();
            string sec1 = "select * from menusayfa where id='" + id + "'";
            OleDbDataAdapter da1 = new OleDbDataAdapter(sec1, conn);
            da1.Fill(ds1, "menusayfa");
            if (ds1.Tables["menusayfa"].Rows.Count > 0)//bu yazılmazsa hata ortaya çıkar çünkü içerik girilmemişse engellemek için ...
                iceriktut.Append(ds1.Tables["menusayfa"].Rows[0]["icerik"].ToString());
            else iceriktut.Clear();

            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                if (ds1.Tables[0].Rows[i]["id"].ToString() == id)
                    menuismi = ds1.Tables[0].Rows[i]["ad"].ToString();
            conn.Close();


            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; DATA Source=" + Server.MapPath("blog.mdb");
            //------------------Online Kullanıcı-------------- //
            //if (!IsPostBack)
            //{
            Label1.Text = Application.Get("ziyaretci").ToString();
            //}

            //---------duyuruları çek eval dbaslık-dtarih---------//
            baglanti.Open();
            OleDbCommand cmd1 = new OleDbCommand("select* from duyurular", baglanti);
            OleDbDataReader dr1 = cmd1.ExecuteReader();
            Repeater1.DataSource = dr1;
            Repeater1.DataBind();
            baglanti.Close();

            //--------kategorileri çek eval kategoriad-----//
            baglanti.Open();
            OleDbCommand cmd2 = new OleDbCommand("select* from kategori", baglanti);
            OleDbDataReader dr2 = cmd2.ExecuteReader();
            DataList1.DataSource = dr2;
            DataList1.DataBind();
            baglanti.Close();

            //-------- makaleleri çek eval başlık------//
            baglanti.Open();
            OleDbCommand cmd3 = new OleDbCommand("select* from makale", baglanti);
            OleDbDataReader dr3 = cmd3.ExecuteReader();
            DataList2.DataSource = dr3;
            DataList2.DataBind();
            baglanti.Close();

            //------makale detay göster---------//
            baglanti.Open();
            DataSet ds = new DataSet();
            string gelenid;
            if (Request.QueryString.Count > 0) gelenid = Request.QueryString[0].ToString();//"makaleid"
            else gelenid = "1";//bu yazılmazsa hata verir.. ilk defa açıyorsa
            // string gelenid = Request.QueryString["duyurularid"].ToString();
            string sec = "select * from makale where makaleid=" + gelenid;
            OleDbDataAdapter da = new OleDbDataAdapter(sec, baglanti);
            da.Fill(ds, "makale");
            if (ds.Tables["makale"].Rows.Count > 0)
            {
                tutbaslik = ds.Tables["makale"].Rows[0]["baslik"].ToString();
                tutozet = ds.Tables["makale"].Rows[0]["ozet"].ToString();
                tuticerik.Append(ds.Tables["makale"].Rows[0]["icerik"].ToString());
                tuttarih = ds.Tables["makale"].Rows[0]["tarih"].ToString();
            }
            baglanti.Close();

            //---------Ziyaretçi sayacı-----------------//
            if(IsPostBack)///AÇÇÇÇÇ
            {
                string sorgu = "insert into sayac (adres,ip,kaynak,zaman) values(@adres,@ip,@kaynak,@zaman)";
                OleDbCommand komut = new OleDbCommand(sorgu, baglanti);
                komut.Parameters.AddWithValue("@adres", Request.ServerVariables["URL"].ToString());//Request.ServerVariables sitenin bulunduğu host ipsi
                komut.Parameters.AddWithValue("@ip", Request.ServerVariables["Remote_Addr"].ToString());
                komut.Parameters.AddWithValue("@kaynak", Request.ServerVariables["Http_User_Agent"].ToString());
                komut.Parameters.AddWithValue("@zaman", DateTime.Now.ToString());
                baglanti.Open();
                komut.ExecuteNonQuery();
                baglanti.Close();
            }
        }

        protected void gonder_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sec = "insert into iletisim(iletisimadsoyad,iletisimemail,iletisimicerik,iletisimtarih)values (@iletisimadsoyad,@iletisimemail,@iletisimicerik,@iletisimtarih)";
            OleDbCommand cmd = new OleDbCommand(sec, baglanti);
            cmd.Parameters.AddWithValue("@iletisimadsoyad", tbadsoyad.Text);
            cmd.Parameters.AddWithValue("@iletisimemail", tbemail.Text);
            cmd.Parameters.AddWithValue("@iletisimicerik", tbyorumicerik.Text);
            cmd.Parameters.AddWithValue("@iletisimtarih", DateTime.Now.ToString());
            cmd.ExecuteNonQuery();
            baglanti.Close();
            Label6.Text = "Mesajınız alındı";
            tbadsoyad.Text = "";
            tbemail.Text = "";
            tbyorumicerik.Text = "";
        }
    }
}