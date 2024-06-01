import 'package:flutter/material.dart';
//import 'generated/assets.dart';

//snackbar
void snack(BuildContext context) {
     var snackbar = SnackBar(
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 2),
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)),
      behavior: SnackBarBehavior.floating,
      content: const Text(
      'Nothing to do here',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0,color: Colors.red,),
      textAlign: TextAlign.center,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

//liste des amis
Widget friend({required String image, required String nom}){
  return Padding(
    padding: const EdgeInsets.only(left: 10,top: 5),
    child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                 // shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 5.0,
                    offset: Offset(1.0, 2.0)
                  )
                ]
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10),
              child:Text(nom,style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),)

          ],
        ),
  );
}
//titre
Widget titre({required double pad, required String text,}){
  return Padding(
      padding: EdgeInsets.only(left: pad,top: pad),
      child: Row(
        children: [
          Text(text,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
        ],
      ),
  );
}

//icone avec texte
Widget paddingIconText({required IconData icon, required double top, required String text}){
  return Padding(
    padding: EdgeInsets.only(top: top),
      child: Row(
        children: [
          Icon(icon,),
          Text(text,style: const TextStyle(color: Colors.black,fontSize: 13),),
        ],
      ),
    );
}

////affichage des posts
Widget publication(
  {
    required BuildContext context, 
    required double top, 
    required String profil, 
    required String image,
    required String nom, 
    required String text,
    required String ilustration,
    required int like,
    required int comment
    }
  ){
  return Padding(
    padding: EdgeInsets.only(top: top),
    child: Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: Colors.white70,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage(profil),
                        radius: 25,
                      ),//profile
                      Padding(padding: const EdgeInsets.only(left: 10),
                        child: Text(nom,
                        style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  Text(text,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.blueAccent),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(image,
                fit: BoxFit.cover,),
            ),//image publiee
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(ilustration,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blue,fontSize: 12),),
            ),//illustration
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Divider(
                height: 4,
                thickness: 2,
                color: Colors.black54,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.favorite_rounded,size: 24.0,color: Colors.red),
                      Padding(padding: const EdgeInsets.only(left: 5),
                        child:Text('$like Likes',style: const TextStyle(color: Colors.black,fontSize: 13),) ,
                      ),//like et icon like
                    ],
                  ),
                  Row(
                    children: [
                      Transform.flip(flipX: true,
                      child: const Icon(Icons.comment_rounded,size: 24.0,color: Colors.blue),),
                      Padding(padding: const EdgeInsets.only(left: 5),
                      child:Text('$comment Commantaires',style: const TextStyle(color: Colors.black,fontSize: 13),)
                      ),//comment et icon comment
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
// Widget posts({
//   required context
// })
// {
//   return
//   Column(
//   children: [
//   publication(
//   context: context,
//   top: 10,
//   profil: Assets.assetsTangy,
//   image: Assets.assetsTest,
//   nom: '  Tangy',
//   text: 'Il y\'a 1 jour',
//   ilustration:'Bienvenu dans le monde de la programation',
//   like: 300,
//   comment: 135),
//   publication(
//   context: context,
//   top: 5,
//   profil: Assets.assetsYoo,
//   image: Assets.assetsNabi2,
//   nom: '  Yoo Seungwoo',
//   text: 'Il y\'a 3 heures',
//   ilustration: 'Best employee ever',
//   like: 650,
//   comment: 150),
// publication(
// context: context,
// top: 5,
// profil: Assets.assetsArtur,
// image: Assets.assetsHome,
// nom: '  Artur',
// text: 'Il y\'a 45 minutes',
// ilustration:'Finally back home',
// like: 400,
// comment: 200),
// publication(
// context: context,
// top: 5,
// profil: Assets.assetsArtur,
// image: Assets.assetsTbate,
// nom: '  Artur',
// text: 'Il y\'a 5 minutes',
// ilustration:'#The beginning after the end',
// like: 1045,
// comment: 850)
//   ],
//   );
// }


