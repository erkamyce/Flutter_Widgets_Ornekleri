import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";
  String alinanVeri = "";
  String resim = "mutlu.png";
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  int radioDeger = 0;
  bool progresControl = true;
  double ilerleme = 30.0;

  @override
  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("İtalya");
    ulkelerListesi.add("Japonya");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: tfController,
                  decoration: const InputDecoration(hintText: "Veri"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  alinanVeri = tfController.text;
                });
              }, child: const Text("Veriyi Al")),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resim = "mutlu.png";
                    });
                  }, child: const Text("Resim 1")),
                  Image.asset("resimler/$resim"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resim = "uzgun.png";
                    });
                  }, child: const Text("Resim 2 ")),
        
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 200,
                    child: SwitchListTile(
                        title: Text("Dart"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchKontrol,
                        onChanged: (veri){
                          setState(() {
                            switchKontrol = veri;
                          });
                        }
                    ),
                  ),
                  SizedBox(width: 200,
                    child: CheckboxListTile(
                        title: Text("Flutter"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkboxKontrol,
                        onChanged: (veri){
                          setState(() {
                            checkboxKontrol = veri!;
                          });
                        }
                    ),
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 200,
                    child: RadioListTile(
                        title: Text("mako"),
                        value: 1,
                        groupValue: radioDeger,
                        onChanged: (veri){
                          setState(() {
                            radioDeger = veri!;
                          });
                        }
                    ),
                  ),
                  SizedBox(width: 200,
                    child: RadioListTile(
                        title: Text("heko"),
                        value: 2,
                        groupValue: radioDeger,
                        onChanged: (veri){
                          setState(() {
                            radioDeger = veri!;
                          });
                        }
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progresControl = true;
                    });
                  }, child: const Text("Başla")),
                  Visibility(visible: progresControl,child : const CircularProgressIndicator()),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progresControl = false;
                    });
                  }, child: const Text("Dur")),
        
                ],
              ),
              Text(ilerleme.toInt().toString()),
              Slider(max:100.0,min: 0.0 , value: ilerleme, onChanged: (veri){
                setState(() {
                  ilerleme = veri;
                });
              }),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox( width: 120,
                      child: TextField(controller: tfSaat, decoration: const InputDecoration(hintText: "Saat"),)),
                  IconButton(onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                    .then((value) => {
                      tfSaat.text = "${value!.hour} : ${value.minute}"
                    });
                  }, icon: const Icon(Icons.access_time)),
                  SizedBox( width: 120,
                      child: TextField(controller: tfTarih, decoration: const InputDecoration(hintText: "Tarih"),)),
                  IconButton(onPressed: (){
                    showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2030))
                        .then((value) => {
                      tfTarih.text = "${value!.day} / ${value.month} / ${value.year}"
                    });
                  }, icon: const Icon(Icons.date_range))
                ],
              ),
              DropdownButton(
                value: secilenUlke,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map((ulke) {
                    return DropdownMenuItem(value: ulke,child: Text(ulke),);
                  }).toList(),
                  onChanged: (veri) {
                  setState(() {
                    secilenUlke = veri!;
                  });
                  },
              ),
              GestureDetector(
                  onTap: (){
                    print("Tek Tıklandı");
                  },
                  onDoubleTap: (){
                    print("kırmızı çift tıklandı");
                  },
                  onLongPress: (){
                    print("Kırmızı Uzun Basıldı");
                  },
                  child: Container(width: 200, height: 200,color: Colors.red,)),
              ElevatedButton(onPressed: (){
                setState(() {
                  print("switch kontreol : $switchKontrol");
                });
              }, child: const Text("Göster")),
        
            ],
          ),
        ),
      ),
    );
  }
}
