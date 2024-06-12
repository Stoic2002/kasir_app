import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fHww",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          50.0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 18,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Lucas Scott',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                '@lucasscott3',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Saved Messages'),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Recent Calls'),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Devices'),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Notifications'),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Appearance'),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Language'),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Privacy & Security'),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Storage'),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () {},
              ),
              const SizedBox(height: 80.0),
            ],
          ),
        ),
      ),
    );
  }
}
