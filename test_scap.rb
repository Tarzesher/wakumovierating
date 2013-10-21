<table with="500">
<t>
	<td>
		<h1>Movie searched: the internship</h1>
	</td>
</td>
<tr>
	<td><img src="http://www.userlogos.org/files/logos/mafi0z/IMDb.png" alt="IMDB"></td>
	<td><h1><%=	imdb = search_imdb("the internship") %> </h1> </td>
</tr>

<tr>
	<td><img src="http://www.userlogos.org/files/logos/The_Provider/metacritic_transparent_reflection.png" alt="meta_critic"></td>
	<td><h1><%= meta_critic = search_meta_critic("the internship") %>  </h1> </td>
</tr>


<tr>
	<td><img src="http://www.anexom.es/wp-content/uploads/2012/10/rotten-tomatoes.jpg" alt="rotten tomato"></td>
	<td><h1><%=	 rotten_tomato = search_rotten_tomato("the internship") %>  </h1> </td>
</tr>

<tr>
	<td><h1>Waku Movies Score </h1></td><td><h1>
	
	<%= 
	results = ((imdb.to_f + meta_critic.to_f  +  rotten_tomato.to_f ) / 3 ).to_f.round(2)
	
	if results <= 4.9
		"hmm #{results} rating not Waku's Favourate"
	else
		"Wow #{results} rating Waku's Favourate Movie, Watch it!!"
	end
	%>
	
	</h1></td>
</tr>

</table>