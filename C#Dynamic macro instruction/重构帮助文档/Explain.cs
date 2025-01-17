﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CCWin;
using CSEngineTest.重构帮助文档.说明控件;

namespace CSEngineTest.重构帮助文档
{
    public partial class Explain : Skin_Mac
    {
        public static Size SIZE_i{ get; set; }
        public Explain()
        {
            InitializeComponent();
        }
        
        private void uiTreeView1_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            switch (e.Node.Text)
            {
                case "宏指令":
                    TreeViewAdd(new UserControl1());
                    return;
                case "宏指令编译器":
                    TreeViewAdd(new UserControl2());
                    return;
                case "宏指令语法":
                    TreeViewAdd(new UserControl3());
                    return;
                case "宏函数":
                    TreeViewAdd(new UserControl4());
                    return;
                case "宏内置元件":
                    TreeViewAdd(new UserControl5());
                    return;
                case "Socket通讯源码":
                    TreeViewAdd(new UserControl6());
                    return;
                case "串口通讯源码":
                    TreeViewAdd(new UserControl7());
                    return;
                case "数据转换源码":
                    TreeViewAdd(new UserControl8());
                    return;

            } 
        }
        public bool Hiel;
        private void Explain_Load(object sender, EventArgs e)
        {
            this.panel1.Controls.Add(new UserControl1());
            Hiel = true;
        }
        private void TreeViewAdd(Control  control)
        {
            this.panel1.Controls.Clear();
            this.panel1.Controls.Add(control);
        }

        private void panel1_Resize(object sender, EventArgs e)
        {
            SIZE_i = this.Size;
        }

        private void Explain_FormClosing(object sender, FormClosingEventArgs e)
        {
            Hiel = false;
        }
    }
}
