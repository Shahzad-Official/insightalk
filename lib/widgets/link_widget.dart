import 'package:flutter/material.dart';

class LinkWidget extends StatelessWidget {
  const LinkWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 20,
        width: 150,
        color: Colors.white,
        child: Center(
          child: Stack(
            children: [
              const Center(
                child: Divider(
                  color: Colors.red,
                  thickness: 2,
                ),
              ),
              Center(
                child: Container(
                  height: 10,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
