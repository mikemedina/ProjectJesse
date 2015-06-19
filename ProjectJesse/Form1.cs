using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProjectJesse
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "csv files (*.csv)|*.csv|All files (*.*)|*.*";

            if (ofd.ShowDialog() == DialogResult.OK)
            {
                txtPath.Text = ofd.FileName;
            }
        }

        private void btnImport_Click(object sender, EventArgs e)
        {
            DataTable importedData = getData();

            if (importedData == null) return;

            saveToDatabase(importedData);

            MessageBox.Show("Data imported successfully!");
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private DataTable getData()
        {
            DataTable importedData = new DataTable();
            try
            {
                using (StreamReader reader = new StreamReader(txtPath.Text))
                {
                    string firstLine = reader.ReadLine();
                    if (string.IsNullOrEmpty(firstLine))
                    {
                        Console.WriteLine("No data");
                        return null;
                    }

                    string[] columnHeaders = firstLine.Split(',');
                    foreach (string columnHeader in columnHeaders)
                    {
                        importedData.Columns.Add(columnHeader);
                    }

                    while (!reader.EndOfStream)
                    {
                        string line = reader.ReadLine();
                        if (string.IsNullOrEmpty(line)) continue;

                        string[] fields = line.Split(',');
                        DataRow importedRow = importedData.NewRow();

                        for (int i = 0; i < fields.Count(); i++)
                        {
                            importedRow[i] = fields[i];
                        }
                        importedData.Rows.Add(importedRow);
                    }
                    txtPath.Text = "";
                    return importedData;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                return null;
            }
        }

        private void saveToDatabase(DataTable importedData)
        {
            string connString = "Server=localhost;Database=master;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                foreach (DataRow importRow in importedData.Rows)
                {
                    decimal rate;
                    decimal.TryParse(importRow["Rate"].ToString(), out rate);

                    SqlCommand cmd = new SqlCommand("INSERT INTO ImportTable (StationID, ClientID, Rate, ShowID)" +
                                                    "VALUES (@stationID, @clientID, @rate, @showID)", conn);
                    cmd.Parameters.AddWithValue("@stationID", getStationID((string)importRow["StationName"]));
                    cmd.Parameters.AddWithValue("@clientID", getClientID((string)importRow["ClientName"]));
                    cmd.Parameters.AddWithValue("@rate", rate);//(decimal)importRow["Rate"]);
                    cmd.Parameters.AddWithValue("@showID", getShowID((string)importRow["ShowTitleName"]));

                    cmd.ExecuteNonQuery();
                }
            }
        }

        private int getStationID(string stationName)
        {
            string connString = "Server=localhost;Database=master;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT Id FROM Station WHERE name = '" + stationName + "'", conn);

                return (int)cmd.ExecuteScalar();
            }
        }

        private int getClientID(string clientName)
        {
            string connString = "Server=localhost;Database=master;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT Id FROM Client WHERE name = '" + clientName + "'", conn);

                return (int)cmd.ExecuteScalar();
            }
        }

        private int getShowID(string showName)
        {
            string connString = "Server=localhost;Database=master;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT Id FROM ShowTitle WHERE name = '" + showName + "'", conn);

                return (int)cmd.ExecuteScalar();
            }
        }
    }
}
