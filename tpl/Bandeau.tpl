<header>
	<ul class="header">
		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="accueil">
				<button class="accueil">Accueil</button>
			</form>
		</li>
		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="cv">
				<button class="c6">CV</button>
			</form>
		</li>
		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="competence">
				<button class="c1">Compétences</button>
			</form>
		</li>

		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="projet">
				<button class="c2">Projets</button>
			</form>
		</li>
		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="credits">
				<button class="c3">Crédits</button>
			</form>
		</li>

		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="contact">
				<button class="c4">Contact</button>
			</form>
		</li>

		<li>
			<form action="GestionRedirection.php" method="POST">
				<input type="hidden" name="identifiant" value="{{identifiant}}">
				<input type="hidden" name="page" value="">
				<button class="c5">Quitter</button>
			</form>
		</li>
	</ul>
</header>