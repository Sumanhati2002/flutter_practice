abstract class InternetEvent{

}

//internet not present
class InternetLostEvent extends InternetEvent{

}
//internet present
class InternetGainEvent extends InternetEvent{

}











//there are no connection between InternetLostEvent and InternetGainEvent so to keep connection
//between two event you have to create another class named InternetEvent and extend both class
// so we are not going to use InternetEvent so make it as abstract class
//after that you have to create a state and there should be state
//-- initial-state and for each event there should be each state
// after these step create bloc








