import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ud_vote/models/stats.dart';


class SelectedStatsBodyUI extends StatelessWidget {

  final CollegeInfo collegeInfo;
  const SelectedStatsBodyUI({Key? key, required this.collegeInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView.builder(
        itemCount: collegeInfo.collegeStats.length,
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.indigo
                  ),
                  color: const Color(0xffF2EEEE)
              ),
              child: Column(
                children: [
                  Stack(
                    children: [

                      Image.network('http://10.0.2.2:8000/storage/${collegeInfo.collegeStats[index].college.collegeImage}'),

                      Positioned(
                        top: 10,
                        right: 20,
                        child: Container(
                          width: width * .3,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  colors: [
                                    Colors.black.withOpacity(.7),
                                    Colors.black.withOpacity(.5),
                                  ]
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20))

                          ),
                          child: Center(
                            child: Text(
                              collegeInfo.collegeStats[index].college.collegeName.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              const Text(
                                'Students Registered:',
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),

                              Text(
                                '${collegeInfo.collegeStats[index].registeredStudents}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),

                          const Divider(
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                            color: Color(0xffF2EEEE),
                            height: 0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              const Text(
                                'Total Voters:',
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),

                              Text(
                                '${collegeInfo.collegeStats[index].universalContestants}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),

                          const Divider(
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                            color: Color(0xffF2EEEE),
                            height: 0,
                          ),

                          const Divider(
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                            color: Color(0xffF2EEEE),
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 8,bottom: 4),
                    child: Text(
                      'Total Participation',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),

                  ),

                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircularPercentIndicator(
                        radius: 40,
                        animation: true,
                        animationDuration: 1000,
                        lineWidth: 10,
                        percent: collegeInfo.collegeStats[index].universalContestants/collegeInfo.collegeStats[index].registeredStudents,
                        backgroundColor: const Color(0xffC9DBFF),
                        progressColor: Colors.indigo,
                        center: Text(
                          '${((collegeInfo.collegeStats[index].universalContestants/collegeInfo.collegeStats[index].registeredStudents) *100).ceil()}%',
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
