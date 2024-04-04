import 'package:flutter/material.dart';
import 'package:ud_vote/sub_pages/selected_contestant.dart';
import '../models/contestant.dart';

class ContestantBodyUI extends StatelessWidget {

  final CategoryContestants categoryContestants;
  const ContestantBodyUI({Key? key, required this.categoryContestants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: height,
          child: Column(
            children: [
              Image.asset(
                'assets/images/candidate.png',
              ),
              Container(
                color: Colors.indigo,
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
            child: Container(
                height: height * .66,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(children: [
                      const Text(
                        'Select Contestant',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        thickness: 1.5,
                        indent: 120,
                        endIndent: 120,
                        color: Colors.indigo,
                        height: 9,
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 4,
                            ),
                            itemCount: categoryContestants.categoryContestants.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                           SelectedContestant(selectedContestantName: '${categoryContestants.categoryContestants[index].firstName} . ${categoryContestants.categoryContestants[index].secondName} . ${categoryContestants.categoryContestants[index].lastName}', selectedContestantNumber: categoryContestants.categoryContestants[index].registrationNumber,)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.indigo),
                                        color: const Color(0xffF2EEEE)),
                                    child: Column(
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.only(top: 30),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 5,
                                                )
                                            ),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(//10.0.2.2 emulator 192.168.0.36 device
                                                  'http://10.0.2.2:8000/storage/${categoryContestants.categoryContestants[index].voterImage}'),
                                              radius: 70,
                                            ),
                                          ),
                                        ),

                                         Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Text(
                                            '${categoryContestants.categoryContestants[index].firstName} . ${categoryContestants.categoryContestants[index].secondName} . ${categoryContestants.categoryContestants[index].lastName}',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(left: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.format_quote,
                                                size: 12,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 2, right: 2),
                                          child: Text(
                                            categoryContestants.categoryContestants[index].slogan,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontStyle: FontStyle.italic,
                                              fontSize: 13
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.format_quote,
                                                size: 12,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ]))))
      ]),
    );
  }
}
