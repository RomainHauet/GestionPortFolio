{% for cv in CV %}
	<div class="cadre">
		<div class="cv">
			<div class="flex">
				<div class="nom">
					<h1>GOULEY<br />Logann<br />20 ans</h1>
				</div>
				<div class="description">
					<h4>description</h4>
					<p>{{cv.getDescription()}}</p>
				</div>
				<div class="formation">
					<h3>
						<center>Formation</center>
					</h3>
					<ul class="infos">
						<p>{{cv.getDiplome()}}</p>
					</ul>
				</div>
			</div>

			<div class="flex">
				<div class="photo">
					<img src="./images/photo_CV.jpg" alt="photo du CV, quelqu'un de magnifique">
				</div>
				<div class="competences">
					<h3>
						<center>Compétences</center>
					</h3>
					<ul class="infos">
						<p> {{cv.getCompetence()}} </p>
					</ul>
				</div>
				<div class="projets">
					<h3>
						<center>Projets</center>
					</h3>
					<ul class="infos">
						<p>{{cv.getExperience()}}</p>
					</ul>
				</div>
			</div>
		</div>
	</div>
{% endfor %}