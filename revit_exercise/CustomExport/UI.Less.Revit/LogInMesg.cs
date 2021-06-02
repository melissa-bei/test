using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace UI.Less.Revit
{
    class Auth
    {
        public const string DECREPT_KEY = "cadg1234";
    }

    public class LoginUserInfo
    {
        public string entId { get; set; }
        public string entName { get; set; }
        public string phone { get; set; }
        public string qq { get; set; }
        public string ticket { get; set; }
        public string userName { get; set; }
        public string email { get; set; }
        public string password { get; set; }

        private static LoginUserInfo curUser = null;

        /// <summary>
        /// 通过登录时生成的缓存文件获取用户信息，可从中抽取有效信息
        /// </summary>
        /// <returns></returns>
        public static LoginUserInfo GetCurrentLoginUserInfo()
        {
            if (curUser != null)
            {
                return curUser;
            }

            // string PATH = Environment.GetEnvironmentVariable("USERPROFILE") + @"\AutoLog.ini";
            string PATH = @"AutoLog.ini";
            LoginUserInfo ui = new LoginUserInfo();
            if (!File.Exists(PATH)) return null;
            FileStream ofile = null;
            StreamReader sr = null;
            try
            {
                ofile = new FileStream(PATH, FileMode.OpenOrCreate);
                sr = new StreamReader(ofile);

                //Load Data
                ui.entId = Decrypt(sr.ReadLine(), Auth.DECREPT_KEY);
                ui.entName = Decrypt(sr.ReadLine(), Auth.DECREPT_KEY);
                ui.phone = Decrypt(sr.ReadLine(), Auth.DECREPT_KEY);
                ui.qq = Decrypt(sr.ReadLine(), Auth.DECREPT_KEY);
                ui.ticket = Decrypt(sr.ReadLine(), Auth.DECREPT_KEY);
                ui.userName = Decrypt(sr.ReadLine(), Auth.DECREPT_KEY);
                ui.email = Decrypt(sr.ReadLine(), Auth.DECREPT_KEY);
                ui.password = Decrypt(sr.ReadLine(), Auth.DECREPT_KEY);
                //headers.Add("Authorization", "Bearer " + ticket);
            }
            catch (Exception ex)
            {
                throw new Exception("登录信息获取异常。\n" + ex.Message);
            }
            finally
            {
                sr.Close();
                ofile.Close();
            }

            //信息解密
            string Decrypt(string pToDecrypt, string sKey)
            {
                byte[] inputByteArray = Convert.FromBase64String(pToDecrypt);
                using (DESCryptoServiceProvider des = new DESCryptoServiceProvider())
                {
                    des.Key = ASCIIEncoding.ASCII.GetBytes(sKey);
                    des.IV = ASCIIEncoding.ASCII.GetBytes(sKey);
                    System.IO.MemoryStream ms = new System.IO.MemoryStream();
                    using (CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(inputByteArray, 0, inputByteArray.Length);
                        cs.FlushFinalBlock();
                        cs.Close();
                    }
                    string str = Encoding.UTF8.GetString(ms.ToArray());
                    ms.Close();
                    return str;
                }
            }

            curUser = ui;

            return ui;
        }

        public override string ToString()
        {
            return $"entId: {entId}\n" +
                   $"entName: {entName}\n" +
                   $"phone: {phone}\n" +
                   $"qq: {qq}\n" +
                   $"ticket: {ticket}\n" +
                   $"useName: {userName}\n" +
                   $"email: {email}\n" +
                   $"password: {password}"
                   ;
        }

    }
}
