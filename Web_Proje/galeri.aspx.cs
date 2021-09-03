using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Web_Proje
{
    public partial class galeri : System.Web.UI.Page
    {
        int i;
        string[] klasordekiler;
        string[] resimler;
        void resimleri_al_goster()
        {

            klasordekiler = Directory.GetFiles(Server.MapPath("kresim"));
            resimler = new string[klasordekiler.Count()];
            for (i = 0; i < klasordekiler.Count(); i++)
            {
                resimler[i] = "/kresim/" + Path.GetFileName(klasordekiler[i]);
                Image1.ImageUrl = resimler[i];
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                i = 0;
                Session["ts"] = 0;
                Timer1.Enabled = false;//true otomatik başlıyor...
            }
            resimleri_al_goster();
        }

        protected void btnbaslat_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = true;
            i++;
            i = int.Parse(Session["ts"].ToString());
            Session["ts"] = i;//
            Image1.ImageUrl = resimler[i];
        }

        protected void btndurdur_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            i = int.Parse(Session["ts"].ToString());
            Image1.ImageUrl = resimler[i];
            Session["ts"] = i;
        }

        protected void btngeri_Click(object sender, EventArgs e)
        {
            i = int.Parse(Session["ts"].ToString());
            if (i == 0)
                i = klasordekiler.Count();
            i--;
            Session["ts"] = i;
            Image1.ImageUrl = resimler[i];
        }

        protected void btnileri_Click(object sender, EventArgs e)
        {
            i = int.Parse(Session["ts"].ToString());
            i++;
            if (i == klasordekiler.Count()) i = 0;
            Session["ts"] = i;
            Image1.ImageUrl = resimler[i];
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            i = int.Parse(Session["ts"].ToString());
            i++;
            if (i == klasordekiler.Count()) i = 0;
            Image1.ImageUrl = resimler[i];
            Session["ts"] = i;
        }
    }
}