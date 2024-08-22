import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/setting_provider.dart';
import '../../../widgets/build_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PerSonScreen extends StatefulWidget {
    const PerSonScreen({super.key});

  static const String routeName= "PersonScreen";

  @override
  State<PerSonScreen> createState() => _PerSonScreenState();
}

class _PerSonScreenState extends State<PerSonScreen> {
    bool darkSwitch = false;
    bool arSwitch = false;
    late SettingProvider provider;

  @override
  Widget build(BuildContext context) {
     provider= Provider.of(context);
    return Scaffold(
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Image(image: AssetImage("assets/images/profile_image.jpg"),
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Abdelrhman", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 6,),
                        const Text("abdelrhman1@gmail.com"),
                        const SizedBox(height: 6,),
                        TextButton(onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green),),
                            child: const Text("Edit profile", style: TextStyle(fontSize: 22,color: Colors.white),))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              BuildRow(icon: Icons.favorite_border,text:AppLocalizations.of(context)!.favorites,iconData: Icons.arrow_forward_ios_outlined,),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              BuildRow(icon: Icons.sim_card_download,text: AppLocalizations.of(context)!.download,iconData: Icons.arrow_forward_ios_outlined,),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              buildRowOption(AppLocalizations.of(context)!.language, arSwitch, (newValue)
              {
                arSwitch =newValue ;
                if(arSwitch){
                  provider.setCurrentProvider("ar");
                }else{
                  provider.setCurrentProvider("en");
                }
                setState(() {});
              }),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              buildRowOption(AppLocalizations.of(context)!.appTheme, darkSwitch, (newValue)
              {
                darkSwitch =newValue ;
                if(darkSwitch){
                  provider.setCurrentMode(ThemeMode.dark);
                }else {
                  provider.setCurrentMode(ThemeMode.light);
                }
                setState(() {});
              }),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              BuildRow(icon: Icons.location_on,text: AppLocalizations.of(context)!.location,iconData: Icons.arrow_forward_ios_outlined,),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              BuildRow(icon: Icons.subscriptions,text: AppLocalizations.of(context)!.subscription,iconData: Icons.arrow_forward_ios_outlined,),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              BuildRow(icon: Icons.watch_later,text: AppLocalizations.of(context)!.clearHistory,iconData: Icons.arrow_forward_ios_outlined,),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              BuildRow(icon: Icons.logout,text: AppLocalizations.of(context)!.logout,iconData: Icons.arrow_forward_ios_outlined,),

            ],
          ),
        ),
      ),
    );
  }

   Widget buildRowOption(String title , bool switchValue, Function(bool) onChanged) {
     return Row(
       children: [
         const Icon(Icons.dark_mode, size: 40, color: Colors.black,),
         const SizedBox(width: 18),
         Text(title, style:const TextStyle(color: Colors.black, fontSize: 26,fontWeight: FontWeight.w500),),
         const Spacer(),
         Switch(value: switchValue, onChanged: onChanged, activeColor: Colors.blue,)
       ],
     );
   }
}

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget{
  const BuildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.arrow_back_ios, color: Colors.black,size: 28),
      title: const Text("My Profile", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.black),),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.settings, color: Colors.black,size: 34,),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Switch(value: true, onChanged: (value)
          {

          })
        ],
      ),
    );
  }
}
