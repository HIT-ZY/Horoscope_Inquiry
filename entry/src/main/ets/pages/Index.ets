import router from '@ohos.router';
import http from '@ohos.net.http';

@Entry
@Component

struct Index {
  private username: string = router.getParams()['username'];
  private selectedDate: Date = new Date('2023-12-01');   // 出生日期选择
  
  @State message: string = 'Hello, ';   // 欢迎词
  @State keyname: string = '' // 密钥
  @State code: string = '';             // API星座代表
  @State getYear: number = 0;           // 获取年
  @State getMonth: number = 0;          // 获取月
  @State getDay: number = 0;            // 获取日
  @State date: string = '';             // 日期
  @State nowdate: string = '';          // 当前日期
  @State star: string = '';             // 星座

  // 今日运势
  @State today_lucky_time: string = '';
  @State today_lucky_color: string = '';
  @State today_lucky_num: string = '';
  @State today_grxz: string = '';
  @State today_day_notice: string = '';
  @State today_zonghe_star: string = '';
  @State today_zonghe_content: string = '';
  @State today_caiyun_star: string = '';
  @State today_caiyun_content: string = '';
  @State today_aiqing_star: string = '';
  @State today_aiqing_content: string = '';

  // 明日运势
  @State tomorrow_lucky_time: string = '';
  @State tomorrow_lucky_color: string = '';
  @State tomorrow_lucky_num: string = '';
  @State tomorrow_grxz: string = '';
  @State tomorrow_day_notice: string = '';
  @State tomorrow_zonghe_star: string = '';
  @State tomorrow_zonghe_content: string = '';
  @State tomorrow_caiyun_star: string = '';
  @State tomorrow_caiyun_content: string = '';
  @State tomorrow_aiqing_star: string = '';
  @State tomorrow_aiqing_content: string = '';

  // 本周运势
  @State thisweek_lucky_color: string = '';
  @State thisweek_lucky_num: string = '';
  @State thisweek_lucky_day: string = '';
  @State thisweek_grxz: string = '';
  @State thisweek_week_notice: string = '';
  @State thisweek_zonghe_star: string = '';
  @State thisweek_zonghe_content: string = '';
  @State thisweek_caiyun_star: string = '';
  @State thisweek_caiyun_content: string = '';
  @State thisweek_aiqing_star: string = '';
  @State thisweek_aiqing_content: string = '';

  // 本月运势
  @State thismonth_grxz: string = '';
  @State thismonth_zonghe_star: string = '';
  @State thismonth_zonghe_content: string = '';
  @State thismonth_caiyun_star: string = '';
  @State thismonth_caiyun_content: string = '';
  @State thismonth_aiqing_star: string = '';
  @State thismonth_aiqing_content: string = '';

  // 本年运势
  @State thisyear_time: string = '';
  @State thisyear_oneword: string = '';
  @State thisyear_general_index: string = '';
  @State thisyear_general_txt: string = '';
  @State thisyear_health_txt: string = '';
  @State thisyear_love_index: string = '';
  @State thisyear_love_txt: string = '';
  @State thisyear_money_index: string = '';
  @State thisyear_money_txt: string = '';
  @State thisyear_work_index: string = '';
  @State thisyear_work_txt: string = '';

  build() {
    Row() {
      Column() {
        Text(this.message + this.username)
          .fontSize(50)
          .fontColor(Color.Brown)
          .fontWeight(FontWeight.Bold)

        Row() {
          Button('请选择出生日期')
            .fontSize(30)
            .width(300)
            .height(50)
            .onClick(() => {
              DatePickerDialog.show({
                start: new Date('1900-01-01'),
                end: new Date('2023-12-31'),
                selected: this.selectedDate,
                lunar: false,
                onAccept: (value: DatePickerResult) => {
                  this.selectedDate.setFullYear(value.year, value.month, value.day);
                  console.info("onAccept" + JSON.stringify(value));
                  this.getYear = value.year;
                  this.getMonth = value.month + 1;
                  this.getDay = value.day;
                  this.date = this.getYear.toString() + '-' + this.getMonth.toString() + '-' + this.getDay.toString();

                  // 根据出生日期计算星座

                  /*101=白羊座
                     102=金牛座
                     103=双子座
                     104=巨蟹座
                     105=狮子座
                     106=处女座
                     107=天秤座
                     108=天蝎座
                     109=射手座
                     110=魔羯座
                     111=水瓶座
                     112=双鱼座*/

                  switch (this.getMonth) {
                    case 1: //1月星座
                      if (this.getDay <= 19) {
                        this.code = '110';
                        this.star = '魔羯座';
                      }
                      else if (this.getDay >= 20 && this.getDay <= 31) {
                        this.code = '111';
                        this.star = '水瓶座';
                      }
                      break;
                    case 2: //2月星座
                      if (this.getDay <= 18) {
                        this.code = '111';
                        this.star = '水瓶座';
                      }
                      else if (this.getDay >= 18 && this.getDay <= 29) {
                        this.code = '112';
                        this.star = '双鱼座';
                      }
                      break;
                    case 3: //3月星座
                      if (this.getDay <= 20) {
                        this.code = '112';
                        this.star = '双鱼座';
                      }
                      else if (this.getDay >= 21 && this.getDay <= 31) {
                        this.code = '101';
                        this.star = '白羊座';
                      }
                      break;
                    case 4: //4月星座
                      if (this.getDay <= 19) {
                        this.code = '101';
                        this.star = '白羊座';
                      }
                      else if (this.getDay >= 20 && this.getDay <= 30) {
                        this.code = '102';
                        this.star = '金牛座';
                      }
                      break;
                    case 5: //5月星座
                      if (this.getDay <= 20) {
                        this.code = '102';
                        this.star = '金牛座';
                      }
                      else if (this.getDay >= 21 && this.getDay <= 31) {
                        this.code = '103';
                        this.star = '双子座';
                      }
                      break;
                    case 6: //6月星座
                      if (this.getDay <= 21) {
                        this.code = '103';
                        this.star = '双子座';
                      }
                      else if (this.getDay >= 22 && this.getDay <= 30) {
                        this.code = '104';
                        this.star = '巨蟹座';
                      }
                      break;
                    case 7: //7月星座
                      if (this.getDay <= 22) {
                        this.code = '104';
                        this.star = '巨蟹座';
                      }
                      else if (this.getDay >= 23 && this.getDay <= 31) {
                        this.code = '105';
                        this.star = '狮子座';
                      }
                      break;
                    case 8: //8月星座
                      if (this.getDay <= 22) {
                        this.code = '105';
                        this.star = '狮子座';
                      }
                      else if (this.getDay >= 23 && this.getDay <= 31) {
                        this.code = '106';
                        this.star = '处女座';
                      }
                      break;
                    case 9: //9月星座
                      if (this.getDay <= 22) {
                        this.code = '106';
                        this.star = '处女座';
                      }
                      else if (this.getDay >= 23 && this.getDay <= 30) {
                        this.code = '107';
                        this.star = '天秤座';
                      }
                      break;
                    case 10: //10月星座
                      if (this.getDay <= 23) {
                        this.code = '107';
                        this.star = '天秤座';
                      }
                      else if (this.getDay >= 24 && this.getDay <= 31) {
                        this.code = '108';
                        this.star = '天蝎座';
                      }
                      break;
                    case 11: //11月星座
                      if (this.getDay <= 22) {
                        this.code = '108';
                        this.star = '天蝎座';
                      }
                      else if (this.getDay >= 23 && this.getDay <= 30) {
                        this.code = '109';
                        this.star = '射手座';
                      }
                      break;
                    case 12: //12月星座
                      if (this.getDay <= 21) {
                        this.code = '109';
                        this.star = '射手座';
                      }
                      else if (this.getDay >= 22 && this.getDay <= 31) {
                        this.code = '110';
                        this.star = '魔羯座';
                      }
                      break;
                  }

                  // 读取网络数据
                  let httpRequest = http.createHttp();
                  httpRequest.request(
                    `https://qqlykm.cn/api/xingzuo/get?code=${this.code}&key=${this.keyname}`,
                    (err, data) => {
                      if (!err) {
                        // 导入网络数据
                        let t: any = JSON.parse(data.result.toString());
                        this.nowdate = t.data.date;

                        // 今日运势
                        this.today_lucky_time = t.data.today.lucky_time;
                        this.today_lucky_color = t.data.today.lucky_color;
                        this.today_lucky_num = t.data.today.lucky_num;
                        this.today_grxz = t.data.today.grxz;
                        this.today_day_notice = t.data.today.day_notice;
                        this.today_zonghe_star = t.data.today.exponents.zonghe.star;
                        this.today_zonghe_content = t.data.today.exponents.zonghe.content;
                        this.today_caiyun_star = t.data.today.exponents.caiyun.star;
                        this.today_caiyun_content = t.data.today.exponents.caiyun.content;
                        this.today_aiqing_star = t.data.today.exponents.aiqing.star;
                        this.today_aiqing_content = t.data.today.exponents.aiqing.content;

                        // 明日运势
                        this.tomorrow_lucky_time = t.data.tomorrow.lucky_time;
                        this.tomorrow_lucky_color = t.data.tomorrow.lucky_color;
                        this.tomorrow_lucky_num = t.data.tomorrow.lucky_num;
                        this.tomorrow_grxz = t.data.tomorrow.grxz;
                        this.tomorrow_day_notice = t.data.tomorrow.day_notice;
                        this.tomorrow_zonghe_star = t.data.tomorrow.exponents.zonghe.star;
                        this.tomorrow_zonghe_content = t.data.tomorrow.exponents.zonghe.content;
                        this.tomorrow_caiyun_star = t.data.tomorrow.exponents.caiyun.star;
                        this.tomorrow_caiyun_content = t.data.tomorrow.exponents.caiyun.content;
                        this.tomorrow_aiqing_star = t.data.tomorrow.exponents.aiqing.star;
                        this.tomorrow_aiqing_content = t.data.tomorrow.exponents.aiqing.content;

                        // 本周运势
                        this.thisweek_lucky_color = t.data.this_week.lucky_color;
                        this.thisweek_lucky_num = t.data.this_week.lucky_num;
                        this.thisweek_lucky_day = t.data.this_week.lucky_day;
                        this.thisweek_grxz = t.data.this_week.grxz;
                        this.thisweek_week_notice = t.data.this_week.week_notice;
                        this.thisweek_zonghe_star = t.data.this_week.exponents.zonghe.star;
                        this.thisweek_zonghe_content = t.data.this_week.exponents.zonghe.content;
                        this.thisweek_caiyun_star = t.data.this_week.exponents.caiyun.star;
                        this.thisweek_caiyun_content = t.data.this_week.exponents.caiyun.content;
                        this.thisweek_aiqing_star = t.data.this_week.exponents.aiqing.star;
                        this.thisweek_aiqing_content = t.data.this_week.exponents.aiqing.content;

                        // 本月运势
                        this.thismonth_grxz = t.data.this_month.grxz;
                        this.thismonth_zonghe_star = t.data.this_month.exponents.zonghe.star;
                        this.thismonth_zonghe_content = t.data.this_month.exponents.zonghe.content;
                        this.thismonth_caiyun_star = t.data.this_month.exponents.caiyun.star;
                        this.thismonth_caiyun_content = t.data.this_month.exponents.caiyun.content;
                        this.thismonth_aiqing_star = t.data.this_month.exponents.aiqing.star;
                        this.thismonth_aiqing_content = t.data.this_month.exponents.aiqing.content;

                        // 本年运势
                        this.thisyear_time = t.data.this_year.time;
                        this.thisyear_oneword = t.data.this_year.oneword;
                        this.thisyear_general_index = t.data.this_year.general.general_index;
                        this.thisyear_general_txt = t.data.this_year.general.general_txt;
                        this.thisyear_health_txt = t.data.this_year.health.health_txt;
                        this.thisyear_love_index = t.data.this_year.love.love_index;
                        this.thisyear_love_txt = t.data.this_year.love.love_txt;
                        this.thisyear_money_index = t.data.this_year.money.money_index;
                        this.thisyear_money_txt = t.data.this_year.money.money_txt;
                        this.thisyear_work_index = t.data.this_year.work.work_index;
                        this.thisyear_work_txt = t.data.this_year.work.work_txt;
                      }
                      else {
                        console.info("Error！");
                      }
                    }
                  );

                },
                onCancel: () => {
                  console.info("onCancel");
                },
                onChange: (value: DatePickerResult) => {
                  console.info("onChange" + JSON.stringify(value));
                }
              })
            })
        }.margin({top: 30})

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('出生日期')
            .fontSize(32)
          Text(this.date)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 30})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('当前日期')
            .fontSize(32)
          Text(this.nowdate)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 10})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('星座')
            .fontSize(32)
          Text(this.star)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 10})
        .width('90%')

        Button('查看今日运势')
          .fontSize(30)
          .width(300)
          .height(50)
          .margin({top: 30})
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Today',
              params: {
                // 导出今日参数
                lucky_time: this.today_lucky_time,
                lucky_color: this.today_lucky_color,
                lucky_num: this.today_lucky_num,
                grxz: this.today_grxz,
                day_notice: this.today_day_notice,
                zonghe_star: this.today_zonghe_star,
                zonghe_content: this.today_zonghe_content,
                caiyun_star: this.today_caiyun_star,
                caiyun_content: this.today_caiyun_content,
                aiqing_star: this.today_aiqing_star,
                aiqing_content: this.today_aiqing_content,
              }
            });
          })

        Button('查看明日运势')
          .fontSize(30)
          .width(300)
          .height(50)
          .margin({top: 30})
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Tomorrow',
              params: {
                // 导出明日参数
                lucky_time: this.tomorrow_lucky_time,
                lucky_color: this.tomorrow_lucky_color,
                lucky_num: this.tomorrow_lucky_num,
                grxz: this.tomorrow_grxz,
                day_notice: this.tomorrow_day_notice,
                zonghe_star: this.tomorrow_zonghe_star,
                zonghe_content: this.tomorrow_zonghe_content,
                caiyun_star: this.tomorrow_caiyun_star,
                caiyun_content: this.tomorrow_caiyun_content,
                aiqing_star: this.tomorrow_aiqing_star,
                aiqing_content: this.tomorrow_aiqing_content,
              }
            });
          })

        Button('查看本周运势')
          .fontSize(30)
          .width(300)
          .height(50)
          .margin({top: 30})
          .onClick(() => {
            router.pushUrl({
              url: 'pages/ThisWeek',
              params: {
                // 导出本周参数
                lucky_color: this.thisweek_lucky_color,
                lucky_num: this.thisweek_lucky_num,
                lucky_day: this.thisweek_lucky_day,
                grxz: this.thisweek_grxz,
                week_notice: this.thisweek_week_notice,
                zonghe_star: this.thisweek_zonghe_star,
                zonghe_content: this.thisweek_zonghe_content,
                caiyun_star: this.thisweek_caiyun_star,
                caiyun_content: this.thisweek_caiyun_content,
                aiqing_star: this.thisweek_aiqing_star,
                aiqing_content: this.thisweek_aiqing_content,
              }
            });
          })

        Button('查看本月运势')
          .fontSize(30)
          .width(300)
          .height(50)
          .margin({top: 30})
          .onClick(() => {
            router.pushUrl({
              url: 'pages/ThisMonth',
              params: {
                // 导出本月参数
                grxz: this.thismonth_grxz,
                zonghe_star: this.thismonth_zonghe_star,
                zonghe_content: this.thismonth_zonghe_content,
                caiyun_star: this.thismonth_caiyun_star,
                caiyun_content: this.thismonth_caiyun_content,
                aiqing_star: this.thismonth_aiqing_star,
                aiqing_content: this.thismonth_aiqing_content,
              }
            });
          })

        Button('查看本年运势')
          .fontSize(30)
          .width(300)
          .height(50)
          .margin({top: 30})
          .onClick(() => {
            router.pushUrl({
              url: 'pages/ThisYear',
              params: {
                // 导出本年参数
                time: this.thisyear_time,
                oneword: this.thisyear_oneword,
                general_index: this.thisyear_general_index,
                general_txt: this.thisyear_general_txt,
                health_txt: this.thisyear_health_txt,
                love_index: this.thisyear_love_index,
                love_txt: this.thisyear_love_txt,
                money_index: this.thisyear_money_index,
                money_txt: this.thisyear_money_txt,
                work_index: this.thisyear_work_index,
                work_txt: this.thisyear_work_txt,
              }
            });
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}