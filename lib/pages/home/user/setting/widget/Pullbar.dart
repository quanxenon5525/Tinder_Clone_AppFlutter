import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MySliderApp extends StatelessWidget {
 

 



  int _value = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Slider Demo'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.volume_up,
                        size: 40,
                      ),
                      new Expanded(
                          child: Slider(
                            value: _value.toDouble(),
                            min: 1.0,
                            max: 20.0,
                            divisions: 10,
                            activeColor: Colors.pinkAccent,
                            inactiveColor: Colors.grey,
                            
                            onChanged: (double newValue) {
                              
                              },
                              semanticFormatterCallback: (double newValue) {
                                return '${newValue.round()} dollars';
                              }
                            )
                      ),
                    ]
                )
            ),
          )
      );
  }
}
