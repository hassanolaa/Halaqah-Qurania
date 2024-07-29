import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/features/Navi/ui/screen/navi.dart';
import 'features/Auth/ui/screens/signup.dart';
import 'features/Home/ui/screens/Home.dart';
import 'features/UserInfo/ui/screens/userInfo.dart';
import 'features/videocall/ui/screens/videoSdk/Screens/joinMeeting.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async{
  runApp(
    DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
       locale: Locale('en'),
     // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
        home:FirebaseAuth.instance.currentUser== null ?SignUp(): navi(),
    //   home:JoinScreen()
      ),
    );
  }
}

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
