import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/components/ConfirmedVote.dart';
import '../models/contestant.dart';
import 'package:video_player/video_player.dart';
import '../providers/auth_service.dart';
import '../providers/voter_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chewie/chewie.dart';

class SelectedContestantBodyUI extends StatefulWidget {

  final CategoryContestants selectedContestant;
  const SelectedContestantBodyUI({Key? key,required this.selectedContestant}) : super(key: key);

  @override
  State<SelectedContestantBodyUI> createState() => _SelectedContestantBodyUIState();
}

class _SelectedContestantBodyUIState extends State<SelectedContestantBodyUI> {


  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  late Future<void> _initializedVideoPlayerFuture;
  bool isPlaying = false;
  bool isMuted = false;

  @override
  void initState(){//10.0.2.2 emulator 192.168.0.36 device
    _controller = VideoPlayerController.network("http://10.0.2.2:8000/api/video?video_url=${widget.selectedContestant.categoryContestants[0].videoUrl}");
    _initializedVideoPlayerFuture = _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
    );
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final voterProvider = Provider.of<VoterProvider>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [

          FutureBuilder(
              future: _initializedVideoPlayerFuture,
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.done){

                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  );

                }else{
                  return Container(
                    height: 200,
                    color: Colors.black,
                    margin: const EdgeInsets.only(top: 30),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }
          ),


          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'vote for'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),

          ),

          Text(
            '${widget.selectedContestant.categoryContestants[0].firstName} . ${widget.selectedContestant.categoryContestants[0].secondName} . ${widget.selectedContestant.categoryContestants[0].lastName}',
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),

          const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Color(0xff868282),
            height: 0,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'from'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),

          ),

          Text(
            widget.selectedContestant.categoryContestants[0].college.collegeName.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),

          const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Color(0xff868282),
            height: 0,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'as'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),

          ),

           Text(
            widget.selectedContestant.categoryContestants[0].categoryName,
             style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),

          const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Color(0xff868282),
            height: 0,
          ),

          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'tap the voting icon to vote',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.download_sharp,
                  color: Colors.red,
                )
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              setState(() {
                _controller.pause();
              });
              confirmVote(context,'${widget.selectedContestant.categoryContestants[0].firstName} . ${widget.selectedContestant.categoryContestants[0].secondName} . ${widget.selectedContestant.categoryContestants[0].lastName}',widget.selectedContestant.categoryContestants[0].categoryName,voterProvider.voter_id!,widget.selectedContestant.categoryContestants[0].voterId,widget.selectedContestant.categoryContestants[0].categoryId,voterProvider.categoryIds,voterProvider.addCategoryId);
            },
            child: const Icon(
              Icons.how_to_vote,
              color: Colors.indigo,
              size: 90,
            ),
          )

        ],
      ),
    );
  }
}


void confirmVote(BuildContext context,String contestantName,String categoryName,int voterId, int contestantId,int categoryId,List<int> categoryIds, Function addCategoryId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Confirm Your Vote Now!",
          textAlign: TextAlign.center,
        ),

        content:  Text(
          "Do you want to vote for $contestantName as $categoryName? ",
          textAlign: TextAlign.center,
        ),

        actions: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed: () async{

                      var data = {
                        'voter_id': voterId,
                        'contestant_id': contestantId,
                        'category_id' : categoryId
                      };

                      var response = await Authenticate().postData(data, 'vote');
                      var body = json.decode(response.body);
                      if(body['success']){
                        addCategoryId(categoryId);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ConfirmedVote()));
                      }else{
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                            msg: body['errorMessage'],
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.grey,
                          textColor: Colors.black,
                          fontSize: 12
                        );
                      }

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff199A01),
                        elevation: 0,
                        side: const BorderSide(
                            width: 1,
                            color: Colors.white
                        ),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'confirm'.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    )
                ),
              ),

              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 0,
                      side: const BorderSide(
                          width: 1,
                          color: Colors.white
                      ),

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'abort'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      );
    },
  );
}

