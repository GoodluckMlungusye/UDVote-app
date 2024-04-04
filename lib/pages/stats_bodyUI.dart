import 'package:flutter/material.dart';
import 'package:ud_vote/sub_pages/selected_stats.dart';
import '../models/stats.dart';

class StatsBodyUI extends StatelessWidget {

  final Years years;
  const StatsBodyUI({Key? key, required this.years,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              width: width,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/stats.jpg',

                      ),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.2),
                        ]
                    )
                ),
                child: const Center(
                  child: Text(
                    "Previous stats",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              ),
              itemCount: years.getYears.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectedStats(year: years.getYears[index])));
                  },
                  child: SizedBox(
                    child: Card(
                      color: const Color(0xffF2EEEE),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:Center(
                        child: Text(
                          '${years.getYears[index]}',
                          style: const TextStyle(
                              color: Colors.indigo,
                              fontFamily: 'Poppins',
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 10
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
