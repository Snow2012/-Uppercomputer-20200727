# -Uppercomputer-20200727
                                                             关于
 由于上个版本 2021年6月27日推送的出现修改EF后 出现无法修改参数 现在紧急推送 请各位下载最新版本     
 现在已经推送大数据Web网页看板支持手机与电脑端预览 后端未实现 需要自己部署在IIS 修改SQL路径等操作 小白请止步！！ 具体部署方法后面我出出一期视频现在先全面实现Web网页后端数据交互与软件之间的关系
关于本软件其他软件访问上位机通讯基本完成代码在服务器端项目  近期添加了一个比较重要的版本运行开发人员对本软件进行界面设计 不再是固定界面后期会添加上不在软件运行时控件编辑开发人员可在IDE写好代码运行   添加发那科机器人内部协议可直接访问 机器人内部输入输出 寄存器等 后期会添加一些机器人专用控件    

                                                          本软件说明  
  本软件适用于工业自动化作为上位机对下位设备进行监控与控制使用简易通过拖拽控件修改参数实现对设备的监控 。  
  但是需要二次开发 因为不是每个上位机项目都合适 此框架好处就是不用理会软件通讯PLC等设备的协议与链接 只要开发者 对bool 操作的控件 实现了 Button_base接口 就可以读写固定PLC设备 文本类型 实现TextBox_base 接口 就可以读写固定PLC设备 每个控件的刷新状态都在 自定义Uppercomputer_20200727.控件重做.控件类基文件夹下 bool类型是：Button_base 文本类型是：TextBox_base 。   
  后续会持续添加控件实现多元化,更贴合，更方便，更快捷的设计理念目前支持简单常用的控件-支持三菱PLC--MC协议(3E帧)--西门子S7协议MODBUS TCP协议 欧姆龙Fins与CIP协议 发那科Robot协议--或者通过宏指令简易的编写代码实现串口--以太网特定协议的通讯。  
  关于对其他设备的数据库对接目前可以通过宏指令实现简易的去处理后续会做一个特定的控件去对接实现。  
  无需PLC直接控制三菱MR-JE-C型伺服(已测试完成) 需要提前配置伺服参数 设置IP 与回零方式等重要参数。
    
                                                         重磅推出新功能
本软件近期开发一套大数据看板Web网页用于展示现场设备的产量 报警等重要信息。  
本软件在底层添加了适配PLC等设备的专属控件可在二次开发时进行拖拽设计 本软件还固定支持运行时添加控件去访问PLC设备目前支持(三菱 西门子 欧姆龙 ModbusTCP 后期会添加串口协议与 基恩士,发那科机器人等协议)，当然目前支持底层模板有二套还在持续添加 后期利用功能键去切换指定的模板窗口，开发人员最好继承模板窗口进行开发这样支持运行时添加控件或者自己开发一套模板进行适配都可以。  
 
                                                          具体安装部署：    
第一次打开解决方案的小伙伴请注意了 应为下载和克隆出来的 Debug文件丢失所以请执行 清理解决方案 重新生成  第一次打开SQL路径不对 关闭再次打开就可以了。缺少的dll在第三方DLL查找重新引用  如果提示COM组件没有 那么请安装三菱MX Component软件 再次打开项目 否则强行打开会报错。    
1:本软件已经无需安装数据库使用SQLlite小型内置型。  
2:由于本软件允许用户与三菱GX Works3软件GX Works2软件进行模拟联动所以需要安装三菱MX Component软件--进行安装配置https://www.360kuai.com/pc/9abd50f94e327665c?cota=4&tj_url=xz&sign=360_57c3bbd1&refer_scene=so_1 只要把FX3U 换成GX Works3就好。   
3:如果出现DLL补全 请在文件目录第三方DLL处重新添加。   
 
                                                           控件组成    

![image](https://user-images.githubusercontent.com/60955669/119997409-4a109380-c002-11eb-91c2-3704899ab6dd.png)  
![image](https://user-images.githubusercontent.com/60955669/122012128-69276780-cdef-11eb-95d5-56fffdcc3070.png)

                                                     更改后EF实体模型到SLQLite数据库    
![image](https://user-images.githubusercontent.com/60955669/120075356-82cc6d80-c0d3-11eb-843c-818b62cb9fdf.png) 
1.实现逻辑先把表填充到List<dynamic> EFbase泛型集合（默认已经填充如有新表填充一下就行） 然后找到你想要的方法填写好Button_Parameter_inquire<T>（string ID） 泛型约束 代码会自动跟踪到你需要的表 根据ID主键进行SQL数据查询
  这样大量减少EF操作SQL的代码 当然实现这种逻辑归功于DLR动态编程。  
  
                                                      新增Socket TCP 访问上位机功能  
  
 1.默认端口号：9500 IP是本地物理网卡IP：获取失败会默认绑定：127.0.0.1地址。  
 2.可以访问上位机HMI的M区、D区。  
 3.可以访问三菱 西门子 modbus tcp 欧姆龙 等PLC bool区 D区域。   
 4.后期会出一个dll专门处理协议帧让用户无需理会报文直接套用方法（模板在服务器端项目 上位机通讯处理 Socket_Client类是实现通讯的 基本完成）。  
 ![image](https://user-images.githubusercontent.com/60955669/120663718-d9afb980-c4bc-11eb-8218-ffa19a9f650a.png)
 ![image](https://user-images.githubusercontent.com/60955669/120924346-f0951c80-c705-11eb-847b-aa893757c867.png)
 ![image](https://user-images.githubusercontent.com/60955669/120666045-da494f80-c4be-11eb-807d-99fc4f91706f.png)
下面是案例视频 使用的DLL案例是：服务器端项目 在本项目主目录有    
链接：https://pan.baidu.com/s/1HIXcXG9uaQuOA7L9UD-lFg    
提取码：wlei   
复制这段内容后打开百度网盘手机App，操作更方便哦   

                                                            版本更新    
 2020年7月开发该项目V1.0版本。    
 2021年1月添加控件自动引导线V1.1版本。    
 2021年5月使用SQLlite数据库V1.2版本。  
 2021年5月15日添加欧姆龙协议V1.3版本。  
 2021年5月29日精简SQL代码V1.4版本。  
 2021年6月3日添加其他软件访问上位机内部软元件与穿透上位机进行对其他设备访问 V1.5版本。  
 2021年6月15日添加允许开发人员对上位机 进行IDE编辑与设计其他界面  并且添加一些免开发的控件方便开发人员进行开发  V1.6版本。  
 2021年6月19日添加皮肤进行UI界面 模板开发适配 这样不用固定一个模板。      
 2021年6月23日添加报警监控界面 用户可以全面监控异常的数据和处理时间。  
 2021年6月26日优化报警监控界面 采用异步加载方式处理比较多的数据。  
 2021年6月27日修复EF偶然出现查询为NULL问题。     
 2021年7月24日新增Web大数据看板（支持手机查看）并且优化软件速度提升百分之50。   
 下一步计划：     
 1.新增掉电保持型HMI寄存器。         
 2.新增控件安全操作延时(怕误操作)后续新增管理员与操作工角权限。      
    
                                                             版本更新预览         
![71b6686bb6b78c475536666ea971bf7](https://user-images.githubusercontent.com/60955669/124881728-452c0000-e002-11eb-9548-44336fe3b7bb.jpg)
![d8564cd1a413dd5711634598cb8ac16](https://user-images.githubusercontent.com/60955669/124881731-46f5c380-e002-11eb-9493-f972e75bcdca.jpg)
 ![image](https://user-images.githubusercontent.com/60955669/124279732-6ca24900-db7a-11eb-9456-cc8aa2fbf158.png)   
![image](https://user-images.githubusercontent.com/60955669/122644630-c9e4d600-d148-11eb-9892-f3504c6e8db2.png)
![image](https://user-images.githubusercontent.com/60955669/122644638-d10be400-d148-11eb-8f65-a36b0539c2ff.png)
![image](https://user-images.githubusercontent.com/60955669/122644644-df5a0000-d148-11eb-9ee8-410203d1b832.png)
![image](https://user-images.githubusercontent.com/60955669/122644652-ea149500-d148-11eb-841f-a0f155b066e5.png)
![image](https://user-images.githubusercontent.com/60955669/122644661-f4369380-d148-11eb-89a9-a78fa82b6c54.png)
![image](https://user-images.githubusercontent.com/60955669/122644664-fa2c7480-d148-11eb-80f0-cf3baedb0e45.png) ![image](https://user-images.githubusercontent.com/60955669/122659540-ccc4e280-d1ab-11eb-80f7-58e27299fd0b.png)
![@N@AAWKXC0{}5`Y%WZN4A03](https://user-images.githubusercontent.com/60955669/123022820-f0389900-d408-11eb-9970-8d7f57fba15f.png)

 
BUG与反馈：  
开源自由就好BUG什么的肯定有哈哈。  

开发者：  
@DA

