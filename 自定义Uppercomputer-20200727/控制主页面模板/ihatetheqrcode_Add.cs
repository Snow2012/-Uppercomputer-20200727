﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using 自定义Uppercomputer_20200727.控件重做;

namespace 自定义Uppercomputer_20200727.控制主页面模板
{
    /// <summary>
    /// 添加二维码/条形码
    /// </summary>
    class ihatetheqrcode_Add
    {
        string ihatetheqrcode_serial = "ihatetheqrcode";//默认名称
        public ihatetheqrcode_reform Add(System.Windows.Forms.Control.ControlCollection control, Point point)//添加按钮方法
        {
            _ = control.Owner.Name;//获取创建的窗口名称
            this.ihatetheqrcode_serial = Button_Name(control);//获得名称
            ihatetheqrcode_reform reform = new ihatetheqrcode_reform();//实例化按钮
            reform.Size = new Size(195, 140);//设置大小
            reform.Location = point;//设置按钮位置
            reform.Name = ihatetheqrcode_serial;//设置名称
            reform.Text = ihatetheqrcode_serial;//设置文本
            reform.BringToFront();//将控件放置所有控件最顶层        
            return reform;//返回数据
        }
        public string Button_Name(System.Windows.Forms.Control.ControlCollection control)//判断名称是否存在该窗口
        {
            List<System.Windows.Forms.Control> Data = (from Control pi in control where pi is ihatetheqrcode_reform select pi).ToList();//获得名称            
            int dex = 0;//获得序列
        inedx:
            dex += 1;
            string Name = ihatetheqrcode_serial + (Data.Count + dex);//先定义名称
            foreach (ihatetheqrcode_reform i in Data)//遍历窗口是否有该名称存在
            {
                if (i.Name == Name) goto inedx;
            }
            return Name;//返回名称
        }
    }
}
