import router from '@ohos.router';

@Entry
@Component
struct ThisYear {
  private time: string = router.getParams()['time'];
  private oneword: string = router.getParams()['oneword'];
  private general_index: string = router.getParams()['general_index'];
  private general_txt: string = router.getParams()['general_txt'];
  private health_txt: string = router.getParams()['health_txt'];
  private love_index: string = router.getParams()['love_index'];
  private love_txt: string = router.getParams()['love_txt'];
  private money_index: string = router.getParams()['money_index'];
  private money_txt: string = router.getParams()['money_txt'];
  private work_index: string = router.getParams()['work_index'];
  private work_txt: string = router.getParams()['work_txt'];

  @State title: string = '本年运势';

  build() {
    Row() {
      Column() {
        Text(this.title)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('年份')
            .fontSize(32)
          Text(this.time)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('综合')
            .fontSize(32)
          Text(this.general_index)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('爱情')
            .fontSize(32)
          Text(this.love_index)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('财富')
            .fontSize(32)
          Text(this.money_index)
            .fontSize(32)
            .fontColor(Color.Brown)
        }.margin({top: 20})
        .width('90%')

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('工作')
            .fontSize(32)
          Text(this.work_index)
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
        Text(this.oneword)
          .fontSize(20)
          .fontColor(Color.Brown)
          .width('90%')
      }
      .width('100%')
    }
    .height('100%')
  }
}