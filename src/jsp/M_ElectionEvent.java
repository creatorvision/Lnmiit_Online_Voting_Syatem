package jsp;

import java.sql.*;
import java.util.ArrayList;

public class M_ElectionEvent {

	public boolean createEE(String EE, java.sql.Date date,
			java.sql.Time startTime, java.sql.Time endTime,
			ArrayList<String> positions) {

		Connection c = null;
		ResultSet rs = null;
		Statement st = null;
		try {
			c = MySQL.connect();
			st = c.createStatement();
			String query = "insert into electionevent values (null,'" + EE
					+ "','" + date + "','" + startTime + "','" + endTime
					+ "');";
			System.out.println(query);
			st.executeUpdate(query);

			query = "select LAST_INSERT_ID()";
			if (c != null) {
				st = c.createStatement();
				rs = st.executeQuery(query);
			}

			int eid = 0;

			while (rs.next())
				eid = rs.getInt(1);

			for (String position : positions) {

				if (position.equals("P") || position.equals("VP")
						|| position.equals("GSP") || position.equals("GSC")
						|| position.equals("GSSP"))
					query = "insert into positions values (" + eid + ",'"
							+ position + "','all');";

				else
					query = "insert into positions values (" + eid + ",'"
							+ position + "','" + position + "');";
				System.out.println(query);

				if (c != null) {
					st = c.createStatement();
					st.executeUpdate(query);
				}

			}

			st.close();
			rs.close();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {

			MySQL.close(c);
		}

	}

	public boolean updateEE(String EE, java.sql.Date date,
			java.sql.Time startTime, java.sql.Time endTime,
			ArrayList<String> positions) {

		boolean isdeleted = deleteEE(EE);
		boolean iscreated = false;

		if (isdeleted) {
			iscreated = createEE(EE, date, startTime, endTime, positions);

			if (iscreated) {
				return true;
			}

			else
				return false;
		}

		else
			return false;
	}

	public boolean deleteEE(String EE) {

		Connection c = null;
		try {
			c = MySQL.connect();
			Statement st = c.createStatement();
			String query = "delete from electionevent where name = '" + EE
					+ "'";
			st.executeUpdate(query);
			st.close();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {

			MySQL.close(c);
		}

	}

	public ArrayList<String> getEE() {

		Connection c = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<String> r = new ArrayList<String>();
		//r.add("test");
		try {
			c = MySQL.connect();
			st = c.createStatement();
			String query = "select name from electionevent";
			System.out.println(query);
			rs = st.executeQuery(query);

			while (rs.next()) {
				String t = rs.getString(1);
				System.out.println(t);
				r.add(t);
			}
			return r;

		} catch (Exception e) {
			e.printStackTrace();
			return r;
		}
	}

}