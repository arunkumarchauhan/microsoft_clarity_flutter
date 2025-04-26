class ClarityConfig{
final LogLevel logLevel;
final String projectId;
String ? userId;

  ClarityConfig({required this.logLevel, required this.projectId,this.userId});
Map<String,String?>toMap(){
  return {
    "projectID":projectId,
    "userID":userId,
    "logLevel":logLevel.name
  };
}
}
enum LogLevel{ Info,Debug,Error,Verbose,Warning,None}