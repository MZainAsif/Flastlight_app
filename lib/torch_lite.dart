import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class TorchLite extends StatefulWidget {
  const TorchLite({super.key});

  @override
  State<TorchLite> createState() => _TorchLiteState();
}

class _TorchLiteState extends State<TorchLite> {
  final bgColor = const Color(0xff2C3333);
  final textColor = const Color(0xffE7F6F2);
  var isActive = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Torch Lite',
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                8,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      isActive ? 'assets/torch_on.png' : 'assets/torch_off.png',
                      height: 300,
                      width: 300,
                      color: isActive ? null : textColor.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    CircleAvatar(
                      minRadius: 30,
                      maxRadius: 45,
                      child: Transform.scale(
                        scale: 1.5,
                        child: IconButton(
                          onPressed: () {
                            controller.toggle();
                            isActive = !isActive;
                            setState(() {});
                            // ignore: avoid_print
                            print('Congratulations');
                          },
                          icon: const Icon(
                            Icons.power_settings_new,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          10.heightBox,
          Text(
            'Developed by Zain',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
