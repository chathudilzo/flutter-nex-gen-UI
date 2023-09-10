import 'package:flutter/material.dart';

import '../assets.dart';
import '../styles.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  final _finalReceiveLightAmt=0.7;
  final _finalEmitLightAmt=0.5;


  @override
  Widget build(BuildContext context) {
    final orbColor = AppColors.orbColors[0];              // Add this final variable
    final emitColor = AppColors.emitColors[0]; 

    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            /// Bg-Base
            Image.asset(AssetPaths.titleBgBase),

            /// Bg-Receive
            _LitImage(color: orbColor, imgSrc: AssetPaths.titleBgReceive, lightAmt: _finalReceiveLightAmt),

            /// Mg-Base
            _LitImage(color: orbColor, imgSrc: AssetPaths.titleMgBase, lightAmt: _finalReceiveLightAmt),

            /// Mg-Receive
           _LitImage(                                    // Modify from here...
              imgSrc: AssetPaths.titleMgReceive,
              color: orbColor,
              lightAmt: _finalReceiveLightAmt,
            ),   

           /// Mg-Emit
            _LitImage(                                    // Modify from here...
              imgSrc: AssetPaths.titleMgEmit,
              color: emitColor,
              lightAmt: _finalEmitLightAmt,
            ),          

            /// Fg-Rocks
            Image.asset(AssetPaths.titleFgBase),

            /// Fg-Receive
            _LitImage(                                    // Modify from here...
              imgSrc: AssetPaths.titleFgReceive,
              color: orbColor,
              lightAmt: _finalReceiveLightAmt,
            ),  

            /// Fg-Emit
            /// Fg-Emit
            _LitImage(                                    // Modify from here...
              imgSrc: AssetPaths.titleFgEmit,
              color: emitColor,
              lightAmt: _finalEmitLightAmt,
            ),    

          ],
        ),
      ),
    );
  }
}

class _LitImage extends StatelessWidget {
   _LitImage({required this.color,required this.imgSrc,required this.lightAmt});
final Color color;
final String imgSrc;
final double lightAmt;


  @override
  Widget build(BuildContext context) {
    final hsl = HSLColor.fromColor(color);
    return Image.asset(
      imgSrc,
      color: hsl.withLightness(hsl.lightness * lightAmt).toColor(),
      colorBlendMode: BlendMode.modulate,
    );
  }
}