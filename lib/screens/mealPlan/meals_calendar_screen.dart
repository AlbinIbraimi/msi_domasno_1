import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:domasna_1/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MealsCalendar extends StatefulWidget {
  const MealsCalendar({super.key});

  @override
  State<MealsCalendar> createState() => _MealsCalendarState();
}

class _MealsCalendarState extends State<MealsCalendar> {
  DateTime _selectedDate = DateTime.now();
  bool inProgress = true;

  DateTime normalizedDate(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var storage = context.read<ApplicationProvider>();
      storage.mealPlan.clear();
      storage.fetchMealPlan().then((_) => {inProgress = false});
    });
  }

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<ApplicationProvider>(context);
    final eventDates = storage.mealPlan.keys
        .map((item) => MarkedDate(
              date: normalizedDate(item),
              color: Colors.red,
            ))
        .toList();

    return Scaffold(
      body: inProgress
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CalendarCarousel(
                      onDayPressed: (DateTime date, List events) {
                        setState(() {
                          _selectedDate = date;
                          var normalized = normalizedDate(date);

                          if (storage.mealPlan.containsKey(normalized)) {
                            var meals = storage.mealPlan[normalized];
                            Navigator.pushNamed(context, '/planedMeals',
                                arguments: meals);
                          }
                        });
                      },
                      thisMonthDayBorderColor: Colors.transparent,
                      selectedDayButtonColor: Colors.grey,
                      todayBorderColor: Colors.blue,
                      todayButtonColor: Colors.blueAccent,
                      multipleMarkedDates: MultipleMarkedDates(
                        markedDates: eventDates,
                      ),
                      markedDateShowIcon: true,
                      markedDateIconMaxShown: 1,
                      markedDateIconBuilder: (event) {
                        return const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 12.0,
                        );
                      },
                      selectedDateTime: _selectedDate,
                      daysHaveCircularBorder: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        storage.mealPlan.isEmpty
                            ? Text("No meals in calendar")
                            : Text("")
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
