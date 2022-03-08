import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Kampanyalar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //"İndirim Kuponları" ve "Otomatik İndirim Kuponları" yazan butonların fonksiyonları için oluşturulmuş değişkenler
  bool _firstButton = true;
  bool _secondButton = false;

  //Kampanya objelerinin kaydedildiği liste
  List<Campaign> campaigns = [
    Campaign('52AXKRFG', 'Tüm ürünlerde %5 indirim', 'Tek kullanımlık \u25aa', true, 1, 1, '12.12.21', 'Süresiz'),
    Campaign('53AXKZDA', 'ABC Koleksiyonunda %5 İndirim', 'Vip Müşterilerde \u25aa', false, 5, 15, '12.12.21', '31.12.21'),
  ];


  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height/20,
                horizontal: MediaQuery.of(context).size.width/40
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //En üstteki kampanyalar yazan kısım
                Text(widget.title, style: const TextStyle(color: Colors.black, fontSize: 24),),
                const Divider(height: 40, thickness: 2,),

                //"İndirim Kuponları", "Otomatik İndirim Kuponları" ve "Kupon oluştur" yazan butonların olduğu kısım
                Row(
                  children: [
                    Material(
                      shape: Border(
                          bottom: BorderSide(
                            color: _firstButton ? Colors.black : Colors.transparent,
                          )
                      ),
                      child: TextButton(
                        child: const Text('İndirim Kuponları', style: TextStyle(color: Colors.black),),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white
                        ),
                        onPressed: () {
                          setState(() {
                            if (_secondButton == true) {
                              _secondButton = false;
                              _firstButton = true;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/50,
                    ),
                    Material(
                      shape: Border(
                          bottom: BorderSide(
                            color: _secondButton ? Colors.black : Colors.transparent,
                          )
                      ),
                      child: TextButton(
                        child: const Text(' Otomatik İndirim Kuponları', style: TextStyle(color: Colors.black),),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white
                        ),
                        onPressed: () {
                          setState(() {
                            if (_firstButton == true) {
                              _firstButton = false;
                              _secondButton = true;
                            }
                          });
                        },
                      ),
                    ),
                    const Spacer(),
                    OutlinedButton(
                      child: const Text('Kupon Oluştur', style: TextStyle(color: Colors.black),),
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          )
                      ),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/15,
                ),

                //Sayfanın alt kısmında kampanyaların listelendiği kısım
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.shade400
                      )
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width/40
                    ),
                    child: Column(
                      children: [
                        //"Tümü", "Aktif", "Planlanan" ve "Pasif" isimli butonların bulunduğu kısım
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height/60
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Material(
                                shape: const Border(
                                    bottom: BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 3
                                    )
                                ),
                                child: TextButton(
                                  child: const Text('Tümü', style: TextStyle(color: Colors.black),),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.white
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width/60,
                              ),
                              Material(
                                shape: const Border(
                                    bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 3
                                    )
                                ),
                                child: TextButton(
                                  child: const Text('Aktif', style: TextStyle(color: Colors.black),),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.white
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width/60,
                              ),
                              Material(
                                shape: const Border(
                                    bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 3
                                    )
                                ),
                                child: TextButton(
                                  child: const Text('Planlanan', style: TextStyle(color: Colors.black),),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.white
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width/60,
                              ),
                              Material(
                                shape: const Border(
                                    bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 3
                                    )
                                ),
                                child: TextButton(
                                  child: const Text('Pasif', style: TextStyle(color: Colors.black),),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.white
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: MediaQuery.of(context).size.height/30,
                          thickness: 2,
                        ),
                        //"Filtre" kısmının bulunduğu kısım
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 35,
                                  child: OutlinedButton(
                                    child: Row(
                                      children: const [
                                        Text('Filtre', style: TextStyle(color: Colors.black),),
                                        Spacer(),
                                        Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                      ],
                                      mainAxisSize: MainAxisSize.max,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/60,),
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 25,
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child: const Text( '1 Seçildi '),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 25,
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text(' İşlemler '),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.filter_list),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        //Kampanyaların listelendiği kısım
                        SizedBox(
                          height: MediaQuery.of(context).size.height/2,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: campaigns.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: IconButton(
                                  icon: Icon(index == 0 ? Icons.square : Icons.crop_square),
                                  onPressed: () {},
                                  splashRadius: 15,
                                ),
                                title: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(child: Text(campaigns[index].campaignCode)),
                                              Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                                width: 15,
                                                height: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                              Flexible(child: Text(campaigns[index].explanation)),
                                            ],
                                          ),
                                          Text(campaigns[index].numberOfUses)
                                        ],
                                      ),
                                    ),
                                    const Spacer(flex: 2,),
                                    width < 600
                                        ? const SizedBox()
                                        : Expanded(
                                      flex: 2,
                                      child: Chip(
                                        label: Text(campaigns[index].isActive ? 'Aktif' : 'Pasif'),
                                        shape: StadiumBorder(side: BorderSide(width: 1, color: Colors.grey.shade400)),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    const Spacer(),
                                    width < 700
                                        ? const SizedBox()
                                        : Expanded(
                                      flex: 2,
                                      child: Text('${campaigns[index].usage}/${campaigns[index].usageLimit} Kullanıldı'),
                                    ),
                                    const Spacer(),
                                    width < 800
                                        ? const SizedBox()
                                        : Expanded(
                                      flex: 2,
                                      child: Text('${campaigns[index].startDate} - ${campaigns[index].finishDate}'),
                                    ),
                                  ],
                                ),
                                subtitle: const Divider(),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
      );
  }
}

class Campaign {
  final String campaignCode;
  final String explanation;
  final String numberOfUses;
  final bool isActive;
  final int usage;
  final int usageLimit;
  final String startDate;
  final String finishDate;

  Campaign(
      this.campaignCode,
      this.explanation,
      this.numberOfUses,
      this.isActive,
      this.usage,
      this.usageLimit,
      this.startDate,
      this.finishDate
      );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}