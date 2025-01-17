﻿using EntityFramework.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace 自定义Uppercomputer_20200727.EF实体模型
{
    /// <summary>
    /// pull_down_menu下拉菜单对数据库进行增删改查
    /// </summary>
    class pull_down_menu_EF
    {
        public static string pull_down_menu_Parameter_inquire(string ID)//按钮类参数ID查询
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                pull_down_menu_Class pull_down_menu_Parameter = model.pull_down_menu_Class.Where(pi => pi.ID.Trim() == ID.Trim()).FirstOrDefault();//查询数据库是否有该ID
                if (pull_down_menu_Parameter != null)
                    return "OK";
                else
                    return "NG";
            }
        }
        public static List<pull_down_menuName> pull_down_menu_inquire(string ID)//下拉菜单项目数据查询
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
               return model.pull_down_menuName.Where(pi => pi.控件归属.Trim() == ID.Trim()).Select(pi=>pi).ToList();//查询数据库是否有该ID
            }
        }
        public string pull_down_menu_Parameter_Add(pull_down_menu_parameter parameter)//按钮类主参数参数插入
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                pull_down_menu_parameter pull_down_menu_Parameter = model.pull_down_menu_parameter.Where(pi => pi.ID == parameter.ID).FirstOrDefault();//查询数据库是否有该ID
                if (pull_down_menu_Parameter == null)
                {
                    pull_down_menu_parameter parameter1 = new pull_down_menu_parameter();//实例化对象
                    parameter1 = parameter;//传入获取到的对象
                    model.pull_down_menu_parameter.Add(parameter1);//构造添加表的SQL语句
                    model.SaveChanges();//执行操作
                }
            }
            return "操作成功";//返回
        }
        public string pull_down_menu_Parameter_Add(Tag_common_parameters parameter)//按钮类字体参数插入
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                Tag_common_parameters button_Parameter = model.Tag_common_parameters.Where(pi => pi.ID == parameter.ID).FirstOrDefault();//查询数据库是否有该ID
                if (button_Parameter == null)
                {
                    Tag_common_parameters parameter1 = new Tag_common_parameters();//实例化对象
                    parameter1 = parameter;//传入获取到的对象
                    model.Tag_common_parameters.Add(parameter1);//构造添加表的SQL语句
                    model.SaveChanges();//执行操作
                }
            }
            return "操作成功";//返回
        }
        public string pull_down_menu_Parameter_Add(General_parameters_of_picture parameter)//按钮类图片参数插入
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                General_parameters_of_picture button_Parameter = model.General_parameters_of_picture.Where(pi => pi.ID == parameter.ID).FirstOrDefault();//查询数据库是否有该ID
                if (button_Parameter == null)
                {
                    General_parameters_of_picture parameter1 = new General_parameters_of_picture();//实例化对象
                    parameter1 = parameter;//传入获取到的对象
                    model.General_parameters_of_picture.Add(parameter1);//构造添加表的SQL语句
                    model.SaveChanges();//执行操作
                }
            }
            return "操作成功";//返回
        }
        public string pull_down_menu_Parameter_Add(control_location parameter)//按钮类位置坐标参数插入
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                control_location button_Parameter = model.control_location.Where(pi => pi.ID == parameter.ID).FirstOrDefault();//查询数据库是否有该ID
                if (button_Parameter == null)
                {
                    control_location parameter1 = new control_location();//实例化对象
                    parameter1 = parameter;//传入获取到的对象
                    model.control_location.Add(parameter1);//构造添加表的SQL语句
                    model.SaveChanges();//执行操作
                }
            }
            return "操作成功";//返回
        }
        public string pull_down_menu_Parameter_Add(List<pull_down_menuName> parameter)//下拉菜单参数插入
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                for (int i = 0; i < parameter.Count; i++)
                {
                    string id = parameter[i].ID;
                    pull_down_menuName button_Parameter = model.pull_down_menuName.Where(pi => pi.ID == id).FirstOrDefault();//查询数据库是否有该ID
                    if (button_Parameter == null)
                    {
                        pull_down_menuName parameter1 = new pull_down_menuName();//实例化对象
                        parameter1 = parameter[i];//传入获取到的对象
                        model.pull_down_menuName.Add(parameter1);//构造添加表的SQL语句
                        model.SaveChanges();//执行操作
                    }
                }
            }
            return "操作成功";//返回
        }

        public pull_down_menu_Class pull_down_menu_Parameter_Query(string ID)//查询按钮类全部参数
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                pull_down_menu_Class pull_down_menu_Class = model.pull_down_menu_Class.Where(pi => pi.ID == ID).FirstOrDefault();//查询数据库是否有该ID
                return pull_down_menu_Class;//返回查询结果
            }
        }
        [Obsolete]
        public string pull_down_menu_Parameter_delete(string ID,string Name)//按钮类ID删除参数
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                //执行删除按钮类主参数操作
                pull_down_menu_parameter pull_down_menu_Parameter = model.pull_down_menu_parameter.Where(pi => pi.ID == ID).FirstOrDefault();//查询数据库是否有该ID   
                if (pull_down_menu_Parameter != null)
                {
                    model.pull_down_menu_parameter.Remove(pull_down_menu_Parameter);////构造添加表的SQL语句
                    model.SaveChanges();//执行操作
                }
                //执行删除按钮类字体参数操作
                Tag_common_parameters button_parameters = model.Tag_common_parameters.Where(pi => pi.ID == ID).FirstOrDefault();//查询数据库是否有该ID  
                if (button_parameters != null)
                {
                    model.Tag_common_parameters.Remove(button_parameters);////构造添加表的SQL语句
                    model.SaveChanges();//执行操作
                }
                //执行删除下拉菜单参数数据
                pull_down_menuName pull_down_menuName = model.pull_down_menuName.Where(pi => pi.控件归属.Trim() == ID.Trim()).FirstOrDefault();//查询数据库是否有该ID
                if (pull_down_menuName != null)
                {
                    //切换数据库标志位
                    int iex = 1;
                    if (iex == 0)
                    {
                        model.pull_down_menuName.Delete(pi => pi.控件归属.Trim() == Name.Trim());//移除位置信息
                    }
                    else
                    {
                        model.pull_down_menuName.Where(pi => pi.控件归属.Trim() == Name.Trim()).Select(pi => pi).ToList().ForEach(s => 
                        {
                            model.pull_down_menuName.Remove(s);
                        });
                    }
                    model.SaveChanges();//执行操作
                }
                //执行删除按钮类坐标参数操作
                control_location button_control_location = model.control_location.Where(pi => pi.ID == ID).FirstOrDefault();//查询数据库是否有该ID   
                if (button_control_location != null)
                {
                    model.control_location.Remove(button_control_location);////构造添加表的SQL语句              
                    model.SaveChanges();//执行操作
                }
                //执行删除上下层参数操作
                Control_layer Control_layer = model.Control_layer.Where(pi => pi.ID == ID).FirstOrDefault();//查询数据库是否有该ID   
                if (Control_layer != null)
                {
                    model.Control_layer.Remove(Control_layer);////构造添加表的SQL语句              
                    model.SaveChanges();//执行操作
                }
                if (pull_down_menu_Parameter != null)
                    return "OK";
                else
                    return "NG";
            }
        }
        [Obsolete]
        public string pull_down_menu_Parameter_modification(string ID, pull_down_menu_parameter _Parameter, Tag_common_parameters tag_Common_,
            General_parameters_of_picture _Of_Picture, control_location _Location,List<pull_down_menuName> pull_s,int Inedx)//按钮类ID修改参数
        {

            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                //执行修改按钮类主参数操作
                pull_down_menu_parameter Button_parameter = model.pull_down_menu_parameter.Where(pi => pi.ID == ID).FirstOrDefault();//查询数据库是否有该ID
                if (Button_parameter != null)
                {
                    #region 要修改的属性
                    Button_parameter.位切换开关 = _Parameter.位切换开关;//获取对象
                    Button_parameter.位指示灯 = _Parameter.位指示灯;//获取对象
                    Button_parameter.写设备_地址_具体地址_复选 = _Parameter.写设备_地址_具体地址_复选;//获取对象
                    Button_parameter.写设备_地址_复选 = _Parameter.写设备_地址_复选;//获取对象
                    Button_parameter.写设备_复选 = _Parameter.写设备_复选;//获取对象
                    Button_parameter.操作安全时间 = _Parameter.操作安全时间;//获取对象
                    Button_parameter.操作模式 = _Parameter.操作模式;//获取对象
                    Button_parameter.读写不同地址_ON_OFF = _Parameter.读写不同地址_ON_OFF;//获取对象
                    Button_parameter.读写设备 = _Parameter.读写设备;//获取对象
                    Button_parameter.读写设备_地址 = _Parameter.读写设备_地址;//获取对象
                    Button_parameter.读写设备_地址_具体地址 = _Parameter.读写设备_地址_具体地址;//获取对象
                    Button_parameter.下拉背景 = _Parameter.下拉背景;//获取对象
                    Button_parameter.选择背景 = _Parameter.选择背景;//获取对象
                    Button_parameter.项目数量 = _Parameter.项目数量;//获取对象
                    Button_parameter.项目资料来源 = _Parameter.项目资料来源;//获取对象
                    #endregion
                    model.SaveChanges();//执行操作
                }
                //执行修改按钮类字体参数操作
                Tag_common_parameters button_parameters = model.Tag_common_parameters.Where(pi => pi.ID == ID).FirstOrDefault();//查询数据库是否有该ID
                if (button_parameters != null)
                {
                    #region 要修改的属性
                    button_parameters.Control_state_0 = tag_Common_.Control_state_0;//获取对象
                    button_parameters.Control_state_0_aligning = tag_Common_.Control_state_0_aligning;//获取对象
                    button_parameters.Control_state_0_colour = tag_Common_.Control_state_0_colour;//获取对象
                    button_parameters.Control_state_0_content = tag_Common_.Control_state_0_content;//获取对象
                    button_parameters.Control_state_0_flicker = tag_Common_.Control_state_0_flicker;//获取对象
                    button_parameters.Control_state_0_size = tag_Common_.Control_state_0_size;//获取对象
                    button_parameters.Control_state_0_typeface = tag_Common_.Control_state_0_typeface;//获取对象
                    button_parameters.Control_state_1 = tag_Common_.Control_state_1;//获取对象
                    button_parameters.Control_state_1_aligning = tag_Common_.Control_state_1_aligning;//获取对象
                    button_parameters.Control_state_1_colour = tag_Common_.Control_state_1_colour;//获取对象
                    button_parameters.Control_state_1_content1 = tag_Common_.Control_state_1_content1;//获取对象
                    button_parameters.Control_state_1_flicker = tag_Common_.Control_state_1_flicker;//获取对象
                    button_parameters.Control_state_1_size = tag_Common_.Control_state_1_size;//获取对象
                    button_parameters.Control_state_1_typeface = tag_Common_.Control_state_1_typeface;//获取对象
                    button_parameters.Control_type = tag_Common_.Control_type;//获取对象
                    #endregion
                    model.SaveChanges();//执行操作
                }
                //执行修改按钮类图片参数操作
                General_parameters_of_picture button_parameters_of_picture = model.General_parameters_of_picture.Where(pi => pi.ID == ID).FirstOrDefault();//查询数据库是否有该ID
                if (button_parameters_of_picture != null)
                {
                    #region 要修改的属性
                    button_parameters_of_picture.Control_state_0 = _Of_Picture.Control_state_0;//获取对象
                    button_parameters_of_picture.Control_state_0_list = _Of_Picture.Control_state_0_list;//获取对象
                    button_parameters_of_picture.Control_state_0_picture = _Of_Picture.Control_state_0_picture;//获取对象
                    button_parameters_of_picture.Control_state_1 = _Of_Picture.Control_state_1;//获取对象
                    button_parameters_of_picture.Control_state_1_list = _Of_Picture.Control_state_1_list;//获取对象
                    button_parameters_of_picture.Control_state_1_picture = _Of_Picture.Control_state_1_picture;//获取对象
                    button_parameters_of_picture.Control_type = _Of_Picture.Control_type;//获取对象
                    #endregion
                    model.SaveChanges();//执行操作
                }
                //执行修改按钮类坐标参数操作
                control_location button_control_location = model.control_location.Where(pi => pi.ID == ID).FirstOrDefault();//查询数据库是否有该ID
                if (button_control_location != null)
                {
                    #region 要修改的属性
                    button_control_location.location = _Location.location;//获取对象
                    button_control_location.size = _Location.size;//获取对象
                    #endregion
                    model.SaveChanges();//执行操作
                }
                //执行修改项目数据
                //执行删除下拉菜单参数数据
                string id = pull_s[0].控件归属;
                pull_down_menuName pull_down_menuName = model.pull_down_menuName.Where(pi => pi.控件归属 == id).FirstOrDefault();//查询数据库是否有该ID
                if (pull_down_menuName != null)
                {
                    //model.pull_down_menuName.Delete(pi => pi.控件归属.Trim() == id);//移除位置信息
                    model.pull_down_menuName.Where(PI => PI.控件归属.Trim() == ID).Select(PI=>PI).ToList().ForEach(S1=>{
                        model.pull_down_menuName.Remove(S1);                    
                    });
                    model.SaveChanges();//执行操作
                }
                pull_down_menu_Parameter_Add(pull_s);//重写添加插入数据
                if (Button_parameter != null)
                    return "OK";
                else
                    return "NG";
            }
        }
        public string Button_Parameter_modification(string ID, control_location _Location)//按钮类ID修改参数--坐标参数
        {
            using (UppercomputerEntities2 model = new UppercomputerEntities2())
            {
                //执行修改按钮类坐标参数操作
                control_location button_control_location = model.control_location.Where(pi => pi.ID.Trim() == ID.Trim()).FirstOrDefault();//查询数据库是否有该ID 
                if (button_control_location != null)
                {
                    #region 要修改的属性
                    button_control_location.location = _Location.location;//获取对象
                    button_control_location.size = _Location.size;//获取对象
                    #endregion
                    model.SaveChanges();//执行操作
                }
                if (button_control_location != null)
                    return "OK";
                else
                    return "NG";
            }
        }
    }
}
