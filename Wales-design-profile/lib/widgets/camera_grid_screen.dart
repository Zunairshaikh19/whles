import 'package:flutter/material.dart';

import '../app_theme.dart';

class CameraGridScreen extends StatefulWidget {
  final List<String> profileURL;
  // ignore: prefer_typing_uninitialized_variables
  final function;
  const CameraGridScreen(this.function, this.profileURL, {Key? key})
      : super(key: key);

  @override
  _CameraGridScreenState createState() => _CameraGridScreenState();
}

class _CameraGridScreenState extends State<CameraGridScreen> {
  void abc() {}
  List images = [
    'assets/femalepic1.jpg',
    'assets/femalepic8.jpg',
    'assets/femalepic13.jpg',
    'assets/femalepic13.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24) / 4.95;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    return Padding(
      padding: const EdgeInsets.all(16),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: widget.profileURL.isEmpty || widget.profileURL.length == 1
            ? GestureDetector(
                onTap: widget.function,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  mainAxisSpacing: 12,
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  children: List.generate(
                    4,
                    (index) {
                      return GestureDetector(
                        onTap: widget.function,
                        child: Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppTheme.blackColor,
                                // image: const DecorationImage(
                                //  image: ExactAssetImage('assets/placeHolder.png'),
                                //   fit: BoxFit.fitHeight,
                                // ),
                                border: Border.all(
                                    color: Colors.blueGrey.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          //const Text("Please Add Photos"),
                          Positioned(
                              bottom: 45,
                              right: 45,
                              child: Text(
                                'Image ${index + 1}',
                                style: TextStyle(color: AppTheme.whiteColor),
                              ))
                        ]),
                      );
                    },
                  ),
                ),
              )
            : GridView.count(
                mainAxisSpacing: 28,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisSpacing: 12,
                crossAxisCount: 2,
                children: List.generate(
                  widget.profileURL.length - 1,
                  (index) {
                    return GestureDetector(
                      onTap: widget.function,
                      child: Stack(children: [
                        if (widget.profileURL.isNotEmpty)
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.profileURL[index + 1]),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                    color: Colors.blueGrey.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        const Positioned(
                          bottom: 15,
                          right: 15,
                          child: Icon(
                            Icons.add_circle_outline_outlined,
                            size: 35,
                            color: AppTheme.kCustomTextFiledHintTextColor,
                          ),
                        )
                      ]),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
