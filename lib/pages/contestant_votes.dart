import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ud_vote/providers/results_provider.dart';
import 'package:provider/provider.dart';

class ContestantVotes extends StatefulWidget {

  final String contestantName;
  final int totalVotes;
  final int contestantId;
  const ContestantVotes({Key? key,required this.contestantId, required this.totalVotes,required this.contestantName}) : super(key: key);

  @override
  State<ContestantVotes> createState() => _ContestantVotesState();
}

class _ContestantVotesState extends State<ContestantVotes> {

  @override
  void initState(){
    final resultsProvider = Provider.of<ResultsProvider>(context, listen: false);
    resultsProvider.getVotes(widget.contestantId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final resultsProvider = Provider.of<ResultsProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contestantName),
        elevation: 0.0,
        centerTitle: true
      ),

      body: SizedBox(
        height: height,
        width: width,
        child: Card(
          elevation: 0.0,
          color: const Color(0xffF2EEEE),
          child: Padding(
            padding:  EdgeInsets.only(top: height*.1),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: height*.2,
                      width: width*.4,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.green
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Obtained',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '${resultsProvider.votes.countContestantVotes}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 35
                              ),
                            ),

                            const Expanded(
                              child: Text(
                                'Votes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
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
                    Container(
                      height: height*.2,
                      width: width*.4,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.red
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Out of',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '${widget.totalVotes}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                 fontSize: 35,
                              ),
                            ),

                            const Expanded(
                              child: Text(
                                'Votes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
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
                const SizedBox(height: 60),
                CircularPercentIndicator(
                  radius: 80,
                  animation: true,
                  animationDuration: 1000,
                  lineWidth: 8,
                  percent: widget.totalVotes == 0? 0 : resultsProvider.votes.countContestantVotes/widget.totalVotes,
                  backgroundColor: const Color(0xffC9DBFF),
                  progressColor: Colors.indigo,
                  center: widget.totalVotes == 0? const Text(
                    '0%',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18
                    ),
                  )
                      :
                  Text(
                    '${((resultsProvider.votes.countContestantVotes/widget.totalVotes)*100).ceil()}%',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18
                    ),
                  ),

                ),

                const SizedBox(height: 60),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              width: 1,
                              color: Colors.white
                          ),

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'back'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
