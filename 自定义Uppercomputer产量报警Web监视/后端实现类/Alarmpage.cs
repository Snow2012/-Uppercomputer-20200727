﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Serialization;
using HTML布局学习.EF实体模型;
using 自定义Uppercomputer产量报警Web监视.EF实体模型;

namespace HTML布局学习.后端实现类
{
    /// <summary>
    /// 用于处理报警页面
    /// </summary>
    public class Alarmpage
    {
        Timer refresh_time;
        /// <summary>
        /// 本类数据加载锁
        /// </summary>
        static object thle = new object();
        public Alarmpage()
        {
            //定时刷新数据
            refresh_time = new System.Threading.Timer(new TimerCallback((s) =>
            {
                lock (thle)
                {
                    //读取SQL获取指定数据
                    using (UppercomputerEntities2 entities = new UppercomputerEntities2())
                    {
                        webpoliceCollection = entities.WebpoliceCollections.FirstOrDefault();
                    }
                }
            }));
            refresh_time.Change(500, 300);
        }
        /// <summary>
        /// 采集软件是否在线报警锁
        /// </summary>
        static object Alarmobject = new object();
        /// <summary>
        /// 指示采集软件是否在线
        /// </summary>
        public static bool Gatherrun
        {
            get
            {
                lock (Alarmobject)
                {
                    //判断数据采集软件是否掉线--false掉线 true 在线
                    using (UppercomputerEntities2 db = new UppercomputerEntities2())
                    {
                        var Data = db.WeboutputCollections.FirstOrDefault();
                        var DataTime= DateTime.Now - DateTime.Parse(Data.采集软件在线时间);                      
                        return Data!=null ? (DateTime.Now - DateTime.Parse(Data.采集软件在线时间)).Minutes > 5 || DataTime.Days != 0 ||DataTime.Hours!=0? false : true : false;
                    }
                }
            }
        }


        /// <summary>
        /// 报警表锁
        /// </summary>
        static object lex = new object();
        /// <summary>
        /// SQL中的报警表
        /// </summary>
        public static WebpoliceCollection webpoliceCollection
        {

            get
            {
                lock (lex)
                {
                    if (Webpolice != null)
                        return Webpolice;
                    else
                        return new WebpoliceCollection();
                }
            }
            set
            {
                lock (lex)
                {
                    Webpolice = value;
                }
            }
        }
        private static WebpoliceCollection Webpolice;
        /// <summary>
        /// 查询7天 报警次数 与 本月报警次数
        /// </summary>
        /// <returns></returns>
        public static string Alarmnumber()
        {
            List<Tuple<List<Alarmchart>>> tuples = new List<Tuple<List<Alarmchart>>>();
            using (UppercomputerEntities2 db=new UppercomputerEntities2())
            {
               var data= db.Alarmhistory.ToList();
                tuples.Add(new Tuple<List<Alarmchart>>(GetAlarmcharts(data, 7)));
                tuples.Add(new Tuple<List<Alarmchart>>(MonthData(data)));
                return new JavaScriptSerializer().Serialize(tuples);
            }
        }
        /// <summary>
        /// 根据报警表 分析数据 
        /// </summary>
        /// <param name="alarmhistories"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        private static List<Alarmchart> GetAlarmcharts(List<Alarmhistories> alarmhistories, int count)
        {
            //创建周报警表
            List<Alarmchart> Weeksurface = new List<Alarmchart>();
            //默认数据
            for (int i = 0; i < count; i++)
            {
                Weeksurface.Add(new Alarmchart() { Name = "0", Data = 0 });
            }
            var present = System.DateTime.Now;
            //int number = Convert.ToInt32(present.DayOfWeek);//需要往后移动的天数
            int number = count;
            if (number == 0)
                number = count;
            for (int i = 0; i < number; i++)
            {
                DateTime date2 = DateTime.Parse(System.DateTime.Now.ToString("D") + "00:00");
                TimeSpan ts2 = new TimeSpan(0, 24 * i, 0, 0);
                DateTime dt22 = date2.Subtract(ts2);
                var Date = (from p in alarmhistories where DateTime.Parse(p.报警时间.Trim()).Date == dt22.Date select p).ToList();
                if (Date.Count > 0)
                {
                    Weeksurface[i].Data = Date.Count;
                }
                Weeksurface[i].Name = dt22.ToString("M");
            }
            return Weeksurface;
        }
        /// <summary>
        /// 获取月产量--生成月度报警表
        /// </summary>
        /// <returns></returns>
        public static List<Alarmchart> MonthData(List<Alarmhistories> alarmhistories)
        {
            //创建月表
            List<Alarmchart> Weeksurface = new List<Alarmchart>();
            //月默认数据
            for (int i = 0; i < 7; i++)
            {
                Weeksurface.Add(new Alarmchart() { Name = "0", Data = 0 });
            }
            //获取当前时间
            var present = System.DateTime.Now;
            int month = (present.Month - 6);
            int year = System.DateTime.Now.Year;
            //获取当前月的往后7个月的时间
            //判断获取的数据是否需要跨年度
            if ((present.Month - 7) < 0)
            {
                //获取后一年的月数
                month = (present.Month - 7) + 13;
                //获取后一年的数
                year = System.DateTime.Now.Year - 1;
            }
            for (int i = 0; i < 7; i++)
            {
                //如果数量大于12  变成当前年1月1号
                if (month > 12)
                {
                    month = 1;
                    year = System.DateTime.Now.Year;
                }
                month = month == 0 ? 1 : month;
                //获取需要遍历的时间
                DateTime date2 = DateTime.Parse($"{year}/{month}/1 00:00");
                var Month = (from p in alarmhistories where date2.ToString("Y") == DateTime.Parse(p.报警时间.Trim()).ToString("Y") select p).ToList();
                month += 1;
                //判断获取到的产量表
                Weeksurface[i].Name = date2.ToString("Y");
                Weeksurface[i].Data = Month.Count;
            }
            //当月就显示当前最新的日期
            Weeksurface[6].Name = present.ToString("Y");

            return Weeksurface;
        }
        /// <summary>
        /// 查询7天 报警处理用时  本月报警用时
        /// </summary>
        /// <returns></returns>
        public static string AlarmDispose()
        {
            List<Tuple<List<AlarmDisposechart>>> tuples = new List<Tuple<List<AlarmDisposechart>>>();
            using (UppercomputerEntities2 db = new UppercomputerEntities2())
            {
                var data = db.Alarmhistory.ToList();
                tuples.Add(new Tuple<List<AlarmDisposechart>>(GetAlarmDisposecharts(data, 7)));
                tuples.Add(new Tuple<List<AlarmDisposechart>>(MonthDisposeData(data)));
                return new JavaScriptSerializer().Serialize(tuples);
            }
        }
        /// <summary>
        /// 根据报警表 分析数据 
        /// </summary>
        /// <param name="alarmhistories"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        private static List<AlarmDisposechart> GetAlarmDisposecharts(List<Alarmhistories> alarmhistories, int count)
        {
            //创建周报警表
            List<AlarmDisposechart> Weeksurface = new List<AlarmDisposechart>();
            //默认数据
            for (int i = 0; i < count; i++)
            {
                Weeksurface.Add(new AlarmDisposechart() { Name = "0", Data =0});
            }
            var present = System.DateTime.Now;
            // int number = Convert.ToInt32(present.DayOfWeek);//需要往后移动的天数
            int number = count;
            if (number == 0)
                number = count;
            for (int i = 0; i < number; i++)
            {
                DateTime date2 = DateTime.Parse(System.DateTime.Now.ToString("D") + "00:00");
                TimeSpan ts2 = new TimeSpan(0, 24*i, 0, 0);
                DateTime dt22 = date2.Subtract(ts2);
                TimeSpan Month = new TimeSpan();
                (from p in alarmhistories where DateTime.Parse(p.报警时间.Trim()).Date == dt22.Date select p).ToList().ForEach(s1 =>
                {
                    Month += DateTime.Parse(s1.处理完成时间.Trim()) - DateTime.Parse(s1.报警时间.Trim());
                });
                // Weeksurface[i].Data = $"{(Month.Days < 10 ? "0" : Month.Days.ToString())}{Month.Days}:{(Month.Hours < 10 ? "0" : Month.Hours.ToString())}{Month.Hours}:{(Month.Minutes < 10 ? "0" : Month.Minutes.ToString())}{Month.Minutes}";
                Weeksurface[i].Data =Convert.ToInt32(Month.TotalMinutes);
                Weeksurface[i].Name = dt22.ToString("M");
            }
            return Weeksurface;
        }
        /// <summary>
        /// 获取月产量--生成月度报警表
        /// </summary>
        /// <returns></returns>
        public static List<AlarmDisposechart> MonthDisposeData(List<Alarmhistories> alarmhistories)
        {
            //创建月表
            List<AlarmDisposechart> Weeksurface = new List<AlarmDisposechart>();
            //月默认数据
            for (int i = 0; i < 7; i++)
            {
                Weeksurface.Add(new AlarmDisposechart() { Name = "0", Data = 0 });
            }
            //获取当前时间
            var present = System.DateTime.Now;
            int month = (present.Month - 6);
            int year = System.DateTime.Now.Year;
            //获取当前月的往后7个月的时间
            //判断获取的数据是否需要跨年度
            if ((present.Month - 7) < 0)
            {
                //获取后一年的月数
                month = (present.Month - 7) + 13;
                //获取后一年的数
                year = System.DateTime.Now.Year - 1;
            }
            for (int i = 0; i < 7; i++)
            {
                //如果数量大于12  变成当前年1月1号
                if (month > 12)
                {
                    month = 1;
                    year = System.DateTime.Now.Year;
                }
                month = month == 0 ? 1 : month;
                //获取需要遍历的时间
                DateTime date2 = DateTime.Parse($"{year}/{month}/1 00:00");
                TimeSpan Month = new TimeSpan();
                (from p in alarmhistories where date2.ToString("Y") == DateTime.Parse(p.报警时间.Trim()).ToString("Y") select p).ToList().ForEach(S1=> 
                {
                    Month += DateTime.Parse(S1.处理完成时间.Trim()) - DateTime.Parse(S1.报警时间.Trim());
                });
                month += 1;
                //判断获取到的产量表
                Weeksurface[i].Name = date2.ToString("Y");
                //Weeksurface[i].Data = $"{(Month.Days<10?"0":Month.Days.ToString())}{Month.Days}:{(Month.Hours < 10 ? "0" : Month.Hours.ToString())}{Month.Hours}:{(Month.Minutes < 10 ? "0" : Month.Minutes.ToString())}{Month.Minutes}";
                Weeksurface[i].Data = Convert.ToInt32(Month.TotalMinutes);
            }
            //当月就显示当前最新的日期
            Weeksurface[6].Name = present.ToString("Y");

            return Weeksurface;
        }
        public static string Alarmcompletee()
        {
            List<object> tuples = new List<object>();
            using (UppercomputerEntities2 db = new UppercomputerEntities2())
            {
                var data = db.Alarmhistory.ToList();
                tuples.Add(new Tuple<List<Alarmchart>>(GetAlarmcharts(data, 7)));
                tuples.Add(new Tuple<List<Alarmchart>>(MonthData(data)));
                tuples.Add(new Tuple<List<AlarmDisposechart>>(GetAlarmDisposecharts(data, 7)));
                tuples.Add(new Tuple<List<AlarmDisposechart>>(MonthDisposeData(data)));
                return new JavaScriptSerializer().Serialize(tuples);
            }
        }

    }
    [Serializable]
    public class Alarmchart
    {
        /// <summary>
        /// 图表名称
        /// </summary>
        public string Name;
        /// <summary>
        /// 图表数据
        /// </summary>
        public int Data;
    }
    [Serializable]
    public class AlarmDisposechart
    {
        /// <summary>
        /// 图表名称
        /// </summary>
        public string Name;
        /// <summary>
        /// 图表数据
        /// </summary>
        public int Data;
    }
}