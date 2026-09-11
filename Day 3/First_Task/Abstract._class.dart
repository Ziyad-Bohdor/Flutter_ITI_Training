void main ()
{

  Car car = Car() ;

  car.Start();
  car.Stop();

  print("==========================");

  Bike bike = Bike() ;

  bike.Start();
  bike.Stop();

}

abstract class Vehicle
{
  // Abstract Method
  void Start();
  void Stop();

}

class Car extends Vehicle 
{

 @override
  void Start()
  {
    print("Start Car");
  }

 @override

  void Stop()
  {
    print("Stop Car");
  }
}

class Bike extends Vehicle 
{

   @override
  void Start()
  {
    print("Bike Start");
  }

 @override

  void Stop()
  {
    print("Bike Stop");
  }


} 