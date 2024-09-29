import router from '@ohos.router';

@Entry
@Component
struct ThisMonth {
  private grxz: string = router.getParams()['grxz'];
  private zonghe_star: string = router.getParams()['zonghe_star'];
  private zonghe_content: string = router.getParams()['zonghe_content'];
  private caiyun_star: string = router.getParams()['caiyun_star'];
  private caiyun_content: string = router.getParams()['caiyun_content'];
  private aiqing_star: string = router.getParams()['aiqing_star'];
  private aiqing_content: string = router.getParams()['aiqing_content'];

  @State title: string = '本月运势';

  build() {
    Row() {
      Column() {
        Text(this.title)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

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
      }
      .width('100%')
    }
    .height('100%')
  }
}