mixin MixinOne 
{
  printCurrent_State(){
    print("Current State");
  }
}

class Admin with MixinOne 
{

  printstate() {
    print("Connected");
  }

}


class User extends Admin
{
  @override
  printstate() {
    print("disConnected");
  }

}
void main()
{

  Admin Ad = Admin();
  Ad.printCurrent_State();
  Ad.printstate();

  print("========================");

  User user = User();
  user.printCurrent_State();
  user.printstate();

}