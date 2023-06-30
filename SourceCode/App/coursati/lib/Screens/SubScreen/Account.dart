import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../Classes/GlobalVariables.dart';
import '../../Classes/UserData.dart';
import '../../Services/Controller/FileHandle.dart';
import '../../Services/ScreenController.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  double Boxsize = 270;
  Widget _name = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.name,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      _email = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.email,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      _gender = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          languageType == 0
              ? user.gender == 0
                  ? "ذكر"
                  : "أنثى"
              : user.gender == 0
                  ? "Male"
                  : "Female",
          style: const TextStyle(fontSize: 16),
        ),
      ),
      _birthDate = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.birthDate,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      _phoneNumber = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.phoneNumber,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      // _organaiationName = Align(
      //   alignment: AlignmentDirectional.centerStart,
      //   child: Text(
      //     user.orginaizationName,
      //     style: const TextStyle(fontSize: 16),
      //   ),
      // ),
      _passportID = Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          user.personalID,
          style: const TextStyle(fontSize: 16),
        ),
      );
  bool _isEdit = false, _SaveButton = false;
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//****     Start of the edit controller */
  TextEditingController _editName = TextEditingController(),
      _editEmail = TextEditingController(),
      _editBirthDate = TextEditingController(),
      _editPHoneNumber = TextEditingController(),
      _editOrganaiztionName = TextEditingController(),
      _editPersonalID = TextEditingController(),
      _oldPass = TextEditingController(),
      _newPass1 = TextEditingController(),
      _newPass2 = TextEditingController();
  int? _editGender = user.gender;
  File? _image;
  String _imageEdit = user.image;
  ImageProvider? _imageProv;
  @override
  void initState() {
    super.initState();
    _imageProv = NetworkImage(serverStorage + _imageEdit);
  }

  bool _newPassError = false, _oldPassError = false;
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  //**** Start of build function */
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isEdit) {
          setState(() {
            _isEdit = !_isEdit;
          });
          return false;
        } else {
          Navigator.of(context).pop(true);
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            (languageType == 0) ? "إدارة الحساب" : "Account",
            style: TextStyle(color: isDark ? Colors.white : Colors.black54),
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
                  backgroundColor: isDark ? Colors.grey[200] : Colors.white,
                  backgroundImage: _isEdit
                      ? _imageProv
                      : NetworkImage(serverStorage + user.image.trim()),
                  radius: 100,
                  child: _isEdit
                      ? Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: CircleBorder(),
                                backgroundColor: Color(0xbbffffff)),
                            child: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                            onPressed: getImage,
                          ),
                        )
                      : Container(),
                ),
                const SizedBox(
                  height: 30,
                ),
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                //***   This is the grid view for the info */
                Container(
                  height: (user.personalID == '') ? Boxsize : (Boxsize + 50),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    childAspectRatio: 3,
                    children: [
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            languageType == 0 ? "الاسم:" : "Name:",
                            style: const TextStyle(
                                color: Color(0xff1776e0), fontSize: 16),
                          )),
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          child: _name),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            languageType == 0 ? "البريد الالكتروني:" : "Email:",
                            style: const TextStyle(
                                color: Color(0xff1776e0), fontSize: 16),
                          )),
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          child: _email),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            languageType == 0 ? "الجنس:" : "Gender:",
                            style: const TextStyle(
                                color: Color(0xff1776e0), fontSize: 16),
                          )),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 100),
                        child: (_isEdit)
                            ? DropdownButton(
                                items: [
                                  DropdownMenuItem(
                                    value: 0,
                                    child: Text(
                                      languageType == 0 ? "ذكر" : "Male",
                                      style: TextStyle(
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                    // onTap: () {
                                    //   setState(() {
                                    //     _editGender = "Male";
                                    //   });
                                    // },
                                  ),
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text(
                                      languageType == 0 ? "أنثى" : "Female",
                                      style: TextStyle(
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                    // onTap: () {
                                    //   setState(() {
                                    //     _editGender = "Female";
                                    //   });
                                    // },
                                  ),
                                ],
                                value: _editGender,
                                isExpanded: true,
                                onChanged: (value) {
                                  setState(() {
                                    _editGender = value;
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                              )
                            : Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  languageType == 0
                                      ? user.gender == 0
                                          ? "ذكر"
                                          : "أنثى"
                                      : user.gender == 0
                                          ? "Male"
                                          : "Female",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                      ),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            languageType == 0 ? "الميلاد:" : "BirthDate:",
                            style: const TextStyle(
                                color: Color(0xff1776e0), fontSize: 16),
                          )),
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          child: _birthDate),
                      (user.phoneNumber != '')
                          ? Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                languageType == 0
                                    ? "رقم الهاتف:"
                                    : "Phone Number:",
                                style: const TextStyle(
                                    color: Color(0xff1776e0), fontSize: 16),
                              ))
                          : Container(),
                      (user.phoneNumber != '')
                          ? AnimatedSwitcher(
                              duration: const Duration(milliseconds: 100),
                              child: _phoneNumber)
                          : Container(),
                      // (user.orginaizationName != '')
                      //     ? Align(
                      //         alignment: AlignmentDirectional.centerEnd,
                      //         child: Text(
                      //           languageType == 0
                      //               ? "اسم المؤسسة:"
                      //               : "Oranaization name:",
                      //           style: const TextStyle(
                      //               color: Color(0xff1776e0), fontSize: 16),
                      //         ))
                      //     : Container(),
                      // (user.orginaizationName != '')
                      //     ? AnimatedSwitcher(
                      //         duration: const Duration(milliseconds: 100),
                      //         child: _organaiationName)
                      //     : Container(),
                      (user.personalID != '')
                          ? Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                languageType == 0
                                    ? "رقم جواز السفر:"
                                    : "Passport ID:",
                                style: const TextStyle(
                                    color: Color(0xff1776e0), fontSize: 16),
                              ))
                          : Container(),
                      (user.personalID != '')
                          ? AnimatedSwitcher(
                              duration: const Duration(milliseconds: 100),
                              child: _passportID)
                          : Container(),
                    ],
                  ),
                ),
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
                //****   Start of the edit button  */
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: !_isEdit,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: OutlinedButton(
                      // style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(20))),
                      onPressed: _switchToEdit,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            languageType == 0
                                ? "تعديل البيانات"
                                : "Edit inforamtion",
                            style: const TextStyle(color: Color(0xff1776e0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _isEdit,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Text(
                              languageType == 0 ? "حفظ" : "save",
                              style: const TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: _switchToEdit,
                            child: Text(
                              languageType == 0 ? "إلغاء" : "cancel",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: !_isEdit,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () => showDialog(
                        context: context,
                        useSafeArea: true,
                        builder: (context) => AlertDialog(
                          title: Center(
                            child: Text(
                              languageType == 0
                                  ? "تغيير كلمة المرور"
                                  : "Change password",
                              style: TextStyle(
                                  color: Color(0xff1776e0), fontSize: 18),
                            ),
                          ),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height / 4,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        if (value != user.password) {
                                          _oldPassError = true;
                                        } else {
                                          _oldPassError = false;
                                        }
                                      });
                                    },
                                    controller: _oldPass,
                                    autofocus: true,
                                    obscureText: true,
                                    maxLength: 32,
                                    style: TextStyle(
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: (_oldPassError)
                                            ? BorderSide(color: Colors.red)
                                            : BorderSide(
                                                color: Color(0xff1776e0)),
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: (_newPassError)
                                            ? BorderSide(color: Colors.red)
                                            : BorderSide(
                                                color: Color(0xff1776e0)),
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      counterText: "",
                                      label: Text(languageType == 0
                                          ? "الرمز السري الحالي"
                                          : "Old Password"),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                    ),
                                    cursorHeight: 3,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextField(
                                    controller: _newPass1,
                                    autofocus: true,
                                    obscureText: true,
                                    maxLength: 32,
                                    style: TextStyle(
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black),
                                    decoration: InputDecoration(
                                      counterText: "",
                                      label: Text(languageType == 0
                                          ? "الرمز السري الجديد "
                                          : "New Password"),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1776e0)),
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                    ),
                                    cursorHeight: 3,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        if (value != _newPass1.text) {
                                          _newPassError = true;
                                        } else {
                                          _newPassError = false;
                                        }
                                      });
                                    },
                                    controller: _newPass2,
                                    autofocus: true,
                                    obscureText: true,
                                    maxLength: 32,
                                    style: TextStyle(
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black),
                                    decoration: InputDecoration(
                                      counterText: "",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: (_newPassError)
                                            ? BorderSide(color: Colors.red)
                                            : BorderSide(
                                                color: Color(0xff1776e0)),
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: (_newPassError)
                                            ? BorderSide(color: Colors.red)
                                            : BorderSide(
                                                color: Color(0xff1776e0)),
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      focusColor: Colors.red,
                                      label: Text(languageType == 0
                                          ? "تكرار الرمز الجديد"
                                          : "Reapeat New Password"),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                    ),
                                    cursorHeight: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: TextButton(
                                  child: Text(
                                      languageType == 0 ? "تغيير" : "submit",
                                      style: TextStyle(fontSize: 18)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              languageType == 0
                                  ? "تغيير كلمة السر"
                                  : "Change password",
                              style: const TextStyle(color: Color(0xff1776e0)),
                            ),
                          ]),
                    ),
                  ),
                ),
                Visibility(
                  visible: !_isEdit,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(),
                      onPressed: () async {
                        try {
                          await dioTestApi
                              .delete('auth/logout',
                                  options: Options(headers: {
                                    'Authorization': "Bearer ${user.token}"
                                  }))
                              .then((value) {});
                          setState(() {
                            user = UserData(
                                name: "",
                                image: "",
                                token: "",
                                notifications: 0,
                                password: "",
                                birthDate: "",
                                email: "",
                                gender: 0,
                                id: 0);

                            FileHandle().writeConfig(ConfigSave);
                            ScreenController().restartApp(context);
                          });
                        } catch (ex) {}
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout, color: Colors.red),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              (languageType == 0) ? "تسجيل الخروج" : "Logout",
                              style: TextStyle(color: Colors.red),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  //?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  //?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  //?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  //?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  //?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  //?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
//?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  Future openPasswordDilog() => showDialog(
        context: context,
        useSafeArea: true,
        builder: (context) => AlertDialog(
          title: Center(
            child: Text(
              languageType == 0 ? "تغيير كلمة المرور" : "Change password",
              style: TextStyle(color: Color(0xff1776e0), fontSize: 18),
            ),
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        if (value != user.password) {
                          _oldPassError = true;
                        } else {
                          _oldPassError = false;
                        }
                      });
                    },
                    controller: _oldPass,
                    autofocus: true,
                    obscureText: true,
                    maxLength: 32,
                    style:
                        TextStyle(color: isDark ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: (_oldPassError)
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Color(0xff1776e0)),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      counterText: "",
                      label: Text(languageType == 0
                          ? "الرمز السري الحالي"
                          : "Old Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    cursorHeight: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _newPass1,
                    autofocus: true,
                    obscureText: true,
                    maxLength: 32,
                    style:
                        TextStyle(color: isDark ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      counterText: "",
                      label: Text(languageType == 0
                          ? "الرمز السري الجديد "
                          : "New Password"),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1776e0)),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    cursorHeight: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        if (value != _newPass1.text) {
                          _newPassError = true;
                        } else {
                          _newPassError = false;
                        }
                      });
                    },
                    controller: _newPass2,
                    autofocus: true,
                    obscureText: true,
                    maxLength: 32,
                    style:
                        TextStyle(color: isDark ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderSide: (_newPassError)
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Color(0xff1776e0)),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      focusColor: Colors.red,
                      label: Text(languageType == 0
                          ? "تكرار الرمز الجديد"
                          : "Reapeat New Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    cursorHeight: 3,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextButton(
                  child: Text(languageType == 0 ? "تغيير" : "submit",
                      style: TextStyle(fontSize: 18)),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );

  _switchToEdit() {
    setState(() {
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      //*******       Start of the switch function of the data */
      if (!_isEdit) {
        _name = TextField(
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
          controller: _editName,
          maxLength: 20,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
            counterText: '',
            hintText: user.name,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        );
        _email = TextField(
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
          controller: _editEmail,
          maxLength: 32,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
              counterText: '',
              hintText: user.email,
              hintStyle: TextStyle(color: Colors.grey)),
        );

        _birthDate = TextField(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: DateTime.now(),
                lastDate: DateTime.now());

            if (pickedDate != null) {
              String foramteDate = DateFormat('yyyy-MM-dd').format(pickedDate);
              setState(() {
                _editBirthDate.text = foramteDate;
              });
            } else {}
          },
          readOnly: true,
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
          controller: _editBirthDate,
          decoration: InputDecoration(
              hintText: user.birthDate,
              hintStyle: TextStyle(color: Colors.grey)),
        );
        _phoneNumber = TextField(
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
          controller: _editPHoneNumber,
          maxLength: 10,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
              counterText: '',
              hintText: user.phoneNumber,
              hintStyle: TextStyle(color: Colors.grey)),
        );
        // _organaiationName = TextField(
        //   style: TextStyle(color: isDark ? Colors.white : Colors.black),
        //   controller: _editOrganaiztionName,
        //   maxLength: 24,
        //   maxLengthEnforcement: MaxLengthEnforcement.enforced,
        //   decoration: InputDecoration(
        //       counterText: '',
        //       hintText: user.orginaizationName,
        //       hintStyle: TextStyle(color: Colors.grey)),
        // );
        _passportID = TextField(
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
          controller: _editPersonalID,
          maxLength: 8,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
              counterText: '',
              hintText: user.personalID,
              hintStyle: TextStyle(color: Colors.grey)),
        );
        _isEdit = true;
      } else {
        _name = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.name,
            style: const TextStyle(fontSize: 16),
          ),
        );
        _email = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.email,
            style: const TextStyle(fontSize: 16),
          ),
        );

        _birthDate = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.birthDate,
            style: const TextStyle(fontSize: 16),
          ),
        );
        _phoneNumber = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.phoneNumber,
            style: const TextStyle(fontSize: 16),
          ),
        );
        // _organaiationName = Align(
        //   alignment: AlignmentDirectional.centerStart,
        //   child: Text(
        //     user.orginaizationName,
        //     style: const TextStyle(fontSize: 16),
        //   ),
        // );
        _passportID = Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            user.personalID,
            style: const TextStyle(fontSize: 16),
          ),
        );
        _isEdit = false;
        _editBirthDate.text = '';
        _editEmail.text = '';
        _editGender = user.gender;
        _editName.text = "";
        _editPHoneNumber.text = "";
        _editPersonalID.text = "";
      }
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
    });
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      _image = imageTemp;
      if (_image != null) {
        _imageProv = FileImage(_image!);
      } else {
        _imageProv = NetworkImage(serverStorage + user.image);
      }
    });
  }
}
