package fr.mate.sample.recherche.manager
{
	import flash.events.IEventDispatcher;
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
		
		/**
		 * Constructeur.
		 * @param	dispatcher Dispatcher (correspond à celui de la map de la recherche).
		 */
		public function RechercheManager(dispatcher:IEventDispatcher)
		{
			_dispatcher = dispatcher;
		}
	
		public function loadResultatRecherche(resultatRecherche:ArrayCollection):void {
			this.resultatRecherche = resultatRecherche;
			
			trace("Nombre de personnes trouvées : " + resultatRecherche.length);
		}
	}

}