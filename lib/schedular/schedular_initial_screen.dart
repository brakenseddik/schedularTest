import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/schedular/schedule_dummy.dart';
import 'package:untitled2/schedular/widgets/schedule_calendar.dart';

class SchedularInitialScreen extends StatefulWidget {
  const SchedularInitialScreen({Key? key}) : super(key: key);

  @override
  State<SchedularInitialScreen> createState() => _SchedularInitialScreenState();
}

class _SchedularInitialScreenState extends State<SchedularInitialScreen> {
  String? _hour, _minute;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 00);
  TimeOfDay selectedTime2 = const TimeOfDay(hour: 10, minute: 00);
  late DateTimeRange dataRange;
  late TextEditingController _dateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  bool isDone = false;

  @override
  void initState() {
    _dateController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();

    _dateController.text = DateFormat.yMd().format(selectedDate);

    _startTimeController.text = DateFormat.Hm().format(DateTime.now());
    _endTimeController.text =
        DateFormat.Hm().format(DateTime.now().add(const Duration(hours: 2)));
    selectedTime = TimeOfDay.now();
    final d = DateTime.now().add(const Duration(hours: 2));
    selectedTime2 = TimeOfDay(hour: d.hour, minute: d.minute);
    super.initState();
  }

  // final List<Meeting> meetings = <Meeting>[];

  @override
  Widget build(BuildContext context) {
    final allTimes = usersSchedule
        .expand((element) => element.allAvailableTimes)
        .toSet()
        .toList();
    allTimes.sort(
      (a, b) => a.start.compareTo(b.start),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        // mainAxisSize: MainAxisSize.max,
        // controller: widget.scrollController,
        children: [
          SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'When are you free?',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          SizedBox(
              height: 400,
              child: ScheduleCalendar(data: usersSchedule, allTimes: allTimes)),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  // Future showDialogue(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text(
  //             'Add your availability',
  //             style: TextStyle(
  //                 color: Constants.primaryColor,
  //                 fontSize: 22,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           content: Column(mainAxisSize: MainAxisSize.min, children: [
  //             CustomTextField(
  //               label: 'Date',
  //               icon: CupertinoIcons.calendar,
  //               controller: _dateController,
  //               readOnly: true,
  //               onTap: () async {
  //                 if (Theme.of(context).platform == TargetPlatform.iOS) {
  //                   await showCupertinoModalPopup(
  //                       context: context,
  //                       builder: (context) {
  //                         return Container(
  //                           height: 200,
  //                           width: double.infinity,
  //                           color: Colors.white,
  //                           child: CupertinoDatePicker(
  //                               minimumDate: DateTime(2000),
  //                               maximumDate: DateTime(2200),
  //                               initialDateTime: DateTime.now(),
  //                               mode: CupertinoDatePickerMode.date,
  //                               onDateTimeChanged: (value) {
  //                                 setState(() {
  //                                   selectedDate = value;
  //                                   _dateController.text =
  //                                       DateFormat.yMd().format(selectedDate);
  //                                 });
  //                               }),
  //                         );
  //                       });
  //                 } else {
  //                   final date = await DateService.selectDate(
  //                     context,
  //                     selectedDate,
  //                   );
  //                   if (date != null) {
  //                     setState(() {
  //                       selectedDate = date;
  //                       _dateController.text =
  //                           DateFormat.yMd().format(selectedDate);
  //                     });
  //                   }
  //                 }
  //               },
  //             ),
  //             CustomTextField(
  //               label: 'Start Time',
  //               icon: CupertinoIcons.time,
  //               controller: _startTimeController,
  //               readOnly: true,
  //               onTap: () async {
  //                 if (Theme.of(context).platform == TargetPlatform.iOS) {
  //                   await showCupertinoModalPopup(
  //                       context: context,
  //                       builder: (context) {
  //                         return Container(
  //                           height: 200,
  //                           width: double.infinity,
  //                           color: Colors.white,
  //                           child: CupertinoDatePicker(
  //                               minimumDate: DateTime(2000),
  //                               maximumDate: DateTime(2200),
  //                               initialDateTime: DateTime.now(),
  //                               mode: CupertinoDatePickerMode.time,
  //                               use24hFormat: true,
  //                               onDateTimeChanged: (value) {
  //                                 setState(() {
  //                                   selectedTime = TimeOfDay(
  //                                       hour: value.hour, minute: value.minute);
  //                                   _hour = selectedTime.hour.toString();
  //                                   _minute = selectedTime.minute.toString();
  //                                   final t = DateTime(2019, 08, 1,
  //                                       selectedTime.hour, selectedTime.minute);
  //                                   _startTimeController.text =
  //                                       DateFormat.Hm().format(t);
  //                                 });
  //                               }),
  //                         );
  //                       });
  //                 } else {
  //                   final time = await DateService.selectTime(
  //                     context,
  //                     selectedTime,
  //                   );
  //                   if (time != null) {
  //                     setState(() {
  //                       selectedTime = time;
  //                       _hour = selectedTime.hour.toString();
  //                       _minute = selectedTime.minute.toString();
  //                       final t = DateTime(2019, 08, 1, selectedTime.hour,
  //                           selectedTime.minute);
  //                       _startTimeController.text = DateFormat.Hm().format(t);
  //                     });
  //                   }
  //                 }
  //               },
  //             ),
  //             CustomTextField(
  //               label: 'End Time',
  //               icon: CupertinoIcons.time,
  //               controller: _endTimeController,
  //               readOnly: true,
  //               onTap: () async {
  //                 if (Theme.of(context).platform == TargetPlatform.iOS) {
  //                   await showCupertinoModalPopup(
  //                       context: context,
  //                       builder: (context) {
  //                         return Container(
  //                           height: 200,
  //                           width: double.infinity,
  //                           color: Colors.white,
  //                           child: CupertinoDatePicker(
  //                             minimumDate: DateTime(2000),
  //                             maximumDate: DateTime(2200),
  //                             initialDateTime: DateTime.now(),
  //                             mode: CupertinoDatePickerMode.time,
  //                             use24hFormat: true,
  //                             onDateTimeChanged: (value) {
  //                               setState(() {
  //                                 selectedTime2 = TimeOfDay(
  //                                     hour: value.hour, minute: value.minute);
  //                                 _hour = selectedTime2.hour.toString();
  //                                 _minute = selectedTime2.minute.toString();
  //                                 final t = DateTime(2019, 08, 1,
  //                                     selectedTime2.hour, selectedTime2.minute);
  //                                 _endTimeController.text =
  //                                     DateFormat.Hm().format(t);
  //                               });
  //                             },
  //                           ),
  //                         );
  //                       });
  //                 } else {
  //                   final time =
  //                       await DateService.selectTime(context, selectedTime2);
  //                   if (time != null) {
  //                     setState(() {
  //                       selectedTime2 = time;
  //                       _hour = selectedTime2.hour.toString();
  //                       _minute = selectedTime2.minute.toString();
  //                       final t = DateTime(2019, 08, 1, selectedTime2.hour,
  //                           selectedTime2.minute);
  //                       _endTimeController.text = DateFormat.Hm().format(t);
  //                     });
  //                   }
  //                 }
  //               },
  //             ),
  //           ]),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text(
  //                   'Exit',
  //                   style: TextStyle(color: Colors.grey),
  //                 )),
  //             TextButton(
  //                 onPressed: () {
  //                   if (getTimeDifference(selectedTime, selectedTime2)) {
  //                     setState(() {
  //                       meetings.add(Meeting(
  //                           '',
  //                           selectedDate.copyWith(
  //                               hour: selectedTime.hour,
  //                               minute: selectedTime.minute),
  //                           selectedDate.copyWith(
  //                               hour: selectedTime2.hour,
  //                               minute: selectedTime2.minute),
  //                           Constants.primaryColor,
  //                           false));
  //                     });
  //
  //                     // _dateController.clear();
  //                     // _startTimeController.clear();
  //                     // _endTimeController.clear();
  //                   }
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text('Save')),
  //           ],
  //         );
  //       });
  // }
}
