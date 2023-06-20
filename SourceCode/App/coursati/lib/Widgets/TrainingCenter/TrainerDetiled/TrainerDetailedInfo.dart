import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/Trainer.dart';
import 'package:flutter/material.dart';

class TrainerDetailedInfo extends StatefulWidget {
  TrainerDetailedInfo({super.key, required this.trainer});
  Trainer trainer;
  @override
  State<TrainerDetailedInfo> createState() => _TrainerDetailedInfoState();
}

class _TrainerDetailedInfoState extends State<TrainerDetailedInfo> {
  TextEditingController _name = TextEditingController(),
      _major = TextEditingController(),
      _discription = TextEditingController();

  TextEditingController _nameEdit = TextEditingController(),
      _majorEdit = TextEditingController(),
      _discriptionEdit = TextEditingController();

  bool isEditing = false;
  @override
  void initState() {
    _nameEdit = _name;
    _discriptionEdit = _discription;
    _majorEdit = _major;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isEditing) {
          setState(() {
            isEditing = !isEditing;
          });
          return false;
        } else {
          Navigator.of(context).pop(true);
          return true;
        }
      },
      child: Scaffold(
          floatingActionButton: !isEditing
              ? FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  child: const Icon(Icons.edit))
              : Container(),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            bottomOpacity: 1,
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            title: Text(
              (languageType == 0) ? "المدرب " : "Trainer",
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black54, fontSize: 28),
            ),
          ),
          body: SafeArea(
              child: ListView(
            children: [
              CircleAvatar(
                backgroundColor: isDark ? Colors.grey : Colors.black,
                radius: 122,
                child: CircleAvatar(
                  radius: 120,
                  foregroundImage: CachedNetworkImageProvider(
                    widget.trainer.image,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: !isEditing ? _name : _nameEdit,
                    readOnly: !isEditing,
                    decoration: InputDecoration(
                      label: Text((languageType == 0) ? "الاسم" : "name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: !isEditing ? _major : _majorEdit,
                    readOnly: !isEditing,
                    decoration: InputDecoration(
                      label: Text((languageType == 0) ? "التخصص" : "Major"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: !isEditing ? _discription : _discriptionEdit,
                    readOnly: !isEditing,
                    minLines: 1,
                    maxLines: 500,
                    decoration: InputDecoration(
                      label:
                          Text((languageType == 0) ? "الوصف" : "discription"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
