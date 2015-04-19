package jsp;

public class Session {
	private static String lastSessionId = "first";
	
	public static boolean isSameSession(String sessionID){
		if (lastSessionId == null) {
			lastSessionId = sessionID;
			return false;
		}
		else if(lastSessionId.equals("first")){
			return true;
		}
		
		else if (lastSessionId == sessionID){
			return true;
			
		}
		
		else return false;
		}
	
	public static void setlastSessionId(String value){
		lastSessionId = value;
	}
	}