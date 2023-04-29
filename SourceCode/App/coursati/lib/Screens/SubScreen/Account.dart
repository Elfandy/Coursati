import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Widget _name = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.name,
          style: TextStyle(fontSize: 18),
        ),
      ),
      _email = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.email,
          style: TextStyle(fontSize: 18),
        ),
      ),
      _gender = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          languageType == 0
              ? user.gender.toLowerCase() == "male"
                  ? "ذكر"
                  : "أنثى"
              : user.gender,
          style: TextStyle(fontSize: 18),
        ),
      ),
      _birthDate = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.birthDate,
          style: TextStyle(fontSize: 18),
        ),
      ),
      _phoneNumber = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.phoneNumber,
          style: TextStyle(fontSize: 18),
        ),
      ),
      _organaiationName = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.orginaizationName,
          style: TextStyle(fontSize: 18),
        ),
      ),
      _passportID = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.personalID,
          style: TextStyle(fontSize: 18),
        ),
      );
  bool _isEdit = false, _SaveButton = false;

  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  //**** Start of build function */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        bottomOpacity: 0,
        title: Text(
          (languageType == 0) ? "إدارة الحساب" : "Account",
          style: const TextStyle(color: Colors.black54),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  user.image,
                ),
                radius: 100,
              ),
              SizedBox(
                height: 30,
              ),
              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              //***   This is the grid view for the info */
              SizedBox(
                height: 400,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3,
                  children: [
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          languageType == 0 ? "الاسم:" : "Name:",
                          style:
                              TextStyle(color: Color(0xff1776e0), fontSize: 18),
                        )),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 100), child: _name),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          languageType == 0 ? "البريد الالكتروني:" : "Email:",
                          style:
                              TextStyle(color: Color(0xff1776e0), fontSize: 18),
                        )),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 100), child: _email),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          languageType == 0 ? "الجنس:" : "Gender:",
                          style:
                              TextStyle(color: Color(0xff1776e0), fontSize: 18),
                        )),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 100), child: _gender),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          languageType == 0 ? "الميلاد:" : "BirthDate:",
                          style:
                              TextStyle(color: Color(0xff1776e0), fontSize: 18),
                        )),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 100),
                        child: _birthDate),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          languageType == 0 ? "رقم الهاتف:" : "Phone Number:",
                          style:
                              TextStyle(color: Color(0xff1776e0), fontSize: 18),
                        )),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 100),
                        child: _phoneNumber),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          languageType == 0
                              ? "اسم المؤسسة:"
                              : "Oranaization name:",
                          style:
                              TextStyle(color: Color(0xff1776e0), fontSize: 18),
                        )),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 100),
                        child: _organaiationName),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          languageType == 0
                              ? "رقم جواز السفر:"
                              : "Passport ID:",
                          style:
                              TextStyle(color: Color(0xff1776e0), fontSize: 18),
                        )),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 100),
                        child: _passportID),
                  ],
                ),
              ),
              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
              //****   Start of the edit button  */
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: !_isEdit,
                child: ElevatedButton(
                  child: Text(languageType == 0
                      ? "تعديل البيانات"
                      : "Edit inforamtion"),
                  onPressed: _switchToEdit,
                ),
              ),
              Visibility(
                visible: _isEdit,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: ElevatedButton(
                        child: Text(languageType == 0 ? "حفظ" : "save"),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: ElevatedButton(
                        child: Text(languageType == 0 ? "إلغاء" : "cancel"),
                        onPressed: _switchToEdit,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _switchToEdit() {
    setState(() {
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      //*******       Start of the switch function of the data */
      if (!_isEdit) {
        _name = TextField(
          decoration: InputDecoration(hintText: user.name),
        );
        _email = TextField(
          decoration: InputDecoration(hintText: user.email),
        );
        _gender = TextField(
          decoration: InputDecoration(
            hintText: languageType == 0
                ? user.gender.toLowerCase() == "male"
                    ? "ذكر"
                    : "أنثى"
                : user.gender,
          ),
        );
        _birthDate = TextField(
          decoration: InputDecoration(hintText: user.birthDate),
        );
        _phoneNumber = TextField(
          decoration: InputDecoration(hintText: user.phoneNumber),
        );
        _organaiationName = TextField(
          decoration: InputDecoration(hintText: user.orginaizationName),
        );
        _passportID = TextField(
          decoration: InputDecoration(hintText: user.personalID),
        );

        _isEdit = true;
      } else {
        _name = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.name,
            style: TextStyle(fontSize: 18),
          ),
        );
        _email = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.email,
            style: TextStyle(fontSize: 18),
          ),
        );
        _gender = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            languageType == 0
                ? user.gender.toLowerCase() == "male"
                    ? "ذكر"
                    : "أنثى"
                : user.gender,
            style: TextStyle(fontSize: 18),
          ),
        );
        _birthDate = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.birthDate,
            style: TextStyle(fontSize: 18),
          ),
        );
        _phoneNumber = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.phoneNumber,
            style: TextStyle(fontSize: 18),
          ),
        );
        _organaiationName = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.orginaizationName,
            style: TextStyle(fontSize: 18),
          ),
        );
        _passportID = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.personalID,
            style: TextStyle(fontSize: 18),
          ),
        );
        _isEdit = false;
      }
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
    });
  }
}
