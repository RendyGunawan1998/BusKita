import '../../../core.dart';

Widget formsLogin(
    Key keys,
    TextEditingController emailCont,
    bool obs,
    TextEditingController passCont,
    Function() funcPass,
    bool status,
    Function() opLogin) {
  return Form(
    key: keys,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          tffEmailLogin(
            emailCont,
            Icon(
              Icons.email,
              color: Colors.grey[400],
            ),
            "Email",
          ),
          hbox(7),
          tffPassLogin(obs, funcPass, passCont),
          hbox(40),
          status == true ? loading_loader() : buttonPanjang("Sign In", opLogin),
          // rowForgetPass(),
          hbox(20),
        ],
      ),
    ),
  );
}

Widget tapContinueWith(Function() tap, String images) {
  return InkWell(
    onTap: tap,
    child: Container(
      width: 60,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300],
        ),
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(5),
      child: Image.asset(
        images,
      ),
    ),
  );
}

Widget rowForgetPass() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
          onPressed: () {},
          child: welcomeText(
            'Forget the Password?',
            TextStyle(
              color: HexColor('#FF6633').withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )),
    ],
  );
}

Widget rowDaftar() {
  return Padding(
    padding: EdgeInsets.only(top: 30, bottom: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        welcomeText(
          'Belum punya Akun?',
          TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => Registasi());
          },
          child: welcomeText(
            'Daftar Baru',
            TextStyle(
                color: HexColor('#FF6633').withOpacity(0.8),
                fontWeight: FontWeight.w500,
                fontSize: 16,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    ),
  );
}

Widget tffPassLogin(
    bool obs, Function() funcPass, TextEditingController passCont) {
  return TextFormField(
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(
        Icons.lock,
        color: Colors.grey[400],
      ),
      labelText: "Password",
      hintText: "Password",
      suffixIcon: IconButton(
        icon: Icon(
          obs ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey[400],
        ),
        onPressed: funcPass,
      ),
    ),
    obscureText: obs,
    validator: validate,
    controller: passCont,
    onSaved: (value) {
      passCont.text = value;
    },
  );
}

Widget tffEmailLogin(
    TextEditingController tc, Widget preIcon, String hintLabel) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      prefixIcon: preIcon,
      hintText: hintLabel,
      labelText: hintLabel,
    ),
    validator: validate,
    controller: tc,
    onSaved: (value) {
      tc.text = value;
    },
  );
}

void showAlertDialogOK(BuildContext context, String judul, String isi) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () => Navigator.pop(context),
  );
  AlertDialog alert = AlertDialog(
    title: Text(judul),
    content: Text(
      isi,
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog(
    BuildContext context, String judul, String message, Function() fungsi) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: fungsi,
  );
  AlertDialog alert = AlertDialog(
    title: Text(judul),
    content: Text(message),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2Button(
    BuildContext context, String judul, String message, Function() fungsi) {
  Widget yaButton = TextButton(
    child: Text("Ya"),
    onPressed: fungsi,
  );
  Widget noButton = TextButton(
    child: Text("Tidak"),
    onPressed: fungsi,
  );
  AlertDialog alert = AlertDialog(
    title: Text(judul),
    content: Text(message),
    actions: [
      noButton,
      yaButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
