﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CCWin;
using CCWin.SkinClass;
using CCWin.SkinControl;
using 自定义Uppercomputer_20200727.EF实体模型;
using 自定义Uppercomputer_20200727.控件重做;
using 自定义Uppercomputer_20200727.Nlog;
using 自定义Uppercomputer_20200727.EF实体模型.EFtoSQL操作类重写;

namespace 自定义Uppercomputer_20200727.修改参数界面.LedDisplay数值显示参数
{
    public partial class Modification_LedDisplay : Skin_VS
    {
        private string Button_ID;//控件的基本信息
        private object all_purpose;//通用类型
        public bool Add_to_allow = false;//反馈标志位是否允许添加
        LedDisplay_Class button;//按钮类全部参数
        private string From_Name;//控件处在的窗口名称
        public Modification_LedDisplay(string ID, object all_purpose)
        {
            InitializeComponent();
            this.Button_ID = ID;//获取参数
            this.all_purpose = all_purpose;
            this.skinTextBox8.Text = Button_ID.Trim() + "- " + ((LedDisplay_reform)all_purpose).Name;//保存ID 为一地址  -是分割字符 
            From_Name = parameter_indexes.Button_from_name(skinTextBox8.Text);//获取窗口名称
        }

        private void skinButton3_Click(object sender, EventArgs e)
        {
            this.Close();
            this.Dispose();
        }
        #region 窗体关闭效果
        /// <param name="hwnd">指定产生动画的窗口的句柄</param>
        /// <param name="dwTime">指定动画持续的时间</param>
        /// <param name="dwFlags">指定动画类型，可以是一个或多个标志的组合。</param>
        [DllImport("user32")]
        private static extern bool AnimateWindow(IntPtr hwnd, int dwTime, int dwFlags);
        private const int AW_HOR_POSITIVE = 0x0001;//自左向右显示窗口，该标志可以在滚动动画和滑动动画中使用。使用AW_CENTER标志时忽略该标志
        private const int AW_HOR_NEGATIVE = 0x0002;//自右向左显示窗口，该标志可以在滚动动画和滑动动画中使用。使用AW_CENTER标志时忽略该标志
        private const int AW_VER_POSITIVE = 0x0004;//自顶向下显示窗口，该标志可以在滚动动画和滑动动画中使用。使用AW_CENTER标志时忽略该标志
        private const int AW_VER_NEGATIVE = 0x0008;//自下向上显示窗口，该标志可以在滚动动画和滑动动画中使用。使用AW_CENTER标志时忽略该标志该标志
        private const int AW_CENTER = 0x0010;//若使用了AW_HIDE标志，则使窗口向内重叠；否则向外扩展
        private const int AW_HIDE = 0x10000;//隐藏窗口
        private const int AW_ACTIVE = 0x20000;//激活窗口，在使用了AW_HIDE标志后不要使用这个标志
        private const int AW_SLIDE = 0x40000;//使用滑动类型动画效果，默认为滚动动画类型，当使用AW_CENTER标志时，这个标志就被忽略
        private const int AW_BLEND = 0x80000;//使用淡入淡出效果
        #endregion
        private void Modification_LedDisplay_Load(object sender, EventArgs e)
        {
            AnimateWindow(this.Handle, 500, AW_SLIDE | AW_ACTIVE | AW_VER_NEGATIVE);
            Modification_numerical_Class numerical_Class = new Modification_numerical_Class(new List<SkinTabPage>()
            {this.skinTabPage1, this.skinTabPage2, this.skinTabPage3, this.skinTabPage4,this.skinTabPage5,this.skinTabPage6}, ((LedDisplay_reform)all_purpose).Name);
        }

        private void Modification_LedDisplay_Shown(object sender, EventArgs e)
        {
            //设置默认背景颜色
            this.colorComboBox2.Items.RemoveAt(0);//移除透明背景颜色
            this.colorComboBox2.SelectedIndex = 0;
            this.colorComboBox2.SelectedItem = 0;
            //查询数据库是否有该数据
            if (Button_EFbase.Button_Parameter_inquire<LedDisplay_Class>(this.skinTextBox8.Text) == "OK")
            {
                Button_EFbase button_EF = new Button_EFbase();//实例化EF对象
                button = button_EF.Button_Parameter_Query<LedDisplay_Class>(this.skinTextBox8.Text);//获取按钮类全部参数
                List_Index();//开始改变索引
            }
            else
            {
                //新增控件获取位置与大小
                this.textBox2.Text = ((LedDisplay_reform)this.all_purpose).Location.X.ToString();//控件位置X轴
                this.textBox1.Text = ((LedDisplay_reform)this.all_purpose).Location.Y.ToString();//控件位置Y轴
                this.skinTextBox4.Text = ((LedDisplay_reform)this.all_purpose).Size.Width.ToString();//控件大小宽度
                this.skinTextBox3.Text = ((LedDisplay_reform)this.all_purpose).Size.Height.ToString();//控件大小宽度
            }
        }
        private void List_Index()
        {
            parameter_indexes indexes = new parameter_indexes();//实例化索引器
            //改变一般参数索引
            indexes.Button_ComboBoxIndex_fill(button.读写设备, ref this.skinComboBox13);
            indexes.Button_ComboBoxIndex_fill(button.读写设备_地址, ref this.skinComboBox12);
            skinTextBox7.Text = button.读写设备_地址_具体地址.Trim();
            skinCheckBox1.Checked = button.读写不同地址_ON_OFF > 0 ? true : false;
            if (skinCheckBox1.Checked) skinGroupBox6.Visible = true;
            indexes.Button_ComboBoxIndex_fill(button.写设备_复选, ref this.skinComboBox11);
            indexes.Button_ComboBoxIndex_fill(button.写设备_地址_复选, ref this.skinComboBox10);
            skinTextBox6.Text = button.写设备_地址_具体地址_复选;
            //按钮安全控制时间
            indexes.Button_ComboBoxIndex_fill(button.操作安全时间, ref this.skinComboBox1);
            //按钮标签0-参数索引
            indexes.Button_ComboBoxIndex_fill(button.Control_state_0_typeface, ref this.skinComboBox3);
            indexes.Button_ComboBoxIndex_fill(button.Control_state_0_colour, ref this.colorComboBox1);
            indexes.Button_ComboBoxIndex_fill(button.Control_state_0_size, ref this.skinComboBox5);
            indexes.Button_ComboBoxIndex_fill(button.Control_state_0_aligning, ref this.skinComboBox6);
            indexes.Button_ComboBoxIndex_fill(button.Control_state_0_flicker.ToString(), ref this.skinComboBox7);
            this.skinChatRichTextBox1.Text = button.Control_state_0_content.Trim();
            //数据格式索引
            indexes.Button_ComboBoxIndex_fill(button.资料格式, ref this.skinComboBox8);
            indexes.Button_ComboBoxIndex_fill(button.数据类型, ref this.skinComboBox14);
            this.skinTextBox1.Text = button.小数点以上位数;
            this.skinTextBox2.Text = button.小数点以下位数;
            //获取控件位置-大小-等信息
            this.textBox2.Text = point_or_Size(button.location)[0].ToString();//控件位置X轴
            this.textBox1.Text = point_or_Size(button.location)[1].ToString();//控件位置Y轴
            this.skinTextBox4.Text = point_or_Size(button.size)[0].ToString();//控件大小宽度
            this.skinTextBox3.Text = point_or_Size(button.size)[1].ToString();//控件大小宽度
            //获取颜色设置
            indexes.Button_ComboBoxIndex_fill(button.colour_0.Trim(), ref this.colorComboBox2);

        }
        private void Modification_LedDisplay_FormClosing(object sender, FormClosingEventArgs e)
        {
            AnimateWindow(this.Handle, 1000, AW_SLIDE | AW_ACTIVE | AW_VER_NEGATIVE);
        }

        private void skinButton2_Click(object sender, EventArgs e)
        {
            //检查输入数据是否正确
            Regex reg = new Regex(@"^[A-Fa-z0-9]+(.[0-9]+)?$");
            if (reg.IsMatch(this.skinTextBox6.Text.Trim()) != true || reg.IsMatch(this.skinTextBox7.Text.Trim()) != true)
            {
                MessageBox.Show("PLC地址输入错误，输入了一个不可能访问到的地址");
                return;
            }
            //先查询数据库有无此ID--有进行修改--无新增--
            Button_EFbase LedDisplay_EF = new Button_EFbase();//实例化EF对象
            if (Button_EFbase.Button_Parameter_inquire<LedDisplay_Class>(this.skinTextBox8.Text) == "OK")
            {
                //LogUtils日志
                LogUtils.debugWrite($"用户向{((Control)all_purpose).Name} 控件修改参数");
                LedDisplay_EF.Button_Parameter_modification(this.skinTextBox8.Text, numerical_Parameter(), tag_Common_Parameters(), general_Parameters_Of_Picture(), control_Location(), Button_colour_Location());//修改数据库参数
            }
            else
            {
                //LogUtils日志
                LogUtils.debugWrite($"用户向{((Control)all_purpose).Name} 控件插入参数");
                LedDisplay_EF.Button_Parameter_Add(tag_Common_Parameters());//插入标签参数
                LedDisplay_EF.Button_Parameter_Add(numerical_Parameter());//插入一般参数
                LedDisplay_EF.Button_Parameter_Add(general_Parameters_Of_Picture());//插入图片参数
                LedDisplay_EF.Button_Parameter_Add(control_Location());//插入控件坐标参数
                LedDisplay_EF.Button_Parameter_Add(Button_colour_Location());//插入控件背景颜色
            }
            Public_attributeCalss public_AttributeCalss = new Public_attributeCalss();//实例化按钮参数设置
            public_AttributeCalss.LedDisplay((LedDisplay_reform)this.all_purpose, LedDisplay_EF.Button_Parameter_Query<LedDisplay_Class>(this.skinTextBox8.Text));//查询数据库--进行设置后的参数修改
            Add_to_allow = true;
            this.Close();
            this.Dispose();
        }
        private LedDisplay_parameter numerical_Parameter()//获取要写入的一般参数
        {
            return new LedDisplay_parameter
            {
                ID = this.skinTextBox8.Text,
                FORM = From_Name,
                读写设备 = this.skinComboBox13.Text,
                读写设备_地址 = this.skinComboBox12.Text,
                读写设备_地址_具体地址 = this.skinTextBox7.Text.Trim() ?? "0",
                读写不同地址_ON_OFF = 0,
                写设备_复选 = this.skinComboBox11.Text,
                写设备_地址_复选 = this.skinComboBox11.Text,
                写设备_地址_具体地址_复选 = this.skinTextBox6.Text.Trim() ?? "0",
                操作安全时间 = this.skinComboBox1.Text,
                小数点以上位数 = this.skinTextBox1.Text,
                小数点以下位数 = this.skinTextBox2.Text,
                数据类型 = skinComboBox14.Text,
                资料格式 = skinComboBox8.Text

            };
        }
        private Tag_common_parameters tag_Common_Parameters()//获取要写入的标签参数
        {
            return new Tag_common_parameters
            {
                //写入0状态
                Control_state_0 = 0,
                Control_state_0_typeface = this.skinComboBox3.Text,
                Control_state_0_colour = this.colorComboBox1.Text,
                Control_state_0_size = this.skinComboBox5.Text,
                Control_state_0_aligning = this.skinComboBox6.Text,
                Control_state_0_flicker = this.skinComboBox7.Text.ToInt32(),
                Control_state_0_content = skinChatRichTextBox1.Text ?? ((LedDisplay_reform)this.all_purpose).Name,
                //写入1状态
                Control_state_1 = 1,
                Control_state_1_typeface = this.skinComboBox3.Text,
                Control_state_1_colour = this.colorComboBox1.Text,
                Control_state_1_size = this.skinComboBox5.Text,
                Control_state_1_aligning = this.skinComboBox6.Text,
                Control_state_1_flicker = this.skinComboBox7.Text.ToInt32(),
                Control_state_1_content1 = this.skinChatRichTextBox1.Text,
                Control_type = ((LedDisplay_reform)this.all_purpose).Name,
                FROM = From_Name,
                ID = skinTextBox8.Text
            };

        }
        private General_parameters_of_picture general_Parameters_Of_Picture()//获取要写入的图片参数---目前未实现
        {
            return new General_parameters_of_picture
            {
                Control_state_0 = 0,
                Control_state_0_list = 0,
                Control_state_0_picture = 0,
                Control_state_1 = 1,
                Control_state_1_list = 0,
                Control_state_1_picture = 0,
                Control_type = ((LedDisplay_reform)this.all_purpose).Name,
                FORM = From_Name,
                ID = skinTextBox8.Text
            };
        }
        private control_location control_Location()//获取要写入的控件位置
        {
            return new control_location
            {
                ID = skinTextBox8.Text,
                FORM = From_Name,
                location = this.textBox2.Text.Trim() + "-" + this.textBox1.Text.Trim(),
                size = this.skinTextBox4.Text.Trim() + "-" + this.skinTextBox3.Text.Trim()
            };
        }
        private Button_colour Button_colour_Location()//获取要写入的控件样式
        {
            return new Button_colour
            {
                FORM = From_Name,
                ID = skinTextBox8.Text,
                colour_0 = this.colorComboBox2.Text,
                colour_1 = this.colorComboBox2.Text
            };

        }
        private int[] point_or_Size(string Name)//分割-来自数据库的-位置与大小数据
        {
            string[] segmentation;//定义分割数组
            segmentation = Name.Split('-');
            return new int[] { Convert.ToInt32(segmentation[0] ?? "81"), Convert.ToInt32(segmentation[1] ?? "31") };
        }
        private void KeyPress_reform(object sender, KeyPressEventArgs e)//键盘事件--位置与大小数据
        {
            if (e.KeyChar != '\b')//这是允许输入退格键  
            {
                if ((e.KeyChar < '0') || (e.KeyChar > '9') || ((TextBox)sender).Text.Length > 3)//这是允许输入0-9数字 最大数据不能大于3位数  
                {
                    e.Handled = true;//只能输入数字
                }
            }
        }
    }
}
