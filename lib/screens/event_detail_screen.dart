import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/event.dart';

class EventDetailScreen extends StatefulWidget {
  static const routeName = '/event-detail';

  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  bool _isEditing = false;
  final _form = GlobalKey<FormState>();

  var _isInit = true;

  Event? _event;

  void _convertEditMode() {
    setState(() {
      _isEditing = true;
    });
  }

  void _cancelEditMode() {
    setState(() {
      _isEditing = false;
    });
  }

  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }

    _form.currentState!.save();
    // print(_event!.title);
    // print(_event!.amount);
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _event = ModalRoute.of(context)?.settings.arguments as Event;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Event Detail",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  DateFormat.yMd().format(_event!.date),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                !_isEditing
                    ? ElevatedButton(
                        onPressed: _convertEditMode,
                        child: const Text("수정하기"),
                      )
                    : ElevatedButton(
                        onPressed: _cancelEditMode,
                        child: const Text("취소"),
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).errorColor,
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 50),
            !_isEditing
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "이미지를 추가해보세요.",
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(_event!.title),
                      const SizedBox(height: 50),
                      Text(
                        '₩ ${_event!.amount.toString()}',
                      ),
                    ],
                  )
                : Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(
                                    200,
                                    50,
                                  )),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text("터치해서 이미지 업로드"),
                                      Icon(Icons.add)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue: _event!.title,
                          decoration:
                              const InputDecoration(labelText: "간단한 설명"),
                          maxLines: 2,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide a value.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _event = Event(
                              id: _event!.date.toString(),
                              title: value!,
                              amount: _event!.amount,
                              date: _event!.date,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _event!.amount.toString(),
                          decoration:
                              const InputDecoration(labelText: "사용한 금액"),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide a value.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _event = Event(
                              id: _event!.date.toString(),
                              title: _event!.title,
                              amount: int.parse(value!),
                              date: _event!.date,
                            );
                          },
                          onFieldSubmitted: (_) => {_saveForm()},
                        ),
                      ],
                    )),
          ],
        ),
      ),
    );
  }
}
