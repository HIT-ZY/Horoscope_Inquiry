import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import data_preferences from '@ohos.data.preferences';

@Entry
@Component

struct Login {
  @State private imageUrl: string = 'constellation.jpg';
  @State private username: string = '';
  @State private password: string = '';
  @State private title: string = '星座运势查询';
  @State private loginStr: string = '用户登录';
  @State private lastLogin: string = '';

  // 从首选项中获取上一次的登陆时间
  aboutToAppear(): void {
    let promise = data_preferences.getPreferences(getContext(), 'mystore');
    let preferences = null;
    promise.then((object) => {
      preferences = object;
      preferences.get('LOGIN_TIME', '2023-12-3 16:24:35')
        .then((value) => {
          this.lastLogin = value;
        });
    })
      .catch((err) => {
        console.info("Failed to get preferences. code = " + err.code + ", message = " + err.message);
      })
  }

  build() {
    Row() {
      Column() {
        Text(this.title)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
        Text(this.loginStr)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Green)
          .margin({top: 10})
        Image($rawfile(this.imageUrl))
          .width(300)
          .height(300)
          .margin({top: 20})
        Row() {
          Text('用户名')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Orange)
          TextInput({placeholder: '请输入用户名'})
            .fontSize(25)
            .width('60%')
            .onChange((value: string) => {
              this.username = value;
            })
        }.margin({top: 30})
        Row() {
          Text(' 密码  ')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Orange)
          TextInput({placeholder: '请输入密码'})
            .type(InputType.Password)
            .fontSize(25)
            .width('60%')
            .onChange((value: string) => {
              this.password = value;
            })
        }.margin({top: 20})
        Button('登录')
          .fontSize(30)
          .width(100)
          .height(50)
          .margin({top: 40})
          .onClick(() => {
            // 身份验证
            if(this.username == 'zhouyi' && this.password == '123456')
            {
              router.pushUrl({
                url: 'pages/Index',
                params: {
                  // 导出用户名参数
                  username: this.username
                }
              });
            }
            else
            {
              promptAction.showToast({
                message: '用户名或密码错误，请重新输入！',
                duration: 3000
              })
            }

            // 获取登录时间
            let loginTime: Date = new Date();
            let year: any = loginTime.getFullYear();
            let month: any = loginTime.getMonth() + 1;
            let date: any = loginTime.getDate();
            let hours: any = loginTime.getHours();
            let minutes: any = loginTime.getMinutes();
            let seconds: any = loginTime.getSeconds();
            let loginTimeStr: string = year + "-" + month + "-" + date + " "
            + hours + ":" + minutes + ":" + seconds;

            // 登陆时间写入首选项保存
            let preferences = null;
            let promise = data_preferences.getPreferences(getContext(), 'mystore');
            promise.then((object) => {
              preferences = object;
              console.info(loginTimeStr)
              preferences.put('LOGIN_TIME', loginTimeStr)
                .then(() => {
                  preferences.flush();
                })
                .catch((err) => {
                  console.info("Failed to put value. code = " + err.code + ", message = " + err.message);
                })
            })
              .catch((err) => {
                console.info("Failed to get preferences. code = " + err.code + ", message = " + err.message);
              })
          })

        Flex({justifyContent: FlexAlign.SpaceBetween})
        {
          Text('上次登录时间')
            .fontSize(15)
          Text(this.lastLogin)
            .fontSize(15)
            .fontColor(Color.Brown)
        }.margin({top: 50})
        .width('80%')
      }
      .width('100%')
    }
    .height('100%')
  }
}