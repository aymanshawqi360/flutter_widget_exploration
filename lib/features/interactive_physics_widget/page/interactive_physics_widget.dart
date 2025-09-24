import 'package:flutter/material.dart';
import 'package:flutter_widget_exploration/features/interactive_physics_widget/model/balls_model.dart';
import 'package:flutter_widget_exploration/features/interactive_physics_widget/widget/ball.dart';

class InteractivePhysicsWidget extends StatefulWidget {
  @override
  _InteractivePhysicsWidgetState createState() =>
      _InteractivePhysicsWidgetState();
}

class _InteractivePhysicsWidgetState extends State<InteractivePhysicsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Physics Widget'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: BallsModel.successMap.entries.map((entry) {
              return Draggable(
                data: entry.key,
                feedback: Ball(color: entry.key),
                childWhenDragging: Ball(color: entry.key.withOpacity(0.2)),
                child: Ball(color: entry.key),
              );
            }).toList(),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: BallsModel.successMap.entries.map((entry) {
              return DragTarget(
                onWillAccept: (data) => data == entry.key,
                onAccept: (data) {
                  setState(() {
                    BallsModel.successMap[entry.key] = true;
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: (BallsModel.successMap[entry.key] ?? false)
                          ? entry.key
                          : entry.key.withOpacity(0.3),
                      border: Border.all(color: entry.key, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
