USE [master]
GO
/****** Object:  Database [Uppercomputer]    Script Date: 2021/1/16 13:36:22 ******/
CREATE DATABASE [Uppercomputer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Uppercomputer', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\Uppercomputer.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Uppercomputer_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\Uppercomputer_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Uppercomputer] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Uppercomputer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Uppercomputer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Uppercomputer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Uppercomputer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Uppercomputer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Uppercomputer] SET ARITHABORT OFF 
GO
ALTER DATABASE [Uppercomputer] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Uppercomputer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Uppercomputer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Uppercomputer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Uppercomputer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Uppercomputer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Uppercomputer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Uppercomputer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Uppercomputer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Uppercomputer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Uppercomputer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Uppercomputer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Uppercomputer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Uppercomputer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Uppercomputer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Uppercomputer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Uppercomputer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Uppercomputer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Uppercomputer] SET  MULTI_USER 
GO
ALTER DATABASE [Uppercomputer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Uppercomputer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Uppercomputer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Uppercomputer] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Uppercomputer] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Uppercomputer]
GO
/****** Object:  User [SIMATIC HMI VIEWER User]    Script Date: 2021/1/16 13:36:22 ******/
CREATE USER [SIMATIC HMI VIEWER User] FOR LOGIN [DESKTOP-E3JO5HA\SIMATIC HMI VIEWER]
GO
/****** Object:  User [SIMATIC HMI User]    Script Date: 2021/1/16 13:36:22 ******/
CREATE USER [SIMATIC HMI User] FOR LOGIN [DESKTOP-E3JO5HA\SIMATIC HMI]
GO
/****** Object:  DatabaseRole [SIMATIC HMI VIEWER role]    Script Date: 2021/1/16 13:36:22 ******/
CREATE ROLE [SIMATIC HMI VIEWER role]
GO
/****** Object:  DatabaseRole [SIMATIC HMI role]    Script Date: 2021/1/16 13:36:22 ******/
CREATE ROLE [SIMATIC HMI role]
GO
ALTER ROLE [SIMATIC HMI VIEWER role] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [SIMATIC HMI role] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER role]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI role]
GO
/****** Object:  Table [dbo].[AnalogMeter_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalogMeter_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
	[Min] [int] NOT NULL,
	[Max] [int] NOT NULL,
	[刷新时间] [int] NOT NULL,
 CONSTRAINT [PK_AnalogMeter_parameter_2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Button_colour]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button_colour](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[colour_0] [nchar](100) NOT NULL,
	[colour_1] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Button_colour_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Button_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[位指示灯] [nchar](10) NOT NULL,
	[位切换开关] [nchar](10) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[操作模式] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NULL,
 CONSTRAINT [PK_Button_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Control_layer]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_layer](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[type] [nchar](100) NOT NULL,
	[Upper_layer] [int] NOT NULL,
 CONSTRAINT [PK_Control_layer_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[control-location]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[control-location](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[location] [nchar](50) NOT NULL,
	[size] [nchar](50) NOT NULL,
 CONSTRAINT [PK_control-location_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conveyor_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conveyor_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
	[运输带颜色] [nchar](100) NOT NULL,
	[运输带方向] [nchar](100) NOT NULL,
	[运输带高度] [int] NOT NULL,
	[运输带速度] [int] NOT NULL,
	[运输带角度] [int] NOT NULL,
	[设备控制方向] [int] NOT NULL,
	[设备读取数据控制] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[doughnut_Chart_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doughnut_Chart_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
	[通道数量] [int] NOT NULL,
	[Name_Text] [nchar](500) NULL,
 CONSTRAINT [PK_doughnut_Chart_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event_message]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_message](
	[ID] [int] NOT NULL,
	[类型] [int] NOT NULL,
	[设备] [nchar](100) NOT NULL,
	[设备_地址] [nchar](100) NOT NULL,
	[设备_具体地址] [nchar](100) NOT NULL,
	[位触发条件] [nchar](50) NOT NULL,
	[字触发条件] [nchar](50) NOT NULL,
	[字触发条件_具体] [nchar](50) NOT NULL,
	[报警内容] [nchar](200) NOT NULL,
 CONSTRAINT [PK_Event_message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[function_key_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[function_key_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_function_key_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[General parameters of picture]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[General parameters of picture](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[Control-type] [nchar](50) NOT NULL,
	[Control-state-0] [int] NOT NULL,
	[Control-state-0-list] [int] NOT NULL,
	[Control-state-0-picture] [int] NOT NULL,
	[Control-state-1] [int] NOT NULL,
	[Control-state-1-list] [int] NOT NULL,
	[Control-state-1-picture] [int] NOT NULL,
 CONSTRAINT [PK_General parameters of picture_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupBox_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupBox_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_GroupBox_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[histogram_Chart_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[histogram_Chart_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
	[通道数量] [int] NOT NULL,
	[Name_Text] [nchar](500) NULL,
 CONSTRAINT [PK_histogram_Chart_parameter_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HScrollBar_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HScrollBar_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
	[Min] [int] NOT NULL,
	[Max] [int] NOT NULL,
	[刷新时间] [int] NOT NULL,
 CONSTRAINT [PK_HScrollBar_parameter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ihatetheqrcode_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ihatetheqrcode_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
	[二维码/条形码] [bit] NOT NULL,
	[显示宽-高] [nchar](100) NOT NULL,
 CONSTRAINT [PK_ihatetheqrcode_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImageButton_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageButton_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[位指示灯] [nchar](10) NOT NULL,
	[位切换开关] [nchar](10) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[操作模式] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NULL,
 CONSTRAINT [PK_ImageButton_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[label_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[label_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_label_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LedBulb_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LedBulb_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[位指示灯] [nchar](10) NOT NULL,
	[位切换开关] [nchar](10) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[操作模式] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NULL,
 CONSTRAINT [PK_LedBulb_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LedDisplay_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LedDisplay_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
 CONSTRAINT [PK_LedDisplay_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[numerical_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[numerical_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
 CONSTRAINT [PK_numerical_parameter_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oscillogram_Chart_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oscillogram_Chart_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
	[通道数量] [int] NOT NULL,
	[Name_Text] [nchar](500) NULL,
	[Min] [int] NOT NULL,
	[Max] [int] NOT NULL,
	[刷新时间] [int] NOT NULL,
	[折线图/曲线图] [int] NOT NULL,
 CONSTRAINT [PK_oscillogram_Chart_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[picture_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[picture_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_picture_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLC_macroinstruction]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLC_macroinstruction](
	[ID] [int] NOT NULL,
	[方法索引] [int] NOT NULL,
	[宏指令名称] [nchar](100) NOT NULL,
	[运行时间间隔] [int] NOT NULL,
	[是否周期执行] [bit] NOT NULL,
	[内容] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PLC_macroinstruction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLC_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLC_parameter](
	[ID] [int] NOT NULL,
	[三菱PLC-IP] [nchar](50) NOT NULL,
	[三菱PLC-端口] [nchar](50) NOT NULL,
	[三菱PLC-类型] [nchar](50) NOT NULL,
	[三菱PLC-链接类型] [nchar](50) NOT NULL,
	[西门子PLC-IP] [nchar](50) NOT NULL,
	[西门子PLC-端口] [nchar](50) NOT NULL,
	[西门子PLC-类型] [nchar](50) NOT NULL,
	[西门子PLC-链接类型] [nchar](50) NOT NULL,
	[MODBUS-TCP-PLC-IP] [nchar](50) NOT NULL,
	[MODBUS-TCP-PLC-端口11] [nchar](50) NOT NULL,
	[MODBUS-TCP-PLC-类型] [nchar](50) NOT NULL,
	[MODBUS-TCP-PLC-链接类型] [nchar](50) NOT NULL,
 CONSTRAINT [PK_PLC_parameter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ID] [int] NOT NULL,
	[Profilepicture] [image] NOT NULL,
	[ProfilepictureText] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pull_down_menu_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pull_down_menu_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[位指示灯] [nchar](10) NOT NULL,
	[位切换开关] [nchar](10) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[操作模式] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
	[模式] [int] NOT NULL,
	[下拉背景] [nchar](50) NOT NULL,
	[选择背景] [nchar](50) NOT NULL,
	[项目资料来源] [int] NOT NULL,
	[项目数量] [int] NOT NULL,
 CONSTRAINT [PK_pull_down_menu_parameter_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pull_down_menuName]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pull_down_menuName](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[项目] [int] NOT NULL,
	[数据] [nchar](100) NOT NULL,
	[项目资料] [nchar](100) NOT NULL,
	[控件归属] [nchar](100) NOT NULL,
 CONSTRAINT [PK_pull_down_menuName_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RadioButton_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RadioButton_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[位指示灯] [nchar](10) NOT NULL,
	[位切换开关] [nchar](10) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[操作模式] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NULL,
 CONSTRAINT [PK_RadioButton_parameter_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScrollingText_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScrollingText_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ScrollingText_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Switch_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Switch_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[位指示灯] [nchar](10) NOT NULL,
	[位切换开关] [nchar](10) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[操作模式] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NULL,
 CONSTRAINT [PK_Switch_parameter_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag common parameters]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag common parameters](
	[ID] [nchar](400) NOT NULL,
	[FROM] [nvarchar](max) NOT NULL,
	[Control-type] [nchar](50) NOT NULL,
	[Control-state-0] [int] NOT NULL,
	[Control-state-0_typeface] [nchar](50) NOT NULL,
	[Control-state-0_colour] [nchar](50) NOT NULL,
	[Control-state-0_size] [nchar](50) NOT NULL,
	[Control-state-0_aligning] [nchar](50) NOT NULL,
	[Control-state-0_content] [nchar](100) NOT NULL,
	[Control-state-0_flicker] [int] NOT NULL,
	[Control-state-1] [int] NOT NULL,
	[Control-state-1_typeface] [nchar](50) NOT NULL,
	[Control-state-1_colour] [nchar](50) NOT NULL,
	[Control-state-1_size] [nchar](50) NOT NULL,
	[Control-state-1_aligning] [nchar](50) NOT NULL,
	[Control-state-1_content1] [nchar](100) NOT NULL,
	[Control-state-1_flicker] [int] NOT NULL,
 CONSTRAINT [PK_Tag common parameters_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Valve_parameter]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valve_parameter](
	[ID] [nchar](400) NOT NULL,
	[FORM] [nvarchar](max) NOT NULL,
	[读写设备] [nchar](50) NOT NULL,
	[读写设备_地址] [nchar](50) NOT NULL,
	[读写设备_地址-具体地址] [nchar](50) NOT NULL,
	[读写不同地址_ON_OFF] [int] NOT NULL,
	[写设备_复选] [nchar](50) NOT NULL,
	[写设备_地址_复选] [nchar](50) NOT NULL,
	[写设备_地址-具体地址_复选] [nchar](50) NOT NULL,
	[资料格式] [nchar](50) NOT NULL,
	[数据类型] [nchar](50) NOT NULL,
	[小数点以上位数] [nchar](50) NOT NULL,
	[小数点以下位数] [nchar](50) NOT NULL,
	[操作安全时间] [nchar](50) NOT NULL,
	[轴底座颜色] [nchar](100) NOT NULL,
	[轴颜色] [nchar](100) NOT NULL,
	[液体颜色] [nchar](100) NOT NULL,
	[液体流动方向] [nchar](100) NOT NULL,
	[液体流速] [int] NOT NULL,
	[液体流速自动控制] [int] NOT NULL,
	[阀门] [int] NOT NULL,
	[阀门自动控制] [int] NOT NULL,
	[开关把手颜色] [nchar](100) NOT NULL,
	[阀门颜色] [nchar](100) NOT NULL,
	[阀门样式] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Valve_parameter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[AnalogMeter_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AnalogMeter_Class]
AS
SELECT   dbo.AnalogMeter_parameter.ID, dbo.AnalogMeter_parameter.FORM, dbo.AnalogMeter_parameter.读写设备, 
                dbo.AnalogMeter_parameter.读写设备_地址, dbo.AnalogMeter_parameter.[读写设备_地址-具体地址], 
                dbo.AnalogMeter_parameter.读写不同地址_ON_OFF, dbo.AnalogMeter_parameter.写设备_复选, 
                dbo.AnalogMeter_parameter.写设备_地址_复选, dbo.AnalogMeter_parameter.[写设备_地址-具体地址_复选], 
                dbo.AnalogMeter_parameter.资料格式, dbo.AnalogMeter_parameter.数据类型, 
                dbo.AnalogMeter_parameter.小数点以上位数, dbo.AnalogMeter_parameter.小数点以下位数, 
                dbo.AnalogMeter_parameter.操作安全时间, dbo.AnalogMeter_parameter.Min, dbo.AnalogMeter_parameter.Max, 
                dbo.AnalogMeter_parameter.刷新时间, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size
FROM      dbo.AnalogMeter_parameter INNER JOIN
                dbo.[control-location] ON dbo.AnalogMeter_parameter.ID = dbo.[control-location].ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.AnalogMeter_parameter.ID = dbo.[Tag common parameters].ID

GO
/****** Object:  View [dbo].[Button_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Button_Class]
AS
SELECT   dbo.Button_parameter.ID, dbo.Button_parameter.FORM, dbo.Button_parameter.位指示灯, 
                dbo.Button_parameter.位切换开关, dbo.Button_parameter.读写设备, dbo.Button_parameter.读写设备_地址, 
                dbo.Button_parameter.[读写设备_地址-具体地址], dbo.Button_parameter.读写不同地址_ON_OFF, 
                dbo.Button_parameter.写设备_复选, dbo.Button_parameter.写设备_地址_复选, 
                dbo.Button_parameter.[写设备_地址-具体地址_复选], dbo.Button_parameter.操作模式, 
                dbo.Button_parameter.操作安全时间, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size, dbo.[General parameters of picture].[Control-type] AS Expr1, 
                dbo.[General parameters of picture].[Control-state-0] AS Expr2, dbo.[General parameters of picture].[Control-state-0-list], 
                dbo.[General parameters of picture].[Control-state-0-picture], 
                dbo.[General parameters of picture].[Control-state-1] AS Expr3, dbo.[General parameters of picture].[Control-state-1-list], 
                dbo.[General parameters of picture].[Control-state-1-picture], dbo.Button_colour.colour_0, 
                dbo.Button_colour.colour_1
FROM      dbo.Button_parameter INNER JOIN
                dbo.[control-location] ON dbo.Button_parameter.ID = dbo.[control-location].ID INNER JOIN
                dbo.[General parameters of picture] ON dbo.Button_parameter.ID = dbo.[General parameters of picture].ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.Button_parameter.ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.Button_parameter.ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[Conveyor_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Conveyor_Class]
AS
SELECT   dbo.Conveyor_parameter.*, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size
FROM      dbo.[control-location] INNER JOIN
                dbo.Conveyor_parameter ON dbo.[control-location].ID = dbo.Conveyor_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID

GO
/****** Object:  View [dbo].[doughnut_Chart_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[doughnut_Chart_Class]
AS
SELECT   dbo.doughnut_Chart_parameter.ID, dbo.doughnut_Chart_parameter.FORM, dbo.doughnut_Chart_parameter.读写设备, 
                dbo.doughnut_Chart_parameter.读写设备_地址, dbo.doughnut_Chart_parameter.[读写设备_地址-具体地址], 
                dbo.doughnut_Chart_parameter.读写不同地址_ON_OFF, dbo.doughnut_Chart_parameter.写设备_复选, 
                dbo.doughnut_Chart_parameter.写设备_地址_复选, dbo.doughnut_Chart_parameter.[写设备_地址-具体地址_复选], 
                dbo.doughnut_Chart_parameter.资料格式, dbo.doughnut_Chart_parameter.数据类型, 
                dbo.doughnut_Chart_parameter.小数点以上位数, dbo.doughnut_Chart_parameter.小数点以下位数, 
                dbo.doughnut_Chart_parameter.操作安全时间, dbo.doughnut_Chart_parameter.通道数量, 
                dbo.doughnut_Chart_parameter.Name_Text, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size, dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.[control-location] INNER JOIN
                dbo.doughnut_Chart_parameter ON dbo.[control-location].ID = dbo.doughnut_Chart_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.[control-location].ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[function_key_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[function_key_Class]
AS
SELECT   dbo.function_key_parameter.ID, dbo.function_key_parameter.FORM, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[control-location].location, dbo.[control-location].size, 
                dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.[control-location] INNER JOIN
                dbo.function_key_parameter ON dbo.[control-location].ID = dbo.function_key_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.[control-location].ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[GroupBox_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GroupBox_Class]
AS
SELECT   dbo.GroupBox_parameter.ID, dbo.GroupBox_parameter.FORM, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size, dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.[control-location] INNER JOIN
                dbo.GroupBox_parameter ON dbo.[control-location].ID = dbo.GroupBox_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.[control-location].ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[histogram_Chart_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[histogram_Chart_Class]
AS
SELECT   dbo.histogram_Chart_parameter.ID, dbo.histogram_Chart_parameter.FORM, dbo.histogram_Chart_parameter.读写设备, 
                dbo.histogram_Chart_parameter.读写设备_地址, dbo.histogram_Chart_parameter.[读写设备_地址-具体地址], 
                dbo.histogram_Chart_parameter.读写不同地址_ON_OFF, dbo.histogram_Chart_parameter.写设备_复选, 
                dbo.histogram_Chart_parameter.写设备_地址_复选, dbo.histogram_Chart_parameter.[写设备_地址-具体地址_复选], 
                dbo.histogram_Chart_parameter.资料格式, dbo.histogram_Chart_parameter.数据类型, 
                dbo.histogram_Chart_parameter.小数点以上位数, dbo.histogram_Chart_parameter.小数点以下位数, 
                dbo.histogram_Chart_parameter.操作安全时间, dbo.histogram_Chart_parameter.通道数量, 
                dbo.histogram_Chart_parameter.Name_Text, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size, dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.[control-location] INNER JOIN
                dbo.histogram_Chart_parameter ON dbo.[control-location].ID = dbo.histogram_Chart_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.[control-location].ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[HScrollBar_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HScrollBar_Class]
AS
SELECT dbo.HScrollBar_parameter.*, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], 
                dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], 
                dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], 
                dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], 
                dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], 
                dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], 
                dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], 
                dbo.[Tag common parameters].[Control-state-1_flicker], dbo.[control-location].location, 
                dbo.[control-location].size
FROM   dbo.[control-location] INNER JOIN
                dbo.HScrollBar_parameter ON dbo.[control-location].ID = dbo.HScrollBar_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID

GO
/****** Object:  View [dbo].[ihatetheqrcode_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ihatetheqrcode_Class]
AS
SELECT   dbo.ihatetheqrcode_parameter.*, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size
FROM      dbo.[control-location] INNER JOIN
                dbo.ihatetheqrcode_parameter ON dbo.[control-location].ID = dbo.ihatetheqrcode_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID

GO
/****** Object:  View [dbo].[ImageButton_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ImageButton_Class]
AS
SELECT   dbo.ImageButton_parameter.*, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size
FROM      dbo.[control-location] INNER JOIN
                dbo.ImageButton_parameter ON dbo.[control-location].ID = dbo.ImageButton_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID

GO
/****** Object:  View [dbo].[label_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[label_Class]
AS
SELECT   dbo.[Tag common parameters].ID, dbo.[Tag common parameters].[FROM], dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[control-location].location, dbo.[control-location].size, dbo.[Tag common parameters].[Control-state-0_flicker]
FROM      dbo.[control-location] INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.label_parameter ON dbo.[control-location].ID = dbo.label_parameter.ID

GO
/****** Object:  View [dbo].[LedBulb_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LedBulb_Class]
AS
SELECT   dbo.LedBulb_parameter.ID, dbo.LedBulb_parameter.FORM, dbo.LedBulb_parameter.位指示灯, 
                dbo.LedBulb_parameter.位切换开关, dbo.LedBulb_parameter.读写设备, dbo.LedBulb_parameter.读写设备_地址, 
                dbo.LedBulb_parameter.[读写设备_地址-具体地址], dbo.LedBulb_parameter.读写不同地址_ON_OFF, 
                dbo.LedBulb_parameter.写设备_复选, dbo.LedBulb_parameter.写设备_地址_复选, 
                dbo.LedBulb_parameter.[写设备_地址-具体地址_复选], dbo.LedBulb_parameter.操作模式, 
                dbo.LedBulb_parameter.操作安全时间, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size, dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.[control-location] INNER JOIN
                dbo.LedBulb_parameter ON dbo.[control-location].ID = dbo.LedBulb_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.[control-location].ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[LedDisplay_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LedDisplay_Class]
AS
SELECT   dbo.LedDisplay_parameter.ID, dbo.LedDisplay_parameter.FORM, dbo.LedDisplay_parameter.读写设备, 
                dbo.LedDisplay_parameter.读写设备_地址, dbo.LedDisplay_parameter.[读写设备_地址-具体地址], 
                dbo.LedDisplay_parameter.读写不同地址_ON_OFF, dbo.LedDisplay_parameter.写设备_复选, 
                dbo.LedDisplay_parameter.写设备_地址_复选, dbo.LedDisplay_parameter.[写设备_地址-具体地址_复选], 
                dbo.LedDisplay_parameter.资料格式, dbo.LedDisplay_parameter.数据类型, 
                dbo.LedDisplay_parameter.小数点以上位数, dbo.LedDisplay_parameter.小数点以下位数, 
                dbo.LedDisplay_parameter.操作安全时间, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size, dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.[control-location] INNER JOIN
                dbo.LedDisplay_parameter ON dbo.[control-location].ID = dbo.LedDisplay_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.[control-location].ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[numerical_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[numerical_Class]
AS
SELECT   dbo.numerical_parameter.ID, dbo.numerical_parameter.FORM, dbo.numerical_parameter.读写设备, 
                dbo.numerical_parameter.读写设备_地址, dbo.numerical_parameter.[读写设备_地址-具体地址], 
                dbo.numerical_parameter.读写不同地址_ON_OFF, dbo.numerical_parameter.写设备_复选, 
                dbo.numerical_parameter.写设备_地址_复选, dbo.numerical_parameter.[写设备_地址-具体地址_复选], 
                dbo.numerical_parameter.资料格式, dbo.numerical_parameter.数据类型, dbo.numerical_parameter.小数点以上位数, 
                dbo.numerical_parameter.小数点以下位数, dbo.numerical_parameter.操作安全时间, 
                dbo.[Tag common parameters].[Control-type], dbo.[Tag common parameters].[Control-state-0], 
                dbo.[Tag common parameters].[Control-state-0_typeface], dbo.[Tag common parameters].[Control-state-0_colour], 
                dbo.[Tag common parameters].[Control-state-0_size], dbo.[Tag common parameters].[Control-state-0_aligning], 
                dbo.[Tag common parameters].[Control-state-0_content], dbo.[Tag common parameters].[Control-state-0_flicker], 
                dbo.[Tag common parameters].[Control-state-1], dbo.[Tag common parameters].[Control-state-1_typeface], 
                dbo.[Tag common parameters].[Control-state-1_colour], dbo.[Tag common parameters].[Control-state-1_size], 
                dbo.[Tag common parameters].[Control-state-1_aligning], dbo.[Tag common parameters].[Control-state-1_content1], 
                dbo.[Tag common parameters].[Control-state-1_flicker], dbo.[General parameters of picture].[Control-type] AS Expr1, 
                dbo.[General parameters of picture].[Control-state-0] AS Expr2, dbo.[General parameters of picture].[Control-state-0-list], 
                dbo.[General parameters of picture].[Control-state-0-picture], 
                dbo.[General parameters of picture].[Control-state-1] AS Expr3, dbo.[General parameters of picture].[Control-state-1-list], 
                dbo.[General parameters of picture].[Control-state-1-picture], dbo.[control-location].location, dbo.[control-location].size, 
                dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.[control-location] INNER JOIN
                dbo.[General parameters of picture] ON dbo.[control-location].ID = dbo.[General parameters of picture].ID INNER JOIN
                dbo.numerical_parameter ON dbo.[control-location].ID = dbo.numerical_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.[control-location].ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[oscillogram_Chart_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[oscillogram_Chart_Class]
AS
SELECT   dbo.oscillogram_Chart_parameter.ID, dbo.oscillogram_Chart_parameter.FORM, 
                dbo.oscillogram_Chart_parameter.读写设备, dbo.oscillogram_Chart_parameter.读写设备_地址, 
                dbo.oscillogram_Chart_parameter.[读写设备_地址-具体地址], dbo.oscillogram_Chart_parameter.读写不同地址_ON_OFF, 
                dbo.oscillogram_Chart_parameter.写设备_复选, dbo.oscillogram_Chart_parameter.写设备_地址_复选, 
                dbo.oscillogram_Chart_parameter.[写设备_地址-具体地址_复选], dbo.oscillogram_Chart_parameter.资料格式, 
                dbo.oscillogram_Chart_parameter.数据类型, dbo.oscillogram_Chart_parameter.小数点以上位数, 
                dbo.oscillogram_Chart_parameter.小数点以下位数, dbo.oscillogram_Chart_parameter.操作安全时间, 
                dbo.oscillogram_Chart_parameter.通道数量, dbo.oscillogram_Chart_parameter.Name_Text, 
                dbo.oscillogram_Chart_parameter.Min, dbo.oscillogram_Chart_parameter.Max, 
                dbo.oscillogram_Chart_parameter.刷新时间, dbo.oscillogram_Chart_parameter.[折线图/曲线图], 
                dbo.[Tag common parameters].[Control-type], dbo.[Tag common parameters].[Control-state-0], 
                dbo.[Tag common parameters].[Control-state-0_typeface], dbo.[Tag common parameters].[Control-state-0_colour], 
                dbo.[Tag common parameters].[Control-state-0_size], dbo.[Tag common parameters].[Control-state-0_aligning], 
                dbo.[Tag common parameters].[Control-state-0_content], dbo.[Tag common parameters].[Control-state-0_flicker], 
                dbo.[Tag common parameters].[Control-state-1], dbo.[Tag common parameters].[Control-state-1_typeface], 
                dbo.[Tag common parameters].[Control-state-1_colour], dbo.[Tag common parameters].[Control-state-1_size], 
                dbo.[Tag common parameters].[Control-state-1_aligning], dbo.[Tag common parameters].[Control-state-1_content1], 
                dbo.[Tag common parameters].[Control-state-1_flicker], dbo.[control-location].location, dbo.[control-location].size, 
                dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.[control-location] INNER JOIN
                dbo.oscillogram_Chart_parameter ON dbo.[control-location].ID = dbo.oscillogram_Chart_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.[control-location].ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[picture_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[picture_Class]
AS
SELECT  dbo.[General parameters of picture].ID, dbo.[General parameters of picture].FORM, 
                   dbo.[General parameters of picture].[Control-type], dbo.[General parameters of picture].[Control-state-0], 
                   dbo.[General parameters of picture].[Control-state-0-list], dbo.[General parameters of picture].[Control-state-0-picture], 
                   dbo.[control-location].location, dbo.[control-location].size
FROM      dbo.[control-location] INNER JOIN
                   dbo.[General parameters of picture] ON dbo.[control-location].ID = dbo.[General parameters of picture].ID INNER JOIN
                   dbo.picture_parameter ON dbo.[control-location].ID = dbo.picture_parameter.ID

GO
/****** Object:  View [dbo].[pull_down_menu_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[pull_down_menu_Class]
AS
SELECT   dbo.pull_down_menu_parameter.ID, dbo.pull_down_menu_parameter.FORM, dbo.pull_down_menu_parameter.位指示灯, 
                dbo.pull_down_menu_parameter.位切换开关, dbo.pull_down_menu_parameter.读写设备, 
                dbo.pull_down_menu_parameter.读写设备_地址, dbo.pull_down_menu_parameter.[读写设备_地址-具体地址], 
                dbo.pull_down_menu_parameter.读写不同地址_ON_OFF, dbo.pull_down_menu_parameter.写设备_复选, 
                dbo.pull_down_menu_parameter.写设备_地址_复选, dbo.pull_down_menu_parameter.[写设备_地址-具体地址_复选], 
                dbo.pull_down_menu_parameter.操作模式, dbo.pull_down_menu_parameter.操作安全时间, 
                dbo.pull_down_menu_parameter.模式, dbo.pull_down_menu_parameter.下拉背景, 
                dbo.pull_down_menu_parameter.选择背景, dbo.pull_down_menu_parameter.项目资料来源, 
                dbo.pull_down_menu_parameter.项目数量, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size
FROM      dbo.[control-location] INNER JOIN
                dbo.pull_down_menu_parameter ON dbo.[control-location].ID = dbo.pull_down_menu_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID

GO
/****** Object:  View [dbo].[RadioButton_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RadioButton_Class]
AS
SELECT   dbo.RadioButton_parameter.*, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size, dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.Button_colour INNER JOIN
                dbo.[control-location] ON dbo.Button_colour.ID = dbo.[control-location].ID INNER JOIN
                dbo.RadioButton_parameter ON dbo.Button_colour.ID = dbo.RadioButton_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.Button_colour.ID = dbo.[Tag common parameters].ID

GO
/****** Object:  View [dbo].[ScrollingText_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ScrollingText_Class]
AS
SELECT   dbo.ScrollingText_parameter.ID, dbo.ScrollingText_parameter.FORM, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size
FROM      dbo.[control-location] INNER JOIN
                dbo.ScrollingText_parameter ON dbo.[control-location].ID = dbo.ScrollingText_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID

GO
/****** Object:  View [dbo].[Switch_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Switch_Class]
AS
SELECT   dbo.Switch_parameter.ID, dbo.Switch_parameter.FORM, dbo.Switch_parameter.位指示灯, 
                dbo.Switch_parameter.位切换开关, dbo.Switch_parameter.读写设备, dbo.Switch_parameter.读写设备_地址, 
                dbo.Switch_parameter.[读写设备_地址-具体地址], dbo.Switch_parameter.读写不同地址_ON_OFF, 
                dbo.Switch_parameter.写设备_复选, dbo.Switch_parameter.写设备_地址_复选, 
                dbo.Switch_parameter.[写设备_地址-具体地址_复选], dbo.Switch_parameter.操作模式, 
                dbo.Switch_parameter.操作安全时间, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size, dbo.Button_colour.colour_0, dbo.Button_colour.colour_1
FROM      dbo.[control-location] INNER JOIN
                dbo.Switch_parameter ON dbo.[control-location].ID = dbo.Switch_parameter.ID INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Button_colour ON dbo.[control-location].ID = dbo.Button_colour.ID

GO
/****** Object:  View [dbo].[Valve_Class]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Valve_Class]
AS
SELECT   dbo.Valve_parameter.ID, dbo.Valve_parameter.FORM, dbo.Valve_parameter.读写设备, 
                dbo.Valve_parameter.读写设备_地址, dbo.Valve_parameter.[读写设备_地址-具体地址], 
                dbo.Valve_parameter.读写不同地址_ON_OFF, dbo.Valve_parameter.写设备_复选, 
                dbo.Valve_parameter.写设备_地址_复选, dbo.Valve_parameter.[写设备_地址-具体地址_复选], 
                dbo.Valve_parameter.资料格式, dbo.Valve_parameter.数据类型, dbo.Valve_parameter.小数点以上位数, 
                dbo.Valve_parameter.小数点以下位数, dbo.Valve_parameter.操作安全时间, dbo.Valve_parameter.轴底座颜色, 
                dbo.Valve_parameter.轴颜色, dbo.Valve_parameter.液体颜色, dbo.Valve_parameter.液体流动方向, 
                dbo.Valve_parameter.液体流速, dbo.Valve_parameter.液体流速自动控制, dbo.Valve_parameter.阀门, 
                dbo.Valve_parameter.阀门自动控制, dbo.Valve_parameter.开关把手颜色, dbo.Valve_parameter.阀门颜色, 
                dbo.Valve_parameter.阀门样式, dbo.[Tag common parameters].[Control-type], 
                dbo.[Tag common parameters].[Control-state-0], dbo.[Tag common parameters].[Control-state-0_typeface], 
                dbo.[Tag common parameters].[Control-state-0_colour], dbo.[Tag common parameters].[Control-state-0_size], 
                dbo.[Tag common parameters].[Control-state-0_aligning], dbo.[Tag common parameters].[Control-state-0_content], 
                dbo.[Tag common parameters].[Control-state-0_flicker], dbo.[Tag common parameters].[Control-state-1], 
                dbo.[Tag common parameters].[Control-state-1_typeface], dbo.[Tag common parameters].[Control-state-1_colour], 
                dbo.[Tag common parameters].[Control-state-1_size], dbo.[Tag common parameters].[Control-state-1_aligning], 
                dbo.[Tag common parameters].[Control-state-1_content1], dbo.[Tag common parameters].[Control-state-1_flicker], 
                dbo.[control-location].location, dbo.[control-location].size
FROM      dbo.[control-location] INNER JOIN
                dbo.[Tag common parameters] ON dbo.[control-location].ID = dbo.[Tag common parameters].ID INNER JOIN
                dbo.Valve_parameter ON dbo.[control-location].ID = dbo.Valve_parameter.ID

GO
/****** Object:  DdlTrigger [OnTriggerDboSchema]    Script Date: 2021/1/16 13:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [OnTriggerDboSchema] ON database FOR create_table, create_view AS BEGIN   DECLARE @xmlEventData xml   SELECT    @xmlEventData = eventdata()   DECLARE @schemaName nvarchar(max)   DECLARE @objectName nvarchar(max)   DECLARE @DynSql nvarchar(max)      SET @schemaName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/SchemaName/text()'))   SET @objectName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/ObjectName/text()'))   IF(@schemaName='')   BEGIN     SET @DynSql = N'alter schema [dbo] transfer [' + @schemaName + N'].[' + @objectName + N']'     EXEC sp_executesql @statement=@DynSql   END END SET QUOTED_IDENTIFIER ON SET ANSI_NULLS ON 
GO
ENABLE TRIGGER [OnTriggerDboSchema] ON DATABASE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AnalogMeter_parameter"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 274
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 312
               Bottom = 146
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 37
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 150' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AnalogMeter_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AnalogMeter_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AnalogMeter_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Button_parameter"
            Begin Extent = 
               Top = 7
               Left = 0
               Bottom = 170
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 318
               Bottom = 146
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "General parameters of picture"
            Begin Extent = 
               Top = 174
               Left = 38
               Bottom = 314
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 318
               Left = 38
               Bottom = 458
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 498
               Bottom = 146
               Right = 640
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Button_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Button_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Button_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Conveyor_parameter"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 146
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 13
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Conveyor_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Conveyor_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "doughnut_Chart_parameter"
            Begin Extent = 
               Top = 2
               Left = 28
               Bottom = 142
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 144
               Left = 218
               Bottom = 284
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 146
               Right = 630
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'doughnut_Chart_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'doughnut_Chart_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'doughnut_Chart_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "function_key_parameter"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 108
               Right = 360
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 108
               Left = 218
               Bottom = 248
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 146
               Right = 630
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'function_key_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'function_key_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'function_key_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 215
               Left = 46
               Bottom = 355
               Right = 188
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GroupBox_parameter"
            Begin Extent = 
               Top = 25
               Left = 0
               Bottom = 127
               Right = 142
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 146
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 146
               Right = 630
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GroupBox_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GroupBox_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 294
               Left = 38
               Bottom = 434
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "histogram_Chart_parameter"
            Begin Extent = 
               Top = 8
               Left = 0
               Bottom = 148
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 294
               Left = 218
               Bottom = 434
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 146
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 36
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'histogram_Chart_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'histogram_Chart_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'histogram_Chart_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 0
               Left = 497
               Bottom = 140
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HScrollBar_parameter"
            Begin Extent = 
               Top = 5
               Left = 14
               Bottom = 145
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 4
               Left = 249
               Bottom = 144
               Right = 481
            End
            DisplayFlags = 280
            TopColumn = 12
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HScrollBar_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HScrollBar_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 0
               Left = 525
               Bottom = 140
               Right = 667
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ihatetheqrcode_parameter"
            Begin Extent = 
               Top = 0
               Left = 25
               Bottom = 140
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 0
               Left = 270
               Bottom = 140
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 13
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ihatetheqrcode_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ihatetheqrcode_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 128
               Left = 570
               Bottom = 268
               Right = 712
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ImageButton_parameter"
            Begin Extent = 
               Top = 133
               Left = 69
               Bottom = 273
               Right = 305
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 130
               Left = 317
               Bottom = 270
               Right = 549
            End
            DisplayFlags = 280
            TopColumn = 13
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ImageButton_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ImageButton_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 191
               Left = 80
               Bottom = 331
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 146
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "label_parameter"
            Begin Extent = 
               Top = 9
               Left = 26
               Bottom = 128
               Right = 187
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'label_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'label_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LedBulb_parameter"
            Begin Extent = 
               Top = 9
               Left = 67
               Bottom = 149
               Right = 303
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 341
               Bottom = 146
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LedBulb_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LedBulb_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LedDisplay_parameter"
            Begin Extent = 
               Top = 0
               Left = 41
               Bottom = 140
               Right = 277
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 144
               Left = 218
               Bottom = 284
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 146
               Right = 630
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 34
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LedDisplay_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LedDisplay_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LedDisplay_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "General parameters of picture"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 146
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "numerical_parameter"
            Begin Extent = 
               Top = 0
               Left = 0
               Bottom = 163
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 168
               Left = 38
               Bottom = 308
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 478
               Bottom = 146
               Right = 620
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'numerical_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'numerical_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'numerical_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oscillogram_Chart_parameter"
            Begin Extent = 
               Top = 14
               Left = 242
               Bottom = 154
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 516
               Bottom = 146
               Right = 658
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'oscillogram_Chart_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'oscillogram_Chart_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -120
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 137
               Left = 562
               Bottom = 300
               Right = 723
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "General parameters of picture"
            Begin Extent = 
               Top = 147
               Left = 283
               Bottom = 310
               Right = 548
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "picture_parameter"
            Begin Extent = 
               Top = 158
               Left = 51
               Bottom = 277
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'picture_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'picture_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 19
               Left = 558
               Bottom = 159
               Right = 700
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pull_down_menu_parameter"
            Begin Extent = 
               Top = 0
               Left = 0
               Bottom = 140
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 160
               Left = 187
               Bottom = 300
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 13
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 36
         Width = 284
         Width = 8130
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'pull_down_menu_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'pull_down_menu_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'pull_down_menu_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 0
               Left = 639
               Bottom = 140
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "control-location"
            Begin Extent = 
               Top = 5
               Left = 484
               Bottom = 145
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RadioButton_parameter"
            Begin Extent = 
               Top = 0
               Left = 0
               Bottom = 140
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 2
               Left = 240
               Bottom = 142
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 13
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RadioButton_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RadioButton_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 219
               Left = 75
               Bottom = 359
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ScrollingText_parameter"
            Begin Extent = 
               Top = 2
               Left = 23
               Bottom = 104
               Right = 165
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 146
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ScrollingText_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ScrollingText_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Switch_parameter"
            Begin Extent = 
               Top = 6
               Left = 0
               Bottom = 146
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Button_colour"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 146
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Switch_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Switch_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "control-location"
            Begin Extent = 
               Top = 294
               Left = 38
               Bottom = 434
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag common parameters"
            Begin Extent = 
               Top = 294
               Left = 218
               Bottom = 434
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "Valve_parameter"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 274
            End
            DisplayFlags = 280
            TopColumn = 11
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Valve_Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Valve_Class'
GO
USE [master]
GO
ALTER DATABASE [Uppercomputer] SET  READ_WRITE 
GO
