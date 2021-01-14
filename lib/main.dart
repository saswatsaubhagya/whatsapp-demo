import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'WhatsApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  IconData _iconData = Icons.chat;

  //code for camera view
  Widget camera() {
    return Center(
      child: Image.network(
        "https://image.shutterstock.com/image-photo/portrait-orangutan-600w-355026734.jpg",
        fit: BoxFit.fill,
      ),
    );
  }

  //code for chat view
  Widget chat() {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                    "https://www.clipartmax.com/png/middle/296-2969961_no-image-user-profile-icon.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text("Name"),
                subtitle: Text("Hello all, i am a message."),
                trailing: Text("today"),
              );
            },
            itemCount: 20,
            separatorBuilder: (ctx, index) {
              return Divider();
            },
          ),
        )
      ],
    );
  }

  //code for status
  Widget status() {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Image.network(
                "https://www.clipartmax.com/png/middle/296-2969961_no-image-user-profile-icon.png"),
          ),
          title: Text("My Status"),
          subtitle: Text("Tap to add status update"),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("Recent Updates"),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                      "https://www.clipartmax.com/png/middle/296-2969961_no-image-user-profile-icon.png"),
                ),
                title: Text("Name"),
                subtitle: Text("32 minutes ago"),
              );
            },
            itemCount: 20,
            separatorBuilder: (ctx, index) {
              return Divider();
            },
          ),
        )
      ],
    );
  }

  //code for calls
  Widget calls() {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                      "https://www.clipartmax.com/png/middle/296-2969961_no-image-user-profile-icon.png"),
                ),
                title: Text("Name"),
                subtitle: Text("26 september, 12:45 pm"),
                trailing: Icon(
                  Icons.call,
                  color: Color(0xff128C7E),
                ),
              );
            },
            itemCount: 20,
            separatorBuilder: (ctx, index) {
              return Divider();
            },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff128C7E),
        title: Text(widget.title),
        centerTitle: false,
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            onTap: (value) {
              if (value == 1) {
                setState(() {
                  _iconData = Icons.chat;
                });
              } else if (value == 2) {
                setState(() {
                  _iconData = Icons.camera_alt;
                });
              } else if (value == 3) {
                setState(() {
                  _iconData = Icons.call;
                });
              }
            },
            tabs: [
              Tab(
                child: Icon(Icons.camera_alt),
              ),
              Tab(
                child: Text("CHATS"),
              ),
              Tab(
                child: Text("STATUS"),
              ),
              Tab(
                child: Text("CALLS"),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          //camera
          camera(),
          //chats
          chat(),
          //status
          status(),
          //calls
          calls(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(_iconData),
        backgroundColor: Color(0xff128C7E),
      ),
    );
  }
}
