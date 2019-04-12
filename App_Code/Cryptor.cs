using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Encrypt Password and Decrypt
/// </summary>
public class Cryptor
{

    DBUtil dbutil = new DBUtil();
    public Cryptor()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string SecuredLogin(string password)
    {
        if (password.Trim() != string.Empty)
        {
            //code to encrypt via key
            //return the code
            return password;
        }
        else
        {
            return "Invalid Password!";
        }
    }
    public string Login(string username, string password)
    {
        DataTable dt = new DataTable();
        dt = dbutil.GetData(string.Format("select 1 from employeelogin where username='{0}' and password='{1}'", username, password), "Invalid Credentials!");
        return (dt.Rows.Count.ToString() == "1" ? "valid" : "invalid");
    }

    public int ValidateAccessLevel(string username)
    {
        DataTable dt = new DataTable();
        dt = dbutil.GetData(string.Format("select 1 from employeelogin where username='{0}' and accesslevel=1", username), "Invalid Credentials!");
        return (dt.Rows.Count.ToString() == "1" ? 1 : 0);
    }

    public static string Decrypt(string cipherString, bool useHashing)
    {
        byte[] buffer;
        byte[] inputBuffer = Convert.FromBase64String(cipherString);
        string s = "L3M";
        if (!useHashing)
        {
            buffer = Encoding.UTF8.GetBytes(s);
        }
        else
        {
            MD5CryptoServiceProvider provider = new MD5CryptoServiceProvider();
            buffer = provider.ComputeHash(Encoding.UTF8.GetBytes(s));
            provider.Clear();
        }
        TripleDESCryptoServiceProvider provider2 = new TripleDESCryptoServiceProvider
        {
            Key = buffer,
            Mode = CipherMode.ECB,
            Padding = PaddingMode.PKCS7
        };
        byte[] bytes = provider2.CreateDecryptor().TransformFinalBlock(inputBuffer, 0, inputBuffer.Length);
        provider2.Clear();
        return Encoding.UTF8.GetString(bytes);
    }

    public static string Encrypt(string toEncrypt, bool useHashing)
    {
        byte[] buffer;
        byte[] bytes = Encoding.UTF8.GetBytes(toEncrypt);
        string s = "L3M";
        if (!useHashing)
        {
            buffer = Encoding.UTF8.GetBytes(s);
        }
        else
        {
            MD5CryptoServiceProvider provider = new MD5CryptoServiceProvider();
            buffer = provider.ComputeHash(Encoding.UTF8.GetBytes(s));
            provider.Clear();
        }
        TripleDESCryptoServiceProvider provider2 = new TripleDESCryptoServiceProvider
        {
            Key = buffer,
            Mode = CipherMode.ECB,
            Padding = PaddingMode.PKCS7
        };
        byte[] inArray = provider2.CreateEncryptor().TransformFinalBlock(bytes, 0, bytes.Length);
        provider2.Clear();
        return Convert.ToBase64String(inArray, 0, inArray.Length);
    }

    public static string GetMd5Hash(MD5 md5Hash, string input)
    {
        byte[] buffer = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < buffer.Length; i++)
        {
            builder.Append(buffer[i].ToString("x2"));
        }
        return builder.ToString();
    }
}