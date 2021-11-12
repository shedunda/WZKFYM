using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace YSCMS.Base
{
    public class SimpleEncryptor
    {
        public static byte[] DESDecrypt(byte[] EncryptedConent)
        {
            if (EncryptedConent == null)
            {
                return null;
            }
            byte[] buffer = new byte[] { 0xdb, 0xe9, 0x9e, 0xe0, 0x8d, 0xfb, 0xf3, 0xc3 };
            DESCryptoServiceProvider provider = new DESCryptoServiceProvider();
            provider.Key = buffer;
            provider.IV = buffer;
            MemoryStream stream = new MemoryStream(EncryptedConent);
            ICryptoTransform transform = provider.CreateDecryptor();
            CryptoStream stream2 = new CryptoStream(stream, transform, CryptoStreamMode.Read);
            StreamReader reader = new StreamReader(stream2);
            byte[] bytes = Encoding.ASCII.GetBytes(reader.ReadToEnd());
            reader.Close();
            stream2.Close();
            stream.Close();
            return bytes;
        }

        public static byte[] DESEncrypt(byte[] Content)
        {
            if (Content == null)
            {
                return null;
            }
            byte[] buffer = new byte[] { 0xdb, 0xe9, 0x9e, 0xe0, 0x8d, 0xfb, 0xf3, 0xc3 };
            DESCryptoServiceProvider provider = new DESCryptoServiceProvider();
            provider.Key = buffer;
            provider.IV = buffer;
            MemoryStream stream = new MemoryStream();
            ICryptoTransform transform = provider.CreateEncryptor();
            CryptoStream stream2 = new CryptoStream(stream, transform, CryptoStreamMode.Write);
            stream2.Write(Content, 0, Content.Length);
            stream2.Close();
            byte[] buffer2 = stream.ToArray();
            stream.Close();
            return buffer2;
        }

        public static string RSAGetSignature(string PrivateKey, string Code)
        {
            RSACryptoServiceProvider key = new RSACryptoServiceProvider();
            key.FromXmlString(PrivateKey);
            RSAPKCS1SignatureFormatter formatter = new RSAPKCS1SignatureFormatter(key);
            formatter.SetHashAlgorithm("SHA1");
            byte[] bytes = Encoding.ASCII.GetBytes(Code);
            byte[] rgbHash = new SHA1Managed().ComputeHash(bytes);
            return Convert.ToBase64String(formatter.CreateSignature(rgbHash));
        }

        public static bool RSAVerify(string PublicKey, string Code, string Key)
        {
            try
            {
                RSACryptoServiceProvider key = new RSACryptoServiceProvider();
                key.FromXmlString(PublicKey);
                RSAPKCS1SignatureDeformatter deformatter = new RSAPKCS1SignatureDeformatter(key);
                deformatter.SetHashAlgorithm("SHA1");
                byte[] rgbSignature = Convert.FromBase64String(Key);
                byte[] rgbHash = new SHA1Managed().ComputeHash(Encoding.ASCII.GetBytes(Code));
                return deformatter.VerifySignature(rgbHash, rgbSignature);
            }
            catch
            {
                return false;
            }
        }

    }
}