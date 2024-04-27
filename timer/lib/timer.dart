class Timer{
  final int timeInSeconds;
  const Timer({required this.timeInSeconds});
  
  
  Stream<int> tick(){
    Stream<int> values = Stream.periodic(const Duration(seconds: 1),(x)=>timeInSeconds-x-1).take(timeInSeconds);
    return values;
  }


}