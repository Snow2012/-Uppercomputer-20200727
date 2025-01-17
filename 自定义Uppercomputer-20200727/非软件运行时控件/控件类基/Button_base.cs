﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using PLC通讯规范接口;
using 自定义Uppercomputer_20200727.非软件运行时控件.按钮操作模式;

namespace 自定义Uppercomputer_20200727.非软件运行时控件.控件类基
{
    //==============================================================
    //  作者：BAtoDA
    //  时间：2021/2/15 12:55:35 
    //  文件名：Button_Interface
    //  版本：V1.0.1  
    //  说明： 上位机按钮类底层控件公共属性--必须继承实现该接口
    //  修改者：***
    //  修改说明： 
    //==============================================================
    /// <summary>
    /// 按钮类 通讯类基 必须实现该接口
    /// </summary>
    interface Button_base
    {
        /// <summary>
        /// 修改参数界面启动事件
        /// </summary>
        event EventHandler Modification;
        /// <summary>
        /// 选择PLC类型枚举
        /// </summary>
        PLC Plc { get; set; }
        /// <summary>
        /// 指示是否启用PLC功能
        /// </summary>
        bool PLC_Enable { get; set; }
        /// <summary>
        /// 修改参数界面方法
        /// </summary>
        /// <param name="send"></param>
        /// <param name="e"></param>
        void Modifications_Eeve(object send, EventArgs e);
        /// <summary>
        /// PLC触点功能
        /// </summary>
        string PLC_Contact { get; set; }
        /// <summary>
        /// PLC访问具体地址
        /// </summary>
        string PLC_Address { get; set; }
        /// <summary>
        /// 触点为ON背景颜色
        /// </summary>
        Color Backdrop_ON { get; set; }
        /// <summary>
        /// 触点为OFF背景颜色
        /// </summary>
        Color Backdrop_OFF { get; set; }
        /// <summary>
        /// 控件文本为ON时显示的值
        /// </summary>
        string Text_ON { get; set; }
        /// <summary>
        /// 控件文本为OFF时显示的值
        /// </summary>
        string Text_OFF { get; set; }
        /// <summary>
        /// 按钮开关控制
        /// </summary>
        bool Command { get; set; }
        /// <summary>
        /// 指示该按钮类型-是位 还是 指示灯
        /// TRUE 位 FALSE 指示灯
        /// </summary>
        bool Button_select { get; set; }
        /// <summary>
        /// 按钮操作模式
        /// </summary>
         DAButton_pattern Pattern { get; set; }
        /// <summary>
        /// 控件刷新定时器
        /// </summary>
        System.Windows.Forms.Timer PLC_time { get; }
    }
}
