import 'package:eventyle_app/constants/widgets/bottom_bar_widget.dart';
import 'package:eventyle_app/constants/widgets/container_box_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessageBottomBar extends StatelessWidget {
  final _controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.attach_file, size: 30),
              color: Colors.black,
              onPressed: () {},
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0, // Минимальная высота
                      maxHeight: 150, // Максимальная высота
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          child: TextField(
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            controller: _controller,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Введите сообщение",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5), // Изменение отступов
                            ),
                            onSubmitted: (String) {},
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, size: 30),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
