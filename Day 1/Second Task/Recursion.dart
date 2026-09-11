import 'dart:io';

void main()
{

  String Word ;
  Word = stdin.readLineSync().toString() ;

  print(Count_Vowels(0, 0, Word.length, Word)) ;

}


int? Count_Vowels(int idx  , int counter , int length , String Word)
{

  // base case
  if(idx==length)
  {
    return counter ;
  }
  
  // Recursive case
  else
  {
    if(Word[idx]=='a'
    ||Word[idx]=='e'
    ||Word[idx]=='i'
    ||Word[idx]=='o'
    ||Word[idx]=='u')
    {

      return Count_Vowels(++idx, ++counter, length, Word) ;

    }

    else
    {
      
      return Count_Vowels(++idx, counter, length, Word) ;

    }

  }



}