using FluentNHibernate.Automapping;
using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using NHibernate;
using NHibernate.Cfg;
using NHibernate.Tool.hbm2ddl;
using seti.Entities;
using System;
using System.Windows.Forms;
using System.Reflection;
using StructureMap;
using System.Xml;
using System.IO;
using seti.Shared;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using NHibernate.Linq;

namespace seti
{
    public partial class Form1 : Form
    {
        private static IContainer container;


        public Form1(IContainer _container)
        {
            container = _container;

            InitializeComponent();

            DoSomething();
        }

        private void DoSomething()
        {
            log("create nhibernate factory.");
            var sessionFactory = container.GetInstance<ISessionFactory>();

            if (sessionFactory == null)
            {
                log("sessionFactory is null");
                return;
            }

            IQueryable projects;

            using (var session = sessionFactory.OpenSession())
            {
                using (var transaction = session.BeginTransaction())
                {
                    log("create project");

                    projects = session.Query<Project>();



                    //var project = new Project
                    //{
                    //    ProjectId = 1,
                    //    UpdateTime = DateTime.Now,
                    //    TotalTeams = 42,
                    //    TotalUsers = 42*10,
                    //    TotalHosts = 42*10*10,
                    //    TotalCredits = 42*10*10*10
                    //};

                    //session.SaveOrUpdate(project);

                    this.dataGridView1.DataSource = projects;
                    this.dataGridView1.AllowUserToAddRows = true;

                    transaction.Commit();
                }
            }

            BindingSource bs = new BindingSource();
            //bs.DataSource = projects;
            bs.AddingNew += Bs_AddingNew;
            bs.AllowNew = true;

            


        }

        private void Bs_AddingNew(object sender, System.ComponentModel.AddingNewEventArgs e)
        {
            //throw new NotImplementedException();
        }

        public void log (string msg)
        {
            txtConsole.Text += DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss") + " :: " + msg + "\r\n";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //time to go...

            log("xmlnano");
            FileStream fs = new FileStream(@"C:\work\batch\batch\data\user", FileMode.Open, FileAccess.Read);
            byte[] data = new byte[fs.Length];
            fs.Read(data, 0, (int)fs.Length);
            fs.Close();

            string strData = Encoding.UTF8.GetString(data);
            NanoXMLDocument xml = new NanoXMLDocument(strData);
            User userObject;

            IList<User> Users = new List<User>();

            foreach (var user in xml.RootNode.SubNodes)
            {
                userObject = new User { ProjectId = 1 };
                foreach (var info in user.SubNodes)
                {
                    switch (info.Name)
                    {
                        case "id": break;
                        case "name":
                            if (string.IsNullOrEmpty(info.Value)) break;
                            var bytes = Encoding.Default.GetBytes(info.Value);
                            userObject.Name = Encoding.UTF8.GetString(bytes);
                            break;
                        case "country":
                            userObject.Country = info.Value;
                            break;
                        case "create_time":
                            userObject.CreateTime = Convert.ToUInt32(info.Value);
                            break;
                        case "total_credit":
                            userObject.TotalCredit = Convert.ToDecimal(info.Value);
                            break;
                        case "expavg_credit":
                            userObject.ExpAvgCredit = Convert.ToDecimal(info.Value);
                            break;
                        case "expavg_time":
                            userObject.ExpAvgTime = Convert.ToDecimal(info.Value);
                            break;
                        case "cpid":
                            userObject.Id = info.Value;
                            break;
                        case "url":
                            userObject.Url = info.Value;
                            break;
                        case "teamid":
                            userObject.TeamId = Convert.ToUInt32(info.Value);
                            break;
                        case "has_profile":
                            userObject.HasProfile = Convert.ToBoolean(info.Value);
                            break;
                        default:
                            break;
                    }
                }

                Users.Add(userObject);
            }

            log("create nhibernate factory.");
            var sessionFactory = container.GetInstance<ISessionFactory>();

            if (sessionFactory == null)
            {
                log("sessionFactory is null");
                return;
            }

            for (int i = 0; 1000*i <= Users.Count; i++)
            {
                using (IStatelessSession statelessSession = sessionFactory.OpenStatelessSession())
                {
                    foreach (var user in Users.Skip(i * 1000).Take(1000))
                    {
                        statelessSession.Insert(user);
                    }  
                }
            }

            log("/xmlnano");


            
        }

        private void dataGridView1_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            log("row index: " + e.RowIndex.ToString());

            var o = sender as DataGridView;

            //log("item index: " + o.);
        }
    }
}
