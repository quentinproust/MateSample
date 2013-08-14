package fr.mate.sample.recherche.manager
{
	import flash.events.IEventDispatcher;
	import fr.mate.sample.application.*;
	import fr.mate.sample.model.PersonneVo;
	import fr.mate.sample.recherche.events.SelectionPersonneEvent;
	import mx.controls.Alert;
	import mx.collections.ArrayCollection;
	
	/**
	 * Manager contenant le code business de la recherche (coté client).
	 */
	public class RechercheManager
	{
		/**
		 * Dispatcher pour envoyer des evenements vers la map.
		 */
		private var _dispatcher:IEventDispatcher;
		
		[Bindable]
		public var resultatRecherche:ArrayCollection;
		
		[Bindable]
		public var personneSelectionnee:PersonneVo;
		
		/**
		 * Constructeur.
		 * @param	dispatcher Dispatcher (correspond à celui de la map de la recherche).
		 */
		public function RechercheManager(dispatcher:IEventDispatcher)
		{
			_dispatcher = dispatcher;
		}
		
		/**
		 * Chargement des résultats de la recherche dans le manager.
		 * Si une seule personne a été trouvée dans la recherche, on sélectionne cette personne (envoie d'un event SelectionPersonneEvent).
		 * Sinon, on redirige vers la liste des personnes.
		 * @param	resultatRecherche
		 */
		public function chargerResultatRecherche(resultatRecherche:ArrayCollection):void
		{
			trace("Nombre de personnes trouvées : " + resultatRecherche.length);
			
			if (resultatRecherche == null || resultatRecherche.length <= 0)
			{
				Alert.show("Aucun résultat pour cette recherche");
			}
			else if (resultatRecherche.length == 1)
			{
				this.resultatRecherche = resultatRecherche;
				var personne:PersonneVo = PersonneVo(resultatRecherche.getItemAt(0));
				
				_dispatcher.dispatchEvent(new SelectionPersonneEvent(personne));
			}
			else
			{
				this.resultatRecherche = resultatRecherche;
				_dispatcher.dispatchEvent(new ApplicationNavigationEvent(ApplicationStates.LISTE_PERSONNES));
			}
		}
		
		/**
		 * Sélection d'une personne.
		 * Si aucun contrat n'est trouvé, on informe l'utilisateur.
		 * Sinon, on redirige vers la liste des contrats.
		 * @param	personne Personne qui a été sélectionnée.
		 */
		public function selectionPersonne(personne:PersonneVo):void
		{
			if (personne != null && personne.contrats.length > 0)
			{
				trace("Nombre de contrats : " + personne.contrats.length);
				
				personneSelectionnee = personne;
				_dispatcher.dispatchEvent(new ApplicationNavigationEvent(ApplicationStates.LISTE_CONTRATS));
			}
			else
			{
				Alert.show("La personne ne possède aucun contrat.");
			}
		}
	}

}