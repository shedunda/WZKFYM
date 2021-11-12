using System;
using System.Data;
using System.Data.SqlTypes;
using System.IO;
using System.Reflection;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Xml.Serialization;

namespace YSCMS.Base
{
    public class Convertor
    {
        private static Array _AddToArray(Array V1, object V2)
        {
            Array array = V1;
            ConstructorInfo constructor = V1.GetType().GetConstructor(new Type[] { typeof(int) });
            Array array2 = null;
            if (V2 is Array)
            {
                Array array3 = (Array)V2;
                array2 = (Array)constructor.Invoke(new object[] { array.Length + array3.Length });
                for (int j = 0; j < array.Length; j++)
                {
                    array2.SetValue(array.GetValue(j), j);
                }
                for (int k = 0; k < array3.Length; k++)
                {
                    array2.SetValue(array3.GetValue(k), (int)(k + array.Length));
                }
                return array2;
            }
            array2 = (Array)constructor.Invoke(new object[] { array.Length + 1 });
            for (int i = 0; i < array.Length; i++)
            {
                array2.SetValue(array.GetValue(i), i);
            }
            array2.SetValue(V2, array.Length);
            return array2;
        }

        public static object Add(object V1, object V2)
        {
            if ((V1 == null) || (V1 == DBNull.Value))
            {
                return V2;
            }
            if ((V2 == null) || (V2 == DBNull.Value))
            {
                return V1;
            }
            if (V1 is Array)
            {
                return _AddToArray((Array)V1, V2);
            }
            if (V2 is Array)
            {
                return _AddToArray((Array)V2, V1);
            }
            if ((V1 is DateTime) && (V2 is TimeSpan))
            {
                DateTime time = (DateTime)V1;
                return time.Add((TimeSpan)V2);
            }
            if ((V2 is DateTime) && (V1 is TimeSpan))
            {
                DateTime time2 = (DateTime)V2;
                return time2.Add((TimeSpan)V1);
            }
            if (V1.GetType() != V2.GetType())
            {
                throw new ArgumentException("The 2 values can not be added, which are " + V1.ToString() + " and " + V2.ToString());
            }
            if (V1 is int)
            {
                return (((int)V1) + ((int)V2));
            }
            if (V1 is long)
            {
                return (((long)V1) + ((long)V2));
            }
            if (V1 is float)
            {
                return (((float)V1) + ((float)V2));
            }
            if (V1 is double)
            {
                return (((double)V1) + ((double)V2));
            }
            if (V1 is byte)
            {
                return (((byte)V1) + ((byte)V2));
            }
            if (V1 is decimal)
            {
                return (((decimal)V1) + ((decimal)V2));
            }
            if (V1 is string)
            {
                return (((string)V1) + ((string)V2));
            }
            if (V1 is bool)
            {
                return (((bool)V1) ? ((object)1) : ((object)((bool)V2)));
            }
            if (!(V1 is TimeSpan))
            {
                throw new Exception("The type " + V1.GetType().FullName + " can not be added.");
            }
            return (((TimeSpan)V1) + ((TimeSpan)V2));
        }

        public static object ByteArrayToObject(byte[] SerializedObj, bool ThrowException)
        {
            if (SerializedObj == null)
            {
                return null;
            }
            try
            {
                BinaryFormatter formatter = new BinaryFormatter();
                MemoryStream serializationStream = new MemoryStream(SerializedObj);
                return formatter.Deserialize(serializationStream);
            }
            catch (Exception exception)
            {
                if (ThrowException)
                {
                    throw exception;
                }
                return null;
            }
        }

        public static bool CanStatistic(Type Type)
        {
            if (((Type != typeof(long)) && (Type != typeof(bool))) && ((Type != typeof(double)) && (Type != typeof(int))))
            {
                return false;
            }
            return true;
        }

        public static bool Check(string Type, object Value)
        {
            if (Type == null)
            {
                return false;
            }
            return ((Type == typeof(object).FullName) || (((((Type != typeof(long).FullName) || (Value != null)) && ((Type != typeof(bool).FullName) || (Value != null))) && (((Type != typeof(char).FullName) || (Value != null)) && ((Type != typeof(byte).FullName) || (Value != null)))) && ((((Type != typeof(int).FullName) || (Value != null)) && ((Type != typeof(double).FullName) || (Value != null))) && ((((Type != typeof(DateTime).FullName) || (Value != null)) && ((Type != typeof(TimeSpan).FullName) || (Value != null))) && ((Value == null) || !(Type != Value.GetType().FullName))))));
        }

        public static bool Check(Type Type, object Value)
        {
            return Check(Type.FullName, Value);
        }

        public static object Convert(object Source, Type ConversionType)
        {
            return Convert(Source, ConversionType, true);
        }

        public static object Convert(object Source, Type ConversionType, bool ThrowException)
        {
            if (ConversionType == typeof(object))
            {
                return Source;
            }
            if ((Source != null) && (Source.GetType() == ConversionType))
            {
                return Source;
            }
            if ((Source == null) || (Source == DBNull.Value))
            {
                return GetDefaultValue(ConversionType);
            }
            try
            {
                if (ConversionType == typeof(DateTime))
                {
                    return DateTime.Parse(Source.ToString());
                }
                if (ConversionType == typeof(TimeSpan))
                {
                    return TimeSpan.Parse(Source.ToString());
                }
                if ((ConversionType.IsArray && (Source is string)) && (((string)Source) == ""))
                {
                    return null;
                }
                if (ConversionType == typeof(bool))
                {
                    if (((Source == null) || ((Source is int) && (((int)Source) == 0))) || ((Source is string) && ((((string)Source) == "0") || (((string)Source).ToLower() == "false"))))
                    {
                        return false;
                    }
                    if ((((Source == null) || !(Source is int)) || (((int)Source) != 1)) && (!(Source is string) || (!(((string)Source) == "1") && !(((string)Source).ToLower() == "true"))))
                    {
                        throw new InvalidCastException("Can't convert \"" + Source + "\" to System.Boolean.");
                    }
                    return true;
                }
                return System.Convert.ChangeType(Source, ConversionType);
            }
            catch (Exception exception)
            {
                if (ThrowException)
                {
                    throw exception;
                }
                return GetDefaultValue(ConversionType);
            }
        }

        public static bool Convert(object Source, Type ConversionType, ref object Result)
        {
            try
            {
                Result = Convert(Source, ConversionType, true);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static string CreateShortGuid()
        {
            return ToShortGuid(Guid.NewGuid());
        }

        public static string Format(DateTime Time)
        {
            return string.Concat(new object[] { Time.Year, "/", Time.Month, "/", Time.Day, " ", Time.Hour, ":", Time.Minute });
        }

        public static double GetDays(TimeSpan Span)
        {
            return (((Span.Days + (((double)Span.Hours) / 24.0)) + ((((double)Span.Minutes) / 24.0) / 60.0)) + (((((double)Span.Seconds) / 24.0) / 60.0) / 60.0));
        }

        public static string GetDefaultStringValue(Type Type)
        {
            if (Type == typeof(bool))
            {
                return "false";
            }
            object defaultValue = GetDefaultValue(Type);
            if (defaultValue == null)
            {
                return "";
            }
            return defaultValue.ToString();
        }

        public static object GetDefaultValue(Type Type)
        {
            if (Type != typeof(string))
            {
                if (Type == typeof(DateTime))
                {
                    return DateTime.MinValue;
                }
                if (Type == typeof(bool))
                {
                    return false;
                }
                if (Type == typeof(double))
                {
                    return 0.0;
                }
                if (Type == typeof(int))
                {
                    return 0;
                }
                if (Type == typeof(long))
                {
                    return 0;
                }
                if (Type == typeof(TimeSpan))
                {
                    return new TimeSpan(0L);
                }
                if (Type == typeof(DataTable))
                {
                    return null;
                }
                if (Type == typeof(SqlDateTime))
                {
                    return SqlDateTime.MinValue;
                }
            }
            return null;
        }

        public static object GetProperty(object Obj, string PropertyName)
        {
            if (Obj == null)
            {
                return null;
            }
            if (string.IsNullOrEmpty(PropertyName))
            {
                throw new ArgumentNullException();
            }
            PropertyInfo property = Obj.GetType().GetProperty(PropertyName);
            if (property == null)
            {
                throw new ArgumentNullException();
            }
            MethodInfo getMethod = property.GetGetMethod();
            if (getMethod == null)
            {
                throw new ArgumentNullException();
            }
            return getMethod.Invoke(Obj, null);
        }

        private static int HexCharToInt(char HexChar)
        {
            if (HexChar == '0')
            {
                return 0;
            }
            if (HexChar == '1')
            {
                return 1;
            }
            if (HexChar == '2')
            {
                return 2;
            }
            if (HexChar == '3')
            {
                return 3;
            }
            if (HexChar == '4')
            {
                return 4;
            }
            if (HexChar == '5')
            {
                return 5;
            }
            if (HexChar == '6')
            {
                return 6;
            }
            if (HexChar == '7')
            {
                return 7;
            }
            if (HexChar == '8')
            {
                return 8;
            }
            if (HexChar == '9')
            {
                return 9;
            }
            if ((HexChar == 'a') || (HexChar == 'A'))
            {
                return 10;
            }
            if ((HexChar == 'b') || (HexChar == 'B'))
            {
                return 11;
            }
            if ((HexChar == 'c') || (HexChar == 'C'))
            {
                return 12;
            }
            if ((HexChar == 'd') || (HexChar == 'D'))
            {
                return 13;
            }
            if ((HexChar == 'e') || (HexChar == 'E'))
            {
                return 14;
            }
            if ((HexChar != 'f') && (HexChar != 'F'))
            {
                throw new NotImplementedException();
            }
            return 15;
        }

        public static long HexStringToLong(string HexString)
        {
            if ((HexString == null) || (HexString.Length == 0))
            {
                return 0L;
            }
            long num = 0L;
            for (int i = 0; i < HexString.Length; i++)
            {
                char hexChar = HexString[i];
                num = (num * 0x10L) + HexCharToInt(hexChar);
            }
            return num;
        }

        public static bool IsSearchable(Type Type)
        {
            if ((((Type != typeof(long)) && (Type != typeof(bool))) && ((Type != typeof(double)) && (Type != typeof(int)))) && ((Type != typeof(string)) && (Type != typeof(DateTime))))
            {
                return false;
            }
            return true;
        }

        public static bool IsSerializable(object Obj)
        {
            if (Obj == null)
            {
                return true;
            }
            try
            {
                BinaryFormatter formatter = new BinaryFormatter();
                MemoryStream serializationStream = new MemoryStream();
                formatter.Serialize(serializationStream, Obj);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static byte[] ObjectToByteArray(object Obj, bool ThrowException)
        {
            if (Obj == null)
            {
                return null;
            }
            try
            {
                BinaryFormatter formatter = new BinaryFormatter();
                MemoryStream serializationStream = new MemoryStream();
                formatter.Serialize(serializationStream, Obj);
                return serializationStream.ToArray();
            }
            catch (Exception exception)
            {
                if (ThrowException)
                {
                    throw exception;
                }
                return null;
            }
        }

        public static string ObjectToString(object Obj)
        {
            if (Obj == null)
            {
                return null;
            }
            byte[] inArray = ObjectToByteArray(Obj, true);
            if (inArray == null)
            {
                return null;
            }
            return System.Convert.ToBase64String(inArray);
        }

        public static string ObjectToXml(object Obj)
        {
            if (Obj == null)
            {
                return null;
            }
            if (Obj is string)
            {
                return (string)Obj;
            }
            XmlSerializer serializer = new XmlSerializer(Obj.GetType());
            StringBuilder sb = new StringBuilder();
            StringWriter writer = new StringWriter(sb);
            serializer.Serialize((TextWriter)writer, Obj);
            return sb.ToString();
        }

        public static object SetProperty(object Obj, string PropertyName, object PropertyValue)
        {
            if (Obj == null)
            {
                return null;
            }
            if (string.IsNullOrEmpty(PropertyName))
            {
                throw new ArgumentNullException();
            }
            PropertyInfo property = Obj.GetType().GetProperty(PropertyName);
            if (property == null)
            {
                throw new ArgumentNullException();
            }
            MethodInfo setMethod = property.GetSetMethod();
            if (setMethod == null)
            {
                throw new ArgumentNullException();
            }
            return setMethod.Invoke(Obj, new object[] { PropertyValue });
        }

        public static object StringToObject(string S)
        {
            if (string.IsNullOrEmpty(S))
            {
                return null;
            }
            return ByteArrayToObject(System.Convert.FromBase64String(S), true);
        }

        private static char ToBase32Char(int Value)
        {
            if (Value < 10)
            {
                char ch = '0';
                int num = ch;
                int num2 = Value + num;
                return (char)num2;
            }
            if (Value >= 0x20)
            {
                throw new NotImplementedException();
            }
            char ch3 = 'a';
            int num3 = ch3;
            int num4 = (Value + num3) - 10;
            return (char)num4;
        }

        public static string ToBase32String(byte Value)
        {
            return ToBase32String((long)Value);
        }

        public static string ToBase32String(long Value)
        {
            if (Value < 0L)
            {
                return ("-" + ToUnsignedBase32String(-Value));
            }
            if (Value == 0L)
            {
                return "0";
            }
            return ToUnsignedBase32String(Value);
        }

        private static string ToBase32String(long Value, int Length)
        {
            string str = ToBase32String(Value);
            int num = Length - str.Length;
            for (int i = 0; i < num; i++)
            {
                str = str.Insert(0, "0");
            }
            return str;
        }

        public static string ToShortGuid(Guid Guid)
        {
            string str;
            byte[] buffer = Guid.ToByteArray();
            StringBuilder builder = new StringBuilder();
            long num = 0L;
            for (int i = 0; i < 15; i += 5)
            {
                num = (((buffer[i] * 0x100) * 0x10) + (buffer[i + 1] * 0x10)) + (buffer[i + 2] / 0x10);
                str = ToBase32String(num, 4);
                builder.Append(str);
                num = ((((buffer[i + 2] % 0x10) * 0x100) * 0x100) + (buffer[i + 3] * 0x100)) + buffer[i + 4];
                str = ToBase32String(num, 4);
                builder.Append(str);
            }
            str = ToBase32String((long)buffer[15], 2);
            builder.Append(str);
            return builder.ToString();
        }

        private static string ToUnsignedBase32String(long Value)
        {
            if (Value < 0L)
            {
                throw new NotImplementedException();
            }
            StringBuilder builder = new StringBuilder();
            for (long i = Value; i > 0L; i /= 0x20L)
            {
                int num2 = (int)(i % 0x20L);
                char ch = ToBase32Char(num2);
                builder.Insert(0, ch);
            }
            if (builder.Length == 0)
            {
                return "0";
            }
            return builder.ToString();
        }

        public static object XmlToObject(Type Type, string Xml)
        {
            if ((Type == typeof(string)) || Type.IsSubclassOf(typeof(string)))
            {
                return Xml;
            }
            if (string.IsNullOrEmpty(Xml))
            {
                return GetDefaultValue(Type);
            }
            XmlSerializer serializer = new XmlSerializer(Type);
            StringReader textReader = new StringReader(Xml);
            return serializer.Deserialize(textReader);
        }
    }
}