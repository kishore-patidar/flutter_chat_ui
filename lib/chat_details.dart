import 'package:bubble/bubble.dart';
import 'package:chat_demo/message_model.dart';
import 'package:chat_demo/users_model.dart';
import 'package:flutter/material.dart';

class ChatDetails extends StatefulWidget {
  ChatUsers?userData;
  ChatDetails({Key? key, required this.userData}) : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  List<ChatMessage> messages = [
    ChatMessage(id: 1,userId: 1,messageContent: "Hello", messageType: "text",time: '07-02-2023 12:30 PM'),
    ChatMessage(id: 2,userId: 1,messageContent: "How have you been?", messageType: "text",time: '07-02-2023 12:31 PM'),
    ChatMessage(id: 3,userId: 2,messageContent: "Hey, I am doing fine dude. wbu?", messageType: "text",time: '07-02-2023 12:32 PM'),
    ChatMessage(id: 4,userId: 1,messageContent: "ehhhh, doing OK.", messageType: "text",time: '07-02-2023 12:33 PM'),
    ChatMessage(id: 5,userId: 2,messageContent: "Is there any thing wrong?", messageType: "text",time: '07-02-2023 12:34 PM'),
    ChatMessage(id: 6,userId: 1,messageContent: "https://thumbs.dreamstime.com/b/udaipur-city-palace-19276061.jpg", messageType: "text",time: '07-02-2023 12:34 PM'),
    ChatMessage(id: 7,userId: 2,messageContent: "https://media.istockphoto.com/id/943758518/photo/rajwada-palace-indore.jpg?s=612x612&w=0&k=20&c=qsvHCeh2i27b39AupBpAtDF4JB_AJA0LpNkk5IXbvyg=", messageType: "file",time: '07-02-2023 12:34 PM'),
    ChatMessage(id: 8,userId: 1,messageContent: "https://thumbs.dreamstime.com/b/ancient-rajwada-indore-night-lights-royal-palace-decoration-statue-sculpture-ahilya-bai-holkar-also-seen-40777212.jpg", messageType: "file",time: '07-02-2023 12:34 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.grey),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.grey,size: 24,)),
        centerTitle: true,
        toolbarHeight: 70,
        title: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.userData!.imageURL),
              maxRadius: 20,
            ),
            Text(widget.userData!.name,style: const TextStyle(color: Colors.black54,fontSize: 14),),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline,color: Colors.grey,size: 24,)),
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10,bottom: 50),
        physics: const ScrollPhysics(),
        itemBuilder: (context, index){
          var data = messages[index];
          return CustomBubbleChat(
            message: data.messageContent,
            isMe: data.userId == widget.userData!.id?true:false,
            msgType: data.messageType,
            time: data.time,
            img: widget.userData!.imageURL,
            senderName: '',
            // img: data.sender == widget.ConvRes!.sender?widget.ConvRes!.senderImage!:widget.ConvRes!.receiverImage!,
          );
          // return Container(
          //   padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
          //   child: Align(
          //     alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20),
          //         color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
          //       ),
          //       padding: EdgeInsets.all(16),
          //       child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
          //     ),
          //   ),
          // );
        },
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(right: 10),
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.black12),
            // borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                // width: size.width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5,color:Colors.black54),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: TextFormField(
                    // focusNode: _focusNode,
                    // controller: _message,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: -10),
                      border: InputBorder.none,
                      hintText: "Message..",
                      hintStyle:TextStyle(fontSize: 14),
                      suffixIcon:
                      InkWell(
                          onTap: () {

                          },
                          child: Icon(Icons.send,color: Colors.grey,size: 25,)),
                    ),
                  ),
                ),

              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                },
                icon: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              child:  Icon(Icons.attach_file,size: 25,color: Colors.grey,),
              onTap: (){

              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBubbleChat extends StatelessWidget {
  final bool isMe;
  final String message;
  final String time;
  final String img;
  final String msgType;
  final String senderName;
  const CustomBubbleChat(
      {Key? key, required this.isMe, required this.message, required this.time, required this.img,required this.msgType, required this.senderName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isMe==true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Bubble(
              margin: const BubbleEdges.only(right: 10, bottom: 8),
              nip: BubbleNip.rightBottom,
              color:  Colors.green,
              padding: msgType=="text"? const BubbleEdges.all(10):const BubbleEdges.all(0),
              radius: const Radius.circular(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text(senderName, style: TextStyle(fontSize: 14, color: THEME_COLOR,)),
                  msgType=="text"? Text(message, style: const TextStyle(fontSize: 18, color: Colors.white,)):
                  Container(
                    height: 280,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: NetworkImage(message),fit: BoxFit.cover)
                    ),
                    child: InkWell(
                      onTap:(){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => imageDetial(url: message.toString()),));
                      },
                      // child: Image.network(message.toString())
                    ),
                  ),
                  // SizedBox(height: 3,),
                  // Text(time,style: TextStyle(fontSize: 10, color: Colors.black.withOpacity(0.4)),),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Bubble(
              margin: const BubbleEdges.only(left: 10, bottom: 8),
              nip: BubbleNip.leftBottom,
              color: Colors.grey[200],
              padding: msgType=="text"? const BubbleEdges.all(10):const BubbleEdges.all(0),
              radius: const Radius.circular(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(senderName, style: TextStyle(fontSize: 14, color: Colors.black,)),
                  msgType=="text"? Text(message, style: const TextStyle(fontSize: 18, color: Colors.black,)):
                  Container(
                    height: 280,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: NetworkImage(message),fit: BoxFit.cover)
                    ),
                    child: InkWell(
                      onTap:(){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => imageDetial(url: message.toString()),));
                      },
                      // child: Image.network(message.toString())
                    ),
                  ),
                  // SizedBox(height: 3,),
                  // Text(time, style: TextStyle(fontSize: 10, color: Colors.black.withOpacity(0.4))),
                ],
              ),
            ),
          )
        ],
      );
    }
  }
}