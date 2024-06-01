import 'package:flutter/material.dart';
import 'widget.dart';
import 'generated/assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Profil facebook'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showsnack() {//affiche une snackbar
    setState(() {
      snack(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.title,style:const TextStyle(fontFamily: "Arial",fontSize: 20),),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,//scroll de la page
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: screenW,
                    height: screenH / 4,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black12,spreadRadius: 1)],
                        color: Colors.blue,
                        image: DecorationImage(
                            image: AssetImage(Assets.assetsTangyBig),fit: BoxFit.cover) ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenH/7, left: screenW/3),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,

                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(Assets.assetsTangy),
                          radius: 60,
                        ),
                      ),
                    ),
                  ),
                ],
              ),//profile et couverture

              const Text(
                'Tangy',
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),//nom du compte
              const SizedBox(
                height: 10,
              ),

              const Text(
                'Un jour j\'ecraserai mon maitre, mais pas aujourdui, je ne suis pas suffisament fort',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                ),
              ),//une phrase pour faire jolie
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: showsnack,
                    child: Container(
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                          //boxShadow: const [BoxShadow(color: Colors.blueGrey,spreadRadius: 1)],
                      ),
                      child: const Center(
                        child: Text(
                          'Modifier le profil',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(17)),
                    child:  Center(
                        child: IconButton(
                          icon:  const Icon(Icons.edit_note_rounded),
                          color: Colors.white,
                          onPressed: showsnack,
                        )),
                  ),
                ],
              ),//edition buttons
              const Divider(
                height: 20,
                thickness: 2,
              ),
              Padding(padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  titre(pad: 0, text: 'A propos de moi'),
                  paddingIconText(
                      icon: Icons.home, top: 5, text: ' seoul, Coré du Sud'),
                  paddingIconText(
                      icon: Icons.pets,
                      top: 5,
                      text: ' Pet de combat'),
                  paddingIconText(
                      icon: Icons.gamepad, top: 5, text: 'Joue à Arcana'),
                ],
              ),),
              const Divider(
                height: 3,
                thickness: 2,
              ),
              titre(pad: 10, text: ' Amis'),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,//scroll des amis
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      friend(image: Assets.assetsNoye, nom: 'Noe'),
                      friend(image: Assets.assetsNabi, nom: 'Nabi'),
                      friend(image: Assets.assetsMouton, nom: 'Mr Mouton'),
                      friend(image: Assets.assetsSilvy, nom: 'Silvy'),
                      friend(image: Assets.assetsTakato, nom: 'Takato'),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
                thickness: 3,
              ),
              titre(pad: 5, text: 'Mes Posts'),
              publication(
                  context: context,
                  top: 10,
                  profil: Assets.assetsTangy,
                  image: Assets.assetsTest,
                  nom: 'Tangy',
                  text: 'Il y\'a 1 jour',
                  ilustration:'Hello world',
                  like: 300,
                  comment: 135),
              publication(
                  context: context,
                  top: 5,
                  profil: Assets.assetsTangy,
                  image: Assets.assetsNabi2,
                  nom: 'Tangy',
                  text: 'Il y\'a 3 heures',
                  ilustration: 'Best employee ever\n Pay attention not being lazy',
                  like: 650,
                  comment: 150),
              publication(
                  context: context,
                  top: 5,
                  profil: Assets.assetsTangy,
                  image: Assets.assetsHome,
                  nom: 'Tangy',
                  text: 'Il y\'a 45 minutes',
                  ilustration:'Finally back home after four years',
                  like: 400,
                  comment: 200),
              publication(
                  context: context,
                  top: 5,
                  profil: Assets.assetsTangy,
                  image: Assets.assetsTbate,
                  nom: 'Tangy',
                  text: 'Il y\'a 5 minutes',
                  ilustration:'#The beginning after the end\n Best manhwa',
                  like: 1045,
                  comment: 850),
              publication(
                  context: context,
                  top: 5,
                  profil: Assets.assetsTangy,
                  image: Assets.assetsArtur,
                  nom: 'Tangy',
                  text: 'Il y\'a 50 minutes',
                  ilustration:'Showing his true nature\nA wolf in sheep clothing',
                  like: 1005,
                  comment: 650),
            ],
          ), //Fin de la colonne
        ));
  }


}
