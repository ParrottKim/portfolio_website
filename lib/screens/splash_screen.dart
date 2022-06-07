import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/polygon_progress_indicator.dart';
import 'package:portfolio_website/screens/main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List _images = [
    AssetImage('assets/images/profile_image.png'),
    AssetImage('assets/images/background1.jpg'),
    AssetImage('assets/images/background2.jpg'),
    AssetImage('assets/projects/ignite.png'),
    AssetImage('assets/projects/portfolio.png'),
    AssetImage('assets/projects/flutter_responsive_dashboard.png'),
    AssetImage('assets/projects/bluetooth_example.png'),
  ];

  Future<void> _loadImage(ImageProvider provider) {
    final config = ImageConfiguration(
      bundle: rootBundle,
      devicePixelRatio: 1,
      platform: defaultTargetPlatform,
    );
    final Completer<void> completer = Completer();
    final ImageStream stream = provider.resolve(config);

    late final ImageStreamListener listener;

    listener = ImageStreamListener((ImageInfo image, bool sync) {
      debugPrint("Image ${image.debugLabel} finished loading");
      completer.complete();
      stream.removeListener(listener);
    }, onError: (dynamic exception, StackTrace? stackTrace) {
      completer.complete();
      stream.removeListener(listener);
      FlutterError.reportError(FlutterErrorDetails(
        context: ErrorDescription('image failed to load'),
        library: 'image resource service',
        exception: exception,
        stack: stackTrace,
        silent: true,
      ));
    });

    stream.addListener(listener);
    return completer.future;
  }

  _preloading() async {
    for (var element in _images) {
      await _loadImage(element);
    }
    await Future.delayed(
      Duration(milliseconds: 2000),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MainScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _preloading();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Center(
        child: PolygonProgressIndicator(
          width: 60.0,
          height: 60.0,
          child: SvgPicture.asset(
            'assets/icons/parrot.svg',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
