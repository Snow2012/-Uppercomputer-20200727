# -Uppercomputer-20200727
                                                             关于
关于本软件近期优先把EF实体模型这块又老又长的代码去除 使用C#4.0动态编程技术去优化EF代码 尽量融合成一个类  添加PLC掉线重连机制 后期会添加欧姆龙PLC协议与 并且有计划的 添加发那科机器人内部协议可直接访问 机器人内部输入输出 寄存器等 后期会添加一些机器人专用控件    

                                                          本软件说明  
  本软件适用于工业自动化作为上位机对下位设备进行监控与控制使用简易通过拖拽控件修改参数实现对设备的监控。   
  后续会持续添加控件实现多元化,更贴合，更方便，更快捷的设计理念目前支持简单常用的控件-支持三菱PLC--MC协议(3E帧)--西门子S7协议MODBUS TCP协议 欧姆龙Fins与CIP协议 发那科Robot协议--或者通过宏指令简易的编写代码实现串口--以太网特定协议的通讯。  
  关于对其他设备的数据库对接目前可以通过宏指令实现简易的去处理后续会做一个特定的控件去对接实现。  
    
                                                                                  BY-沓  
                                                           重磅推出新功能
无需PLC直接控制三菱MR-JE-C型伺服(已测试完成) 需要提前配置伺服参数 设置IP 与回零方式等重要参数。
 
                                                           具体安装部署：    
1:本软件已经无需安装数据库使用SQLlite小型内置型。   
2:由于本软件允许用户与三菱GX Works3软件GX Works2软件进行模拟联动所以需要安装三菱MX Component软件--进行安装配置https://www.360kuai.com/pc/9abd50f94e327665c?cota=4&tj_url=xz&sign=360_57c3bbd1&refer_scene=so_1 只要把FX3U 换成GX Works3就好。   
3:卸载完成后需要手动去把数据库分离。   
4:用户提供正确的数据库实例名  用户名 密码 软件安装过程中会自动附加数据库。  
5:如果出现DLL补全 请在文件目录第三方DLL处重新添加。   
演示视频地址：  https://pan.baidu.com/s/1Ls92y1wU9d41BLVMU4eYNg 提取码：m2qc
 
                                                           控件组成    

![image](https://user-images.githubusercontent.com/60955669/119997409-4a109380-c002-11eb-91c2-3704899ab6dd.png)  

                                                       更改后EF实体模型到SLQLite数据库    
![image](https://user-images.githubusercontent.com/60955669/120075356-82cc6d80-c0d3-11eb-843c-818b62cb9fdf.png) 
1.实现逻辑先把表填充到List<dynamic> EFbase泛型集合 然后找到你想要的方法填写好Button_Parameter_inquire<T>（string ID） 泛型约束 代码会自动跟踪到你需要的表 根据ID主键进行SQL数据查询
  这样大量减少EF操作SQL的代码 当然实现这种逻辑归功于DLR动态编程。

BUG与反馈：  
开源自由就好BUG什么的肯定有哈哈。  

开发者：  
@DA

