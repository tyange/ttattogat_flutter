import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEvent extends StatefulWidget {
  DateTime? preSelectedDate;
  final Function addNewDay;
  final Function addNewEvent;

  NewEvent({
    Key? key,
    required this.preSelectedDate,
    required this.addNewDay,
    required this.addNewEvent,
  }) : super(key: key);

  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    _selectedDate = widget.preSelectedDate;
    super.initState();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime(2100, 12, 31),
      initialDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = int.parse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        (widget.preSelectedDate == null && _selectedDate == null)) {
      return;
    }

    if (widget.preSelectedDate == null) {
      widget.addNewDay(enteredTitle, enteredAmount, _selectedDate);
      Navigator.of(context).pop();
      return;
    }

    widget.addNewEvent(enteredTitle, enteredAmount, widget.preSelectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "오늘은?"),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "사용한 금액"),
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              children: widget.preSelectedDate == null
                  ? <Widget>[
                      Expanded(
                        child: _selectedDate == null
                            ? const Text("날짜가 선택되지 않았습니다.")
                            : Text(
                                _selectedDate.toString(),
                              ),
                      ),
                      TextButton(
                        child: const Text("날짜 선택"),
                        onPressed: _presentDatePicker,
                      )
                    ]
                  : <Widget>[
                      Expanded(
                        child: Text(
                          DateFormat.yMd().format(widget.preSelectedDate!),
                        ),
                      )
                    ],
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text("이벤트 추가"),
            ),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
