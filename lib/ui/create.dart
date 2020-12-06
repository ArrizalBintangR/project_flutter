part of 'ui.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController idbarang = TextEditingController();
  TextEditingController namabarang = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  String msg;

  void simpanData() {
    createBarang(idbarang.toString(), namabarang.toString(), jumlah.toString())
        .then((value) {
      // print("$namabarang <><><><><><><><><><><> $jumlah");
      setState(() {
        if (value == true) {
          msg = "Sukses";
        } else {
          msg = "GAGAL";
        }
      });
      print("$idbarang $namabarang");
    });

    AlertDialog alertdialog = AlertDialog(
      content: Container(
        height: 100,
        child: Column(
          children: <Widget>[
            Text("Create new Post $msg"),
            RaisedButton(
                child: Text("OK ?"), onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
    );
    showDialog(context: context, child: alertdialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            LoginBackground(),
            Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Container(
                    height: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.teal[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new TextFormField(
                            controller: idbarang,
                            decoration: new InputDecoration(
                                hintText: "id barang",
                                labelText: "id barang",
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.teal[50], fontSize: 20),
                                hoverColor: Colors.white),
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(top: 20.0),
                          ),
                          new TextFormField(
                            controller: namabarang,
                            decoration: new InputDecoration(
                                hintText: "Nama Barang",
                                labelText: "Nama Barang",
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.teal[50], fontSize: 20),
                                hoverColor: Colors.white),
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(top: 20.0),
                          ),
                          new TextFormField(
                            controller: jumlah,
                            decoration: new InputDecoration(
                                hintText: "Jumlah Barang",
                                labelText: "Jumlah Barang",
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0))),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(height: 30),
                                RaisedButton(
                                  color: Colors.green[400],
                                  child: const Text('OK',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  onPressed: () {
                                    simpanData();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}
