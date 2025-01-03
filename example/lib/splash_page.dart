import 'package:flutter/material.dart';
import 'package:flutter_unionad/flutter_unionad.dart';
import 'package:flutter_unionad_example/TestCode.dart';

import 'TestPage.dart';

/// 描述：开屏广告页
/// @author guozi
/// @e-mail gstory0404@gmail.com
/// @time   2020/3/11

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _offstage = true;
  final GlobalKey<SplashAdViewState> _splashAdViewKey =
      GlobalKey<SplashAdViewState>();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    print("闪屏页面关闭");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          offstage: _offstage,
          child: FlutterUnionadSplashAdView(
            key: _splashAdViewKey,
            //android 开屏广告广告id 必填
            androidCodeId: TestCode.androidCodeId,
            //ios 开屏广告广告id 必填
            iosCodeId: TestCode.iosCodeId,
            //是否支持 DeepLink 选填
            supportDeepLink: true,
            // 期望view 宽度 dp 选填
            width: MediaQuery.of(context).size.width,
            //期望view高度 dp 选填
            height: MediaQuery.of(context).size.height - 100,
            //是否影藏跳过按钮(当影藏的时候显示自定义跳过按钮) 默认显示
            hideSkip: false,
            //超时时间
            timeout: 3500,
            callBack: FlutterUnionadSplashCallBack(
              onShow: () {
                print("开屏广告显示");
                setState(() => _offstage = false);
              },
              onClick: () {
                print("开屏广告点击");
              },
              onFail: (error) {
                print("开屏广告失败 $error");
                Navigator.pop(context);
              },
              onFinish: () {
                print("开屏广告倒计时结束");
                Navigator.pop(context);
              },
              onSkip: () {
                print("开屏广告跳过");
                // Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PageTest()),
                );
              },
              onTimeOut: () {
                print("开屏广告超时");
              },
            ),
          ),
        ),
        // Expanded(
        //   child: Container(
        //     color: Colors.red,
        //     alignment: Alignment.center,
        //     child: Text(
        //       "flutter_unionad",
        //       style: TextStyle(
        //         fontSize: 20,
        //         color: Colors.black,
        //         decoration: TextDecoration.none,
        //       ),
        //     ),
        //   ),
        // )
        Positioned(
          left: 0,
          bottom: 0,
          child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
          onTap: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PageTest()),
            );
            // _splashAdViewKey.currentState?.iosSendDispose();
          },
        ),),
      ],
    );
  }
}
