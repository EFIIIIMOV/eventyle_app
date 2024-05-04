import 'package:flutter/material.dart';

import '../../../../../../core/utils/fetch_image_util.dart';

class UserListTileCard extends StatelessWidget {
  final String user_id;
  final String name;
  final String surname;
  final String role;

  const UserListTileCard({
    super.key,
    required this.user_id,
    required this.name,
    required this.surname,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(150.0),
              child: FutureBuilder<Widget>(
                future: fetchImage(
                    imageUrl:
                    'http://10.0.2.2:8000/user/profile/image/?user_id=${user_id.replaceAll('-', '')}',
                    boxSize: 50),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: 50,
                      width: 50,
                      child: Transform.scale(
                        scale: 0.5,
                        child: const CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.black26),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return SizedBox(
                        height: 50, width: 50, child: snapshot.data!);
                  } else {
                    return const SizedBox(
                      height: 50,
                      width: 50,
                    );
                  }
                },
              ),
            ),
            title: Text('$name $surname'),
            subtitle: Text(role),
            // trailing: const Icon(
            //   Icons.add_circle,
            //   color: Colors.blue,
            // ),
          ),
        ),
      ),
    );
  }
}
