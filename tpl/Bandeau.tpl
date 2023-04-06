<header>
	<ul class="header">
		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="Accueil">
				<input type="hidden" name="typeLecture" value="{{typeLecture}}">
				<button class="accueil">Accueil</button>
			</form>
		</li>
		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="CV">
				<input type="hidden" name="typeLecture" value="{{typeLecture}}">
				<button class="c6">CV</button>
			</form>
		</li>
		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="Competence">
				<input type="hidden" name="typeLecture" value="{{typeLecture}}">
				<button class="c1">Compétences</button>
			</form>
		</li>

		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="Projet">
				<input type="hidden" name="typeLecture" value="{{typeLecture}}">
				<button class="c2">Projets</button>
			</form>
		</li>
		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="Credits">
				<input type="hidden" name="typeLecture" value="{{typeLecture}}">
				<button class="c3">Crédits</button>
			</form>
		</li>

		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="Contacts">
				<input type="hidden" name="typeLecture" value="{{typeLecture}}">
				<button class="c4">Contact</button>
			</form>
		</li>

		<li>
			<form action="deconnection.php" method="POST">
				<button class="c5">Quitter</button>
			</form>
		</li>
	</ul>
</header>