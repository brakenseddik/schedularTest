import 'package:flutter/material.dart';
import 'package:untitled2/schedular/schedule_dummy.dart';
import 'package:untitled2/schedular/widgets/calendar_date_card.dart';
import 'package:untitled2/schedular/widgets/calendar_user_card.dart';
import 'package:untitled2/schedular/widgets/calendar_user_option.dart';

class ScheduleCalendar extends StatefulWidget {
  final List<UserModel> data;
  final List allTimes;

  const ScheduleCalendar({Key? key, required this.data, required this.allTimes})
      : super(key: key);

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  bool isSelected = false;
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;

  final DateTime now = DateTime.now();
  int selectedIndex = -1;

  @override
  void initState() {
    // Init controllers
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();
    // Animate controllers

    // //Controller 1
    _scrollController1.addListener(() {
      _scrollController2.animateTo(_scrollController1.offset,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    });
    _scrollController2.addListener(() {
      _scrollController1.animateTo(_scrollController2.offset,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: (widget.data.length * 60) + 200,
        decoration: const BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
              width: 140,
              child: Column(
                children: [
                  const SizedBox(
                      height: 70,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Available options',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ))),
                  Expanded(
                      child: ListView.builder(
                    controller: _scrollController1,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (_, i) {
                      return CalendarUserCard(id: widget.data[i].id.toString());
                    },
                    itemCount: widget.data.length,
                  )),
                  const SizedBox(
                      width: 140,
                      height: 60,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Participants',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ))),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 140,
                height: (widget.data.length * 60),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemExtent: 165,
                        itemBuilder: (_, index) {
                          return CalendarDateCard(now: now);
                        },
                        itemCount: 20,
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      controller: _scrollController2,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (_, i) {
                        return SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemExtent: 165,
                            itemBuilder: (_, index) {
                              return const UserOption();
                            },
                            itemCount: 20,
                          ),
                        );
                      },
                      itemCount: widget.data.length,
                    )),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemExtent: 165,
                        itemBuilder: (_, index) {
                          return Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.pink.shade200,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: const Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          );
                        },
                        itemCount: 20,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
