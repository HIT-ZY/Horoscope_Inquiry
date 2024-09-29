import router from '@ohos.router';

@Entry
@Component
struct Today {
  private lucky_time: string = router.getParams()['lucky_time'];
  private lucky_color: string = router.getParams()['lucky_color'];
  private lucky_num: string = router.getParams()['lucky_num'];
  private grxz: string = router.getParams()['grxz'];
  private day_notice: string = router.getParams()['day_notice'];
  private zonghe_star: string = router.getParams()['zonghe_star'];
  private zonghe_content: string = router.getParams()['zonghe_content'];
  private caiyun_star: string = router.getParams()['caiyun_star'];
  private caiyun_content: string = router.getParams()['caiyun_content'];
  private aiqing_star: string = router.getParams()['aiqing_star'];
  private aiqing_content: string = router.getParams()['aiqing_content'];

  @State title: string = '今日运势';

  build() {
    Row() {
      Column() {
        Text(this.title)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('幸运时间')
            .fontSize(32)
          Text(this.lucky_time)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('幸运颜色')
            .fontSize(32)
          Text(this.lucky_color)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('幸运数')
            .fontSize(32)
          Text(this.lucky_num)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('贵人星座')
            .fontSize(32)
          Text(this.grxz)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('综合')
            .fontSize(32)
          Text(this.zonghe_star + "/5")
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('财运')
            .fontSize(32)
          Text(this.caiyun_star + "/5")
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('爱情')
            .fontSize(32)
          Text(this.aiqing_star + "/5")
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('建议')
            .fontSize(32)
            .width('30%')
        }.margin({top: 20})
        .width('90%')

        Text(this.day_notice)
          .fontSize(20)
          .fontColor(Color.Brown)
          .width('90%')
          .margin({top: 10})
      }
      .width('100%')
    }
    .height('100%')
  }
}