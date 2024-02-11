import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }
  onHeartPressed(){
    final now = DateTime.now();
      //dialog
      showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: Colors.white,
                height: 300,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  maximumDate: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      selectedDate = newDateTime;
                    },
                    );
                  },
                )
            ),
          );
        },
      );
    }
}


class _TopPart extends StatelessWidget{
  final DateTime selectedDate;
  final VoidCallback onPressed;
  _TopPart({required this.selectedDate, super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final ThemeData theme = Theme.of(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('U&I',
            style: theme.textTheme.displayLarge,),
          Column(
            children: [
              Text('우리처음만난날',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 30,
                ),
              ),
              Text('${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 20,
                ),
              ),
            ],
          ),
          IconButton(
            iconSize: 60,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text('D+${DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ).difference(selectedDate).inDays+1}',
            style: theme.textTheme.displayMedium,),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.png'));
  }
}
