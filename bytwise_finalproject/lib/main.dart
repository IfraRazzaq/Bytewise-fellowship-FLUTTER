import 'package:bytwise_finalproject/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/cupertino.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(WhatsAppCloneApp());
}

class WhatsAppCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   final List<TabData> tabs = [
//     TabData(title: 'Chats'),
//     TabData(title: 'Status'),
//     TabData(title: 'Calls'),
//   ];

class GroupModel extends ChangeNotifier {
  List<String> chatList = [
    'Group A',
    'Group B',
    'Group C',
    // Add more chat groups as per your requirement
  ];

  void createGroup(String groupName) {
    chatList.insert(0, groupName);
    notifyListeners();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TabData> tabs = [
    TabData(title: 'Chats'),
    TabData(title: 'Status'),
    TabData(title: 'Calls'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          title: Text('WhatsApp'),
          bottom: TabBar(
            tabs: tabs.map((tab) {
              return Tab(
                text: tab.title,
              );
            }).toList(),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                // Handle camera icon press
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search icon press
              },
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('New group'),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('New broadcast'),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text('Linked devices'),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text('Starred messages'),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text('Settings'),
                    value: 5,
                  ),
                ];
              },
              onSelected: (value) {
                // Handle menu item selection
                switch (value) {
                  case 1:
                  // Handle "New group" selection
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateGroupScreen(),
                      ),
                    );
                    break;
                  case 2:
                  // Handle "New broadcast" selection
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BroadcastScreen()),
                    );
                    break;
                  case 3:
                  // Handle "Linked devices" selection
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LinkedDeviceScreen()),
                );
                    break;
                  case 4:
                  // Handle "Starred messages" selection
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StarredMessagesScreen()),
                    );
                    break;
                  case 5:
                  // Handle "Settings" selection
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                    break;
                }
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  ChatListScreen(),
                  StatusScreen(),
                  CallLogScreen(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.chat),
        ),
      ),
    );
  }
}

class TabData {
  final String title;

  TabData({required this.title});
}

class ChatListScreen extends StatelessWidget {
  final List<String> chatList = [
    'John Doe',
    'Jane Smith',
    'David Johnson',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(chatList[index][0]),
          ),
          title: Text(chatList[index]),
          subtitle: Text('Last message'),
          trailing: Text('12:30 PM'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(recipientName: chatList[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String recipientName;

  const ChatScreen({required this.recipientName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = [];

  void sendMessage(String message) {
    setState(() {
      messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Text(widget.recipientName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        sendMessage(value);
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = '';
                    // Get the message from the TextField
                    if (message.isNotEmpty) {
                      sendMessage(message);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {
                    // Implement file attachment functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<String> statuses = [
    'Status 1',
    'Status 2',
    'Status 3'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statuses.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.add),
            ),
            title: Text('Add My Status'),
            onTap: () {
              // Implement add status functionality
            },
          );
        } else {
          final statusIndex = index - 1;
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
            title: Text(statuses[statusIndex]),
            subtitle: Text('Tap to view status'),
            onTap: () {
              // Implement status viewing functionality
            },
          );
        }
      },
    );
  }
}

class CallLogScreen extends StatelessWidget {
  final List<CallLog> callLogs = [
    CallLog('John Doe', CallType.incoming),
    CallLog('Jane Smith', CallType.outgoing),
    CallLog('David Johnson', CallType.missed),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callLogs.length,
      itemBuilder: (context, index) {
        final callLog = callLogs[index];
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.account_circle),
          ),
          title: Text(callLog.name),
          subtitle: Row(
            children: [
              _getArrowIcon(callLog.type),
              SizedBox(width: 4),
              Text(callLog.typeToString()),
            ],
          ),
          onTap: () {
            // Implement call log details functionality
          },
        );
      },
    );
  }

  Widget _getArrowIcon(CallType type) {
    IconData iconData;
    Color color;
    double rotation;
    switch (type) {
      case CallType.incoming:
        iconData = Icons.arrow_back;
        color = Colors.green;
        rotation = -45.0;
        break;
      case CallType.outgoing:
        iconData = Icons.arrow_forward;
        color = Colors.green;
        rotation = 45.0;
        break;
      case CallType.missed:
        iconData = Icons.arrow_forward;
        color = Colors.red;
        rotation = 45.0;
        break;
      default:
        iconData = Icons.arrow_forward;
        color = Colors.grey;
        rotation = 45.0;
    }
    return Transform.rotate(
      angle: rotation * 3.14159 / 180, // Convert degrees to radians
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}

enum CallType {
  incoming,
  outgoing,
  missed,
}

class CallLog {
  final String name;
  final CallType type;

  CallLog(this.name, this.type);

  String typeToString() {
    switch (type) {
      case CallType.incoming:
        return 'Incoming';
      case CallType.outgoing:
        return 'Outgoing';
      case CallType.missed:
        return 'Missed';
      default:
        return '';
    }
  }
}

class CreateGroupScreen extends StatefulWidget {
  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  List<String> selectedContacts = [];
  TextEditingController groupNameController = TextEditingController();

  void selectContact(String contact) {
    setState(() {
      if (selectedContacts.contains(contact)) {
        selectedContacts.remove(contact);
      } else {
        selectedContacts.add(contact);
      }
    });
  }

  void createGroup() {
    // Implement the logic to create a group with selectedContacts and groupName
    String groupName = groupNameController.text;
    setState(() {
      selectedContacts.clear();
      groupNameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Create Group'),
    ),
    body: Column(
    children: [
    TextField(
    controller: groupNameController,
    decoration: InputDecoration(
    labelText: 'Group Name',
    ),
    ),
    ElevatedButton(
    onPressed: createGroup,
    child: Text('Create Group'),
    ),
    Text('Selected Contacts:'),
    Expanded(
    child: ListView.builder(
    itemCount: selectedContacts.length,
    itemBuilder: (context, index) {
    return ListTile(
      title: Text(selectedContacts[index]),
    );
    },
    ),
    ),
        ElevatedButton(
        onPressed: () {
      // Navigating to the screen where contacts can be selected
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectContactsScreen(
            onSelect: selectContact,
          ),
        ),
      );
    },
    child: Text('Add Contacts'),
        ),
    ],
    ),
    );
  }
}

class CreateGroup extends StatelessWidget {
  final TextEditingController groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Group'),
        ),
        body: Consumer<GroupModel>(
        builder: (context, groupModel, child) {
      return Column(
          children: [
          TextField(
          controller: groupNameController,
          decoration: InputDecoration(
          labelText: 'Group Name',
      ),
          ),
            ElevatedButton(
              onPressed: () {
                String groupName = groupNameController.text;
                // Access the group model and call the createGroup method
                groupModel.createGroup(groupName);
                Navigator.pop(context);
              },
              child: Text('Create Group'),
            ),
          ],
      );
        },
        ),
    );
  }
}

class SelectContactsScreen extends StatelessWidget {
  final Function(String) onSelect;

  SelectContactsScreen({required this.onSelect});

  // Assume you have a list of contacts
  List<String> contacts = [
    "Frank",
    "Grace",
    "Henry",
    "Isabel",
    "Jack",
    "Karen",
    "Linda",
    "Mike",
    "Nancy",
    "Oliver",
    "Pamela",
    "Quincy",
    "Rachel",
    "Steve",
    "Tina",
    "Uma",
    "Victor",
    "Wendy",
  // Add more contacts as per your requirement
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Select Contacts'),
    ),
    body: ListView.builder(
    itemCount: contacts.length,
    itemBuilder: (context, index) {
    final contact = contacts[index];
    return ListTile(
    title: Text(contact),
    onTap: () {
    // Pass the selected contact back to the previous screen
    onSelect(contact);
    Navigator.pop(context);
    },
    );
    },
    ),
    );
  }
}

class BroadcastScreen extends StatefulWidget {
  @override
  _BroadcastScreenState createState() => _BroadcastScreenState();
}

class _BroadcastScreenState extends State<BroadcastScreen> {
  List<String> contacts = [
    "Grace",
    "Henry",
    "Isabel",
    "Jack",
    "Karen",
    "Linda",
    "Mike",
    "Nancy",
    "Oliver",
    "Pamela",
    // Add more contacts as needed
  ];

  List<String> selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Broadcast Screen'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(contacts[index]),
            value: selectedContacts.contains(contacts[index]),
            onChanged: (value) {
              setState(() {
                if (value!) {
                  selectedContacts.add(contacts[index]);
                } else {
                  selectedContacts.remove(contacts[index]);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          // Handle the send button press
          // You can use the selectedContacts list to send the broadcast message
        },
      ),
    );
  }
}

class LinkedDeviceScreen extends StatefulWidget {
  @override
  _LinkedDeviceScreenState createState() => _LinkedDeviceScreenState();
}

class _LinkedDeviceScreenState extends State<LinkedDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linked Devices'),
      ),
      body: Center(
        child: Text('Display the linked devices here'),
      ),
    );
  }
}

class StarredMessagesScreen extends StatefulWidget {
  @override
  _StarredMessagesScreenState createState() => _StarredMessagesScreenState();
}

class _StarredMessagesScreenState extends State<StarredMessagesScreen> {
  final List<String> starredMessages = [
    "Message 1",
    "Message 2",
    "Message 3",
    // Add more starred messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starred Messages'),
      ),
      body: ListView.builder(
        itemCount: starredMessages.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return StickyHeader(
              header: Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(8.0),
              ),
              content: SizedBox.shrink(),
            );
          }
          final messageIndex = index - 1;
          final message = starredMessages[messageIndex];
          return Dismissible(
            key: Key(message),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                starredMessages.removeAt(messageIndex);
              });
            },
            child: ListTile(
              title: Text(message),
              onTap: () {
                // Handle message tap
              },
            ),
          );
        },
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('Settings'),
    ),
    body: ListView(
    children: [
    ListTile(
    title: Text('Account'),
    leading: Icon(Icons.person),
    onTap: () {
    // Navigate to account settings
    },
    ),
    ListTile(
    title: Text('Notifications'),
    leading: Icon(Icons.notifications),
    onTap: () {
    // Navigate to notification settings
    },
    ),
    ListTile(
    title: Text('Privacy'),
    leading: Icon(Icons.lock),
    onTap: () {
    // Navigate to privacy settings
    },
    ),
    ListTile(
    title: Text('Chat Settings'),
    leading: Icon(Icons.chat),
    onTap: () {
    // Navigate to chat settings
    },
    ),
    ListTile(
    title: Text('Help'),
    leading: Icon(Icons.help),
    onTap: () {
    // Navigate to help screen
    },
    ),
    ListTile(
    title: Text('Log Out'),
    leading: Icon(Icons.logout),
    onTap: () {
    // Perform log out
    },
    ),
    ],
    ),
    );
  }
}


