<%@ page import="java.sql.*"%>
<%@ page import="com.zubiri.matches.*"%>

<%
	try {
		

		if (request.getParameter("btn_update_teams") != null) //check button click event not null
		{
			FootballTeam team = new FootballTeam();
			team.setName(request.getParameter("txt_team_name"));
			team.setStadium(request.getParameter("txt_team_stadium"));
			team.setWonLeagues(Integer.parseInt(request.getParameter("txt_team_leagues")));
			team.setShirtColor(request.getParameter("txt_team_shirt"));
			Connect.modifyTeam(team);
			
			out.println("Update Successfully...! Click Back link."); //after update record successfully message
			
		}
		if (request.getParameter("btn_update_players") != null) //check button click event not null
		{
			
			Player player = new Player();
			
			player.setName(request.getParameter("txt_player_name"));
			player.setTeam(request.getParameter("txt_player_team"));
			player.setAge(Integer.parseInt(request.getParameter("txt_player_age")));
			player.setHeight(Integer.parseInt(request.getParameter("txt_player_height")));
			
			Connect.modifyPlayer(player);
			
			out.println("Update Successfully...! Click Back link."); //after update record successfully message

		}
		if (request.getParameter("btn_update_matches") != null) //check button click event not null
		{
			
			
			FootballMatch match = new FootballMatch();
			FootballTeam team = new FootballTeam();
			FootballTeam team2 = new FootballTeam();
			
			team.setName(request.getParameter("txt_matches_lteam"));
			match.setLocalTeam(team);
			team2.setName(request.getParameter("txt_matches_vteam"));
			match.setVisitorTeam(team2);
			match.setGoalsVisitor(Integer.parseInt(request.getParameter("txt_matches_vgoals")));
			match.setGoalsLocal(Integer.parseInt(request.getParameter("txt_matches_lgoals")));
			match.setMatchID(Integer.parseInt(request.getParameter("txt_matches_matchID")));
			
			Connect.modifyMatch(match);
			
			out.println("Update Successfully...! Click Back link."); //after update record successfully message

		}
	}

	catch (

	Exception e) {
		out.println(e);
	}
%>

<html>

<head>

<title>Update</title>

<!--css for div main class and table-->
<style type="text/css">
.main {
	width: 700px;;
	margin-left: 250px;
	padding: 10px;
	border: 5px solid grey;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 600px;
}

td {
	border: 5px solid silver;
	text-align: left;
	padding: 8px;
}

a {
	text-decoration: none;
}
</style>

</head>

<body>

	<div class="main">

		<form method="post" name="myform"">

			<h1>Update</h1>

			<table>
				<%
					try {
					
							if (request.getParameter("edit") != null) {

					ResultSet rs;
					String name = request.getParameter("edit");
							switch (request.getParameter("selection")) {

							case "teams":
								
								rs=Connect.getTeam(name);
						
								rs.first();
								String stadium = rs.getString(2);
								int wonLeagues = rs.getInt(3);
								String shirtColor = rs.getString(4);
				%>
				<tr>
					<td>Name</td>
					<td><input type="text" name="txt_team_name" value="<%=name%>"></td>
				</tr>

				<tr>
					<td>Stadium</td>
					<td><input type="text" name="txt_team_stadium"
						value="<%=stadium%>"></td>
				</tr>

				<tr>
					<td>Won Leagues</td>
					<td><input type="text" name="txt_team_leagues"
						value="<%=wonLeagues%>"></td>
				</tr>

				<tr>
					<td>Shirt Color</td>
					<td><input type="text" name="txt_team_shirt"
						value="<%=shirtColor%>"></td>
				</tr>

				<tr>
					<td><input type="submit" name="btn_update_teams"
						value="Update"></td>
				</tr>

			</table>
			<a href="index.jsp?selection=teams"><input type="button"
				value="Back"></a>


			<%
				break;
						case "players":
							rs=Connect.getPlayer(name);
							rs.next();
							String team = rs.getString(2);
							int age = rs.getInt(3);
							int height = rs.getInt(4);
			%>
			<tr>
				<td>Name</td>
				<td><input type="text" name="txt_player_name" value="<%=name%>"></td>
			</tr>

			<tr>
				<td>Team</td>
				<td><input type="text" name="txt_player_team" value="<%=team%>"></td>
			</tr>

			<tr>
				<td>Age</td>
				<td><input type="text" name="txt_player_age" value="<%=age%>"></td>
			</tr>

			<tr>
				<td>Height</td>
				<td><input type="text" name="txt_player_height"
					value="<%=height%>"></td>
			</tr>

			<tr>
				<td><input type="submit" name="btn_update_players"
					value="Update"></td>
			</tr>
			<input type="hidden" name="matchID">
			</table>
			<a href="index.jsp?selection=players"><input type="button"
				value="Back"></a>


			<%
				break;
						case "matches":
							rs=Connect.getMatch(name);
							rs.next();
							int matchID = rs.getInt(1);
							String localTeam = rs.getString(2);
							int goalsLocal = rs.getInt(5);
							String visitorTeam = rs.getString(3);
							int goalsVisitor = rs.getInt(4);
			%>
			<tr>
				<td>Local team</td>
				<td><input type="text" name="txt_matches_lteam"
					value="<%=localTeam%>"></td>
			</tr>

			<tr>
				<td>Goals local</td>
				<td><input type="text" name="txt_matches_lgoals"
					value="<%=goalsLocal%>"></td>
			</tr>

			<tr>
				<td>Goals visitor</td>
				<td><input type="text" name="txt_matches_vgoals"
					value="<%=goalsVisitor%>"></td>
			</tr>

			<tr>
				<td>Visitor team</td>
				<td><input type="text" name="txt_matches_vteam"
					value="<%=visitorTeam%>"></td>
			</tr>

			<tr>
				<td><input type="submit" name="btn_update_matches"
					value="Update"></td>
			</tr>

			<input type="hidden" name="txt_matches_matchID" value="<%=matchID%>">

			</table>

			<a href="index.jsp?selection=matches"><input type="button"
				value="Back"></a>
			<%
				break;
						}
					}
				} catch (Exception e) {
					out.println(e);
				}
			%>

		</form>

	</div>

</body>

</html>