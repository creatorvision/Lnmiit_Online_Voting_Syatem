package jsp;

public class Session {
	private static String lastSessionId[] = new String[2000];

	public static boolean isSameSession(String sessionID, int index) {
		if (lastSessionId[index] == null) {
			lastSessionId[index] = sessionID;
			return false;
		} else if (lastSessionId[index].equals("first")) {
			return true;
		}

		else if (lastSessionId[index] == sessionID) {
			return true;

		}

		else
			return false;
	}

	public static void setlastSessionId(String value, int index) {
		lastSessionId[index] = value;
	}
}
