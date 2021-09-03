using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Xml;

namespace Web_Proje
{
    public partial class menu : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        OleDbConnection conn = new OleDbConnection();

        void oku()
        {
            ds.Clear();
            ds.ReadXml(Server.MapPath("menu.xml"));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] == null)
            {
                Response.Redirect("yoneticigiris.aspx");
            }
            if (!IsPostBack)
            {
                Panel1.Visible = false;
            }

            oku();
        }

        protected void ekle_Click(object sender, EventArgs e)
        {
            string ıd;
            XmlDocument x = new XmlDocument();
            x.Load(Server.MapPath("menu.xml"));
            XmlNodeList dl = x.SelectNodes("menuyatay/menu");
            foreach(XmlNode a in dl)
            {
                ıd = a.Attributes["id"].Value;
                if (ıd == id.Text)
                {
                    Label1.Text = "Aynı id kullanılamaz!";
                }
                else Label1.Text = "";
            }
            if(Label1.Text!="Aynı id kullanılamaz!")
            {
                DataRow dr = ds.Tables[0].NewRow();//
                dr["ad"] = ad.Text;
                dr["id"] = id.Text;
                ds.Tables[0].Rows.Add(dr);
                ds.WriteXml(Server.MapPath("menu.xml"));
                oku();//
            }
            ad.Text = "";
            id.Text = "";
            icerik.Text = "";
        }

        protected void sil_Click(object sender, EventArgs e)
        {
            int kayno = GridView1.SelectedIndex;
            if (kayno >= 0)
            {
                ds.Tables[0].Rows[kayno].Delete();
                ds.WriteXml(Server.MapPath("menu.xml"));
                oku();
            }
            else Response.Write("<script lang='JavaScript'>alert('Kayıt Seçin');</script>");
            ad.Text = "";
            id.Text = "";
            icerik.Text = "";
        }

        protected void duzelt_Click(object sender, EventArgs e)
        {
            int kayno = GridView1.SelectedIndex;
            if (kayno >= 0)
            {
                ds.Tables[0].Rows[kayno]["ad"] = ad.Text;
                ds.Tables[0].Rows[kayno]["id"] = id.Text;
                ds.WriteXml(Server.MapPath("menu.xml"));
                oku();
            }
            else Response.Write("<script lang='JavaScript'>alert('Kayıt Seçin');</script>");
            ad.Text = "";
            id.Text = "";
            icerik.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int kayno = GridView1.SelectedIndex;
            ad.Text = ds.Tables[0].Rows[kayno]["ad"].ToString();
            id.Text = ds.Tables[0].Rows[kayno]["id"].ToString();

            conn.ConnectionString = "Provider=Microsoft.Jet.OleDb.4.0;Data Source=" + Server.MapPath("~/blog.mdb");
            conn.Open();
            string sec = "select * from menusayfa where id='" + id.Text + "'";
            OleDbDataAdapter da = new OleDbDataAdapter(sec, conn);
            da.Fill(ds, "menusayfa");
            if (ds.Tables["menusayfa"].Rows.Count > 0)
                icerik.Text = ds.Tables["menusayfa"].Rows[0]["icerik"].ToString();
            else icerik.Text = "";
            conn.Close();

        }

        protected void kaydet_Click(object sender, EventArgs e)
        {  
            conn.ConnectionString = "Provider=Microsoft.Jet.OleDb.4.0;Data Source=" + Server.MapPath("~/blog.mdb");
            conn.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            if (GridView1.SelectedIndex >= 0)
            {
                cmd.CommandText = "delete from menusayfa where id='" + id.Text + "'";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "insert into menusayfa(id,icerik) values (@id,@icerik)";
                cmd.Parameters.AddWithValue("@id", id.Text);
                cmd.Parameters.AddWithValue("@icerik", icerik.Text);
                cmd.ExecuteNonQuery();

            }
            else Response.Write("<script lang='JavaScript'>alert('Kayıt Seçin');</script>");
            conn.Close();

            ad.Text = "";
            id.Text = "";
            icerik.Text = "";
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