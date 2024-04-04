import 'package:flutter/material.dart';
import 'package:ud_vote/pages/home.dart';
import 'dart:async';

class ConfirmedVote extends StatefulWidget {
  const ConfirmedVote({Key? key}) : super(key: key);

  @override
  State<ConfirmedVote> createState() => _ConfirmedVoteState();
}

class _ConfirmedVoteState extends State<ConfirmedVote> {

  void timer(){
    Timer(const Duration( seconds: 2),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home()));
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });

  }

  @override
  void initState(){
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
    backgroundColor: const Color(0xffFFFFFF),
      body: AlertDialog(
        elevation: 0,
        content: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/confirm.jpg',
                  height: width * .4,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Thanks for Voting!',
                  style: TextStyle(
                      color: Color(0xff199A01),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 24
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/emoj.png',
                  height: width * .2,
                ),
              )
            ],

          ),
        ),

      ),
    );
  }
}
