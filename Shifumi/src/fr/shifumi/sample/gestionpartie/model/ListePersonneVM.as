package fr.mate.sample.recherche.model
{
	import flash.events.IEventDispatcher;
	import fr.mate.core.ViewModel;
	import mx.collections.ArrayCollection;
	import fr.mate.sample.model.PersonneVo;
	import fr.mate.sample.recherche.events.SelectionPersonneEvent;
	
	/**
	 * UI d'affichage des résultats de la recherche de personnes.
	 */
	public class ListePersonneVM extends ViewModel
	{
		/**
		 * Résultat de la recherche effectuée à partir de l'écran RechercheUI.
		 * Contient des PersonneVo.
		 */
		[Bindable]
		public var resultatRecherche:ArrayCollection;
		
		/**
		 * Constructeur.
		 * @param	dispatcher Dispatcher. Voir ViewModel.
		 */
		public function ListePersonneVM(dispatcher:IEventDispatcher)
		{
			super(dispatcher);
		}
		
		/**
		 * Voir les contrats de la personne sélectionnée.
		 * @param	personne Personne sélectionnée.
		 */
		public function voirContrats(personne:PersonneVo):void
		{
			dispatcher.dispatchEvent(new SelectionPersonneEvent(personne));
		}
	}

}
