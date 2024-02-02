import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../flutter_fortune_wheel.dart';

class FortuneWheelHistoryPage extends StatefulWidget {
  const FortuneWheelHistoryPage({Key? key, required this.resultsHistory})
      : super(key: key);

  final List<Fortune> resultsHistory;

  @override
  _FortuneWheelHistoryPageState createState() =>
      _FortuneWheelHistoryPageState();
}

class _FortuneWheelHistoryPageState extends State<FortuneWheelHistoryPage> {
  late TextEditingController _titleSpinButtonController;

  @override
  void initState() {
    super.initState();
    _titleSpinButtonController = TextEditingController();
  }

  @override
  void dispose() {
    _titleSpinButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spin history')),
      body: ListView.separated(
        itemCount: widget.resultsHistory.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          DateTime now = DateTime.now();
          String formattedDateTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '--Result ${index + 1}--',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Time: $formattedDateTime',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'Title: ${_titleSpinButtonController.text}',
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    (widget.resultsHistory[index].titleName?.replaceAll('\n', '') ?? ''),
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: widget.resultsHistory[index].icon ?? const SizedBox(),
                  ),
                ],
              ),
              const Divider(),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
