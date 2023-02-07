import 'package:chat_demo/chat_details.dart';
import 'package:chat_demo/users_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  String? title;
  HomePage({super.key, this.title});

  List<ChatUsers> chatUsers = [
    ChatUsers(id: 1,name: "Jane Russel", messageText: "Awesome Setup for single and grouped chat for users to use", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "Now", isMessageRead: false,isOnline: true),
    ChatUsers(id: 2,name: "Glady's Murphy", messageText: "That's Great", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "Yesterday", isMessageRead: false,isOnline: false),
    ChatUsers(id: 3,name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "31 Mar", isMessageRead: false,isOnline: false),
    ChatUsers(id: 4,name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "28 Mar", isMessageRead: false,isOnline: true),
    ChatUsers(id: 5,name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "23 Mar", isMessageRead: false,isOnline: false),
    ChatUsers(id: 6,name: "Jacob Pena", messageText: "will update you in evening", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "17 Mar", isMessageRead: false,isOnline: false),
    ChatUsers(id: 7,name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "24 Feb", isMessageRead: false,isOnline: false),
    ChatUsers(id: 8,name: "John Wick", messageText: "How are you?", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "18 Feb", isMessageRead: false,isOnline: false),
    ChatUsers(id: 9,name: "Jane Russel", messageText: "Awesome Setup for single and grouped chat for users to use", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "Now", isMessageRead: false,isOnline: false),
    ChatUsers(id: 10,name: "Glady's Murphy", messageText: "That's Great", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "Yesterday", isMessageRead: false,isOnline: false),
    ChatUsers(id: 11,name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "31 Mar", isMessageRead: false,isOnline: false),
    ChatUsers(id: 12,name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "28 Mar", isMessageRead: false,isOnline: false),
    ChatUsers(id: 13,name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "23 Mar", isMessageRead: false,isOnline: false),
    ChatUsers(id: 14,name: "Jacob Pena", messageText: "will update you in evening", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "17 Mar", isMessageRead: false,isOnline: false),
    ChatUsers(id: 15,name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "24 Feb", isMessageRead: false,isOnline: false),
    ChatUsers(id: 16,name: "John Wick", messageText: "How are you?", imageURL: "https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette.png", time: "18 Feb", isMessageRead: false,isOnline: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.grey),
        automaticallyImplyLeading: true,
        title:Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search,color: Colors.grey,size: 30,)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline,color: Colors.grey,size: 30,)),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ListView.builder(
          itemCount: chatUsers.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 16),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return ConversationList(
              user: chatUsers[index],
            );
          },
        ),
      ),

    );
  }
}



class ConversationList extends StatefulWidget{
  ChatUsers?user;
  ConversationList({super.key, required this.user,});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetails(userData: widget.user),));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            widget.user!.isOnline==true?
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(Icons.circle,color: Colors.green,size: 10,),
            ):
            SizedBox(width: 10,),
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user!.imageURL),
              maxRadius: 25,
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(widget.user!.name, style: TextStyle(fontSize: 16),),
                        Spacer(),
                        Text(widget.user!.time,style: TextStyle(fontSize: 12,fontWeight: widget.user!.isMessageRead?FontWeight.bold:FontWeight.normal),),
                        Icon(Icons.arrow_forward_ios,size: 16,color: Colors.grey,),
                      ],
                    ),
                    SizedBox(height: 6,),
                    Text(widget.user!.messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: widget.user!.isMessageRead?FontWeight.bold:FontWeight.normal),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

