package fr.shifumi.sample.services 
{
	import fr.shifumi.sample.model.Choix;
	import fr.shifumi.sample.model.Partie;
	import mx.collections.ArrayCollection;
	
	/**
	 * Un service simulant un appel à un service web avec BlazeDS.
	 * Ce sample se concentre sur le framework Mate donc je ne souhaite pas couvrir les appels distants pour le moment.
	 */
	public class ShifumiMockService 
	{
		
		private var parties:ArrayCollection = new ArrayCollection();
		
		/**
		 * Constructeur.
		 */
		public function ShifumiMockService() 
		{
		}
		
		public function jouerPartie(partie:Partie):Partie {
			var score:Partie = new Partie();
			score.joueur = partie.joueur;
			score.ordinateur = partie.ordinateur;
			
			if (score.joueur == score.ordinateur) {
				// Les deux joueurs ont fait le même choix. Personne ne gagne.
			} else if ((score.joueur == Choix.CISEAUX && score.ordinateur == Choix.FEUILLE)
				|| (score.joueur == Choix.FEUILLE && score.ordinateur == Choix.PIERRE)
				|| (score.joueur == Choix.PIERRE && score.ordinateur == Choix.CISEAUX)){
				score.pointJoueur = 1;
			} else {
				score.pointOrdi = 1;
			}
			
			parties.addItem(score);
			return score;
		}
		
		public function getParties():ArrayCollection {
			return new ArrayCollection(parties.source);
		}
	}

}