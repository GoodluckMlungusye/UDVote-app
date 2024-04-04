import 'package:flutter/material.dart';
import '../models/motivator.dart';

class ExploreBodyUI extends StatelessWidget {

  final Motivators motivators;

  const ExploreBodyUI({Key? key,required this.motivators}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            SizedBox(
              height: height,
              child: Column(
                children: [
                  Image.asset('assets/images/explore.jpg'),
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
                decoration:  const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children:  [
                      Expanded(
                        child: ListView.builder(
                                  itemCount: motivators.motivators.length,
                                  itemBuilder: ((context,index)=>  Card(
                                    color: const Color(0xffF2EEEE),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child:Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(70),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 7,
                                                )
                                            ),
                                            child: CircleAvatar(//10.0.2.2 emulator 192.168.0.36 device
                                              backgroundImage: NetworkImage('http://10.0.2.2:8000/storage/${motivators.motivators[index].motivatorImage}'),
                                              radius: 60,
                                            ),
                                          ),
                                        ),

                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.format_quote)
                                          ],
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 2,right: 2),
                                          child: Text(
                                            motivators.motivators[index].quote,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontStyle: FontStyle.italic
                                            ),
                                          ),
                                        ),

                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.format_quote)
                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              'assets/images/line.png',
                                              width: 50,
                                              height: 10,
                                            ),

                                            Text(
                                              motivators.motivators[index].motivatorName,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),
                                              textAlign: TextAlign.center,
                                            ),


                                            Image.asset(
                                              'assets/images/line.png',
                                              width: 50,
                                              height: 10,
                                            )
                                          ],
                                        )

                                      ],
                                    ),
                                  )
                                  )),
                      )
                    ],
                  ),
                ),

              ),
            ),

          ],
        ),

      ),
    );
  }
}
