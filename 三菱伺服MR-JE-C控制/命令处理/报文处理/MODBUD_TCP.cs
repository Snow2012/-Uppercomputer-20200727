﻿using CCWin.SkinClass;
using CCWin.SkinControl;
using CCWin.Win32.Const;
using HslCommunication;
using HslCommunication.ModBus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using HslCommunication.Core;
namespace 命令处理
{
    /// <summary>
    /// MODBUS-TCP通讯协议--open-读取-写入--继承接口IPLC_interface
    /// 继承宏指令接口实现宏指令--macroinstruction_PLC_interface
    /// </summary>
    public class MODBUD_TCP : PLC_public_Class
    {
        /// <summary>
        /// IP地址
        /// </summary>
        public static IPEndPoint IPEndPoint { get; set; }//IP地址
        string pattern;
        static private bool PLC_ready;//内部PLC状态
        static private int PLCerr_code;//内部报警代码
        static private string PLCerr_content;//内部报警内容
        /// <summary>
        /// 引用HslCommunication.ModBus进行实现
        /// </summary>
        public static ModbusTcpNet busTcpClient = null;//引用HslCommunication.ModBus进行实现
                                                          //实现接口的属性
        /// <summary>
        /// 实现接口的属性 PLC状态
        /// </summary>
        public static bool IPLC_interface_PLC_ready { get => PLC_ready; } //PLC状态
        /// <summary>
        /// PLC报警代码
        /// </summary>
        public static int IPLC_interface_PLCerr_code { get => PLCerr_code; }//PLC报警代码
        /// <summary>
        /// PLC报警内容
        /// </summary>
        public static string IPLC_interface_PLCerr_content { get => PLCerr_content; }//PLC报警内容
        /// <summary>
        /// modbus监控窗口
        /// </summary>
        //modbus监控窗口
        public static SkinChatRichTextBox SkinChatRichTextBox1, SkinChatRichTextBox2;
        /// <summary>
        /// /互斥锁(Mutex)，用于多线程中防止两条线程同时对一个公共资源进行读写的机制。
        /// </summary>
        //互斥锁(Mutex)，用于多线程中防止两条线程同时对一个公共资源进行读写的机制。
        static Mutex mutex;//定义互斥锁名称
        /// <summary>
        /// 构造函数---初始化---open
        /// </summary>
        /// <param name="iPEndPoint"></param>
        /// <param name="pattern"></param>
        public MODBUD_TCP(IPEndPoint iPEndPoint, string pattern)//构造函数---初始化---open
        {
            MODBUD_TCP.IPEndPoint = iPEndPoint;//实例化IP地址
            this.pattern = pattern;
            PLC_busy = false;
            PLC_ready = false;
            mutex = new Mutex();//实例化互斥锁(Mutex)
        }
        /// <summary>
        /// 构造函数---多态
        /// </summary>
        public MODBUD_TCP()//构造函数---多态
        {

        }
        /// <summary>
        /// 打开端口
        /// </summary>
        /// <returns></returns>
        public  string IPLC_interface_PLC_open()//打开端口
        {
            try
            {
                busTcpClient?.ConnectClose();//切换模式
                PLC_ready = false;
                busTcpClient = new ModbusTcpNet(MODBUD_TCP.IPEndPoint.Address.ToString(), MODBUD_TCP.IPEndPoint.Port);//传入IP与端口
                busTcpClient.ConnectTimeOut = 2000;//X超时时间
                busTcpClient.ReceiveTimeOut = 2000;
                OperateResult connect = busTcpClient.ConnectServer();//是否打开成功？
                if (connect.IsSuccess)
                {
                    PLC_ready = true;//PLC开放正常
                    PLC_busy = false;//允许访问
                    MessageBox.Show("已链接到伺服");
                    return "链接PLC正常";//已连接到服务器        
                }
                else
                {
                    PLC_ready = false;//PLC开放异常
                    PLC_busy = false;//允许访问
                    // 切断连接
                    busTcpClient.ConnectClose();
                    //推出异常
                    MessageBox.Show("连接MODBUS_TCP  " + MODBUD_TCP.IPEndPoint.Address.ToString() + "失败--请检查下位机设备状态");
                    return "链接PLC异常";//尝试连接PLC，如果连接成功则返回值为0                   
                }
            }
            catch (Exception Err)
            {
                MODBUD_TCP.err(Err);//异常处理
                return "链接PLC异常";//尝试连接PLC，如果连接成功则返回值为0
            }
        }
        /// <summary>
        /// 读取PLC 位状态 --D_bit这类需要自己在表流获取当前位状态--M这类不需要
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<bool> IPLC_interface_PLC_read_M_bit(string Name, string id)//读取PLC 位状态 --D_bit这类需要自己在表流获取当前位状态--M这类不需要
        {
            string result = "FALSE";//定义获取数据变量
            lock (this)
            {
                try
                {
                    mutex.WaitOne(3000);
                    readResultRender(busTcpClient.ReadBool(id), id, ref result);//格式--读取地址-地址，返回数据--地址决定了是Nmae的类型            
                    mutex.ReleaseMutex();
                }
                catch { }
            }
            return new List<bool>() { Convert.ToBoolean(result ?? "FALSE") };//返回数据
        }

        /// <summary>
        /// 写入PLC 位状态 --D_bit这类需要自己在表流获取当前位状态--M这类不需要
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="id"></param>
        /// <param name="button_State"></param>
        /// <returns></returns>
        public List<bool> IPLC_interface_PLC_write_M_bit(string Name, string id, Button_state button_State)//写入PLC 位状态 --D_bit这类需要自己在表流获取当前位状态--M这类不需要
        {
            string result = "FALSE";//定义获取数据变量
            lock (this)
            {
                try
                {
                    mutex.WaitOne(3000);
                    writeResultRender(busTcpClient.WriteCoil(id, Convert.ToBoolean(button_State.ToInt32())), id);
                    result = "1";//写入1   
                    mutex.ReleaseMutex();
                }
                catch { }
            }
            return new List<bool>() { Convert.ToBoolean(Convert.ToInt32(result)) };//返回数据
        }

        /// <summary>
        /// 读寄存器--转换相应类型
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="id"></param>
        /// <param name="format"></param>
        /// <returns></returns>
        public string IPLC_interface_PLC_read_D_register(string Name, string id, numerical_format format)//读寄存器--转换相应类型
        {
            string result = "0";//定义获取数据变量    
            lock (this)
            {
                try
                {
                    mutex.WaitOne(3000);
                    switch (format)
                    {
                        case numerical_format.Signed_16_Bit:
                        case numerical_format.BCD_16_Bit:
                            // 读取short变量
                            readResultRender(busTcpClient.ReadInt16(id), id, ref result);
                            break;
                        case numerical_format.Signed_32_Bit:
                        case numerical_format.BCD_32_Bit:
                            // 读取int变量
                            readResultRender(busTcpClient.ReadInt32(id), id, ref result);
                            break;
                        case numerical_format.Binary_16_Bit:
                            // 读取16位二进制数
                            String data_1 = Convert.ToString(result.ToInt32(), 2);
                            readResultRender(busTcpClient.ReadInt16(id), id, ref data_1);
                            break;
                        case numerical_format.Binary_32_Bit:
                            // 读取32位二进制数
                            String data_2 = Convert.ToString(result.ToInt32(), 2);
                            readResultRender(busTcpClient.ReadInt32(id), id, ref data_2);
                            break;
                        case numerical_format.Float_32_Bit:
                            // 读取float变量
                            readResultRender(busTcpClient.ReadFloat(id), id, ref result);
                            break;
                        case numerical_format.Hex_16_Bit:
                            // 读取short变量
                            readResultRender(busTcpClient.ReadInt16(id), id, ref result);
                            result = Convert.ToInt32(result).ToString("X");
                            break;
                        case numerical_format.Hex_32_Bit:
                            // 读取int变量
                            readResultRender(busTcpClient.ReadInt32(id), id, ref result);
                            result = Convert.ToInt32(result).ToString("X");
                            break;
                        case numerical_format.Unsigned_16_Bit:
                            // 读取ushort变量
                            readResultRender(busTcpClient.ReadUInt16(id), id, ref result);
                            break;
                        case numerical_format.Unsigned_32_Bit:
                            // 读取uint变量
                            readResultRender(busTcpClient.ReadUInt32(id), id, ref result);
                            break;
                    }
                    mutex.ReleaseMutex();
                }
                catch { }
            }
            return result;//返回数据
        }
        /// <summary>
        /// 写寄存器--转换类型--并且写入
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="id"></param>
        /// <param name="content"></param>
        /// <param name="format"></param>
        /// <returns></returns>
        public string IPLC_interface_PLC_write_D_register(string Name, string id, string content, numerical_format format)//写寄存器--转换类型--并且写入
        {
            string result = "0";//定义获取数据变量           
            lock (this)
            {
                try
                {
                    mutex.WaitOne(3000);
                    switch (format)
                    {
                        case numerical_format.Signed_16_Bit:
                        case numerical_format.BCD_16_Bit:
                            writeResultRender(busTcpClient.Write(id, short.Parse(content)), id);
                            break;
                        case numerical_format.Signed_32_Bit:
                        case numerical_format.BCD_32_Bit:
                            writeResultRender(busTcpClient.Write(id, int.Parse(content)), id);
                            break;
                        case numerical_format.Binary_16_Bit:
                            writeResultRender(busTcpClient.Write(id, short.Parse(Convert.ToInt32(content, 2).ToString())), id);
                            break;
                        case numerical_format.Binary_32_Bit:
                            writeResultRender(busTcpClient.Write(id, int.Parse(Convert.ToInt32(content, 2).ToString())), id);
                            break;
                        case numerical_format.Float_32_Bit:
                            writeResultRender(busTcpClient.Write(id, float.Parse(content)), id);
                            break;
                        case numerical_format.Hex_16_Bit:
                            writeResultRender(busTcpClient.Write(id, short.Parse(Convert.ToInt32(content, 16).ToString())), id);
                            break;
                        case numerical_format.Hex_32_Bit:
                            writeResultRender(busTcpClient.Write(id, int.Parse(Convert.ToInt32(content, 16).ToString())), id);
                            break;
                        case numerical_format.Unsigned_16_Bit:
                            writeResultRender(busTcpClient.Write(id, int.Parse(content)), id);
                            break;
                        case numerical_format.Unsigned_32_Bit:
                            writeResultRender(busTcpClient.Write(id, uint.Parse(content)), id);
                            break;
                    }
                    mutex.ReleaseMutex();
                }
                catch{ }
            }
            return result;//返回数据
        }
        /// <summary>
        /// 批量读寄存器--转换类型-
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="id"></param>
        /// <param name="format"></param>
        /// <param name="Index"></param>
        /// <returns></returns>
        public List<int> IPLC_interface_PLC_read_D_register_bit(string Name, string id, numerical_format format, string Index)//批量读取寄存器
        {
            List<int> Data = new List<int>();
            lock (this)
            {
                try
                {
                    mutex.WaitOne(3000);
                    Data = Mitsubishi_to_Index_numerical(Name, id.ToInt32(), format, Index.ToInt32(), this);//批量读取寄存器并且返回数据
                    mutex.ReleaseMutex();
                }
                catch { }
            }
            return Data;//批量读取寄存器并且返回数据
        }
 
        /// <summary>
        /// 定义消息以弹出不在弹窗
        /// </summary>
        static bool Message_run = false;
        static int retry;
        #region 读写状态统一返回
        /// <summary>
        /// 统一的读取结果的数据解析，显示
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="result"></param>
        /// <param name="address"></param>
        /// <param name="textBox"></param>
        public static void readResultRender<T>(OperateResult<T> result, string address, ref string Data)
        {
            if (result.IsSuccess != true)//指示读取失败
            {
                retry += 1;//重试次数
                if (retry < 10) return;
                PLCerr_content = DateTime.Now.ToString("[HH:mm:ss] ") + $"[{address}] 读取失败{Environment.NewLine}原因：{result.ToMessageShowString()}";
                MessageBox.Show(DateTime.Now.ToString("[HH:mm:ss] ") + $"[{address}] 读取失败{Environment.NewLine}原因：{result.ToMessageShowString()}");
                PLC_ready = busTcpClient.ConnectServer().IsSuccess;//重新链接PLC
                retry = 0;
            }
            else
            {
                Data = result.Content.ToString();//读取到的数据
                retry = 0;
            }
            Thread.Sleep(5);
            PLC_busy = false;//允许访问
            
        }
        /// <summary>
        /// 统一的数据写入的结果显示
        /// </summary>
        /// <param name="result"></param>
        /// <param name="address"></param>
        public static void writeResultRender(OperateResult result, string address)
        {
            if (result.IsSuccess != true)//指示写入失败
            {
                PLC_ready = false;//读取异常
                PLCerr_content = DateTime.Now.ToString("[HH:mm:ss] ") + $"[{address}] 写入失败{Environment.NewLine}原因：{result.ToMessageShowString()}";
                if (Message_run != true)
                {
                    MessageBox.Show(DateTime.Now.ToString("[HH:mm:ss] ") + $"[{address}] 写入失败{Environment.NewLine}原因：{result.ToMessageShowString()}");
                    Message_run = true;
                }
            }
            Thread.Sleep(5);
            PLC_busy = false;//允许访问
        }
        #endregion
        /// <summary>
        /// Err处理
        /// </summary>
        /// <param name="e"></param>
        public static void err(Exception e)
        {
            PLC_ready = false;//PLC开放异常
            PLCerr_code = e.HResult;
            PLCerr_content = e.Message;
            Message_run = true;
            MessageBox.Show("链接PLC异常");
        }
    }
}
