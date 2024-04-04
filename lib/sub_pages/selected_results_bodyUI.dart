import 'package:flutter/material.dart';
import '../models/results.dart';
import '../pages/contestant_votes.dart';

class SelectedResultsBodyUI extends StatelessWidget {

  final Results results;
  const SelectedResultsBodyUI({Key? key,required this.results})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Row(
                children: [

                  SizedBox(
                    height: width * .32,
                    width: width * .32,
                    child: Card(
                      color: Colors.red,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:Column(
                        children: [
                          Text(
                            '${results.countVoters}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const Expanded(
                            child: Text(
                              'Voters',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  letterSpacing: 1
                              ),
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  SizedBox(
                    height: width * .32,
                    width: width * .32,
                    child: Card(
                      color: Colors.indigo,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:Column(
                        children: [
                          Text(
                            '${results.countContestants}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const Expanded(
                            child: Text(
                              'Contestants',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  letterSpacing: 1
                              ),
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  SizedBox(
                    height: width * .32,
                    width: width * .32,
                    child: Card(
                      color: const Color(0xff199A01),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:Column(
                        children: [
                          Text(
                            '${results.countCategoryTotalVotes}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const Expanded(
                            child: Text(
                              'Votes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  letterSpacing: 1
                              ),
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: ListView.builder(
                itemCount: results.displayContestants.length,
                itemBuilder: (BuildContext context, int index) {
                  return   GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  ContestantVotes(contestantId: results.displayContestants[index].id, totalVotes: results.countCategoryTotalVotes, contestantName: '${results.displayContestants[index].firstName} ${results.displayContestants[index].secondName} ${results.displayContestants[index].lastName}',)));
                    },
                    child: SizedBox(
                      height: height * .32,
                      child: Card(
                        color: const Color(0xffF2EEEE),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child:Column(

                          children: [

                            Column(
                              children: [
                                  Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(//10.0.2.2 emulator 192.168.0.36 device
                                        'http://10.0.2.2:8000/storage/${results.displayContestants[index].voterImage}'),
                                    radius: 65,
                                  ),
                                ),

                                Text(
                                 '${results.displayContestants[index].firstName} ${results.displayContestants[index].secondName} ${results.displayContestants[index].lastName}',
                                 style: const TextStyle(
                                     color: Colors.black,
                                     fontFamily: 'Poppins',
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold
                                 ),
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )
    );
  }
}
