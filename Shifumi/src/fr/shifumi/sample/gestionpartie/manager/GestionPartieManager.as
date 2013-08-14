package fr.shifumi.sample.gestionpartie.manager
{
	import flash.events.IEventDispatcher;
	import fr.shifumi.sample.application.*;
	import mx.controls.Alert;
	import mx.collections.ArrayCollection;
	
	/**
	 * Manager contenant le code business de la recherche (coté client).
	 */
	public class GestionPartieManager
	{
		/**
		 * Dispatcher pour envoyer des evenements vers la map.
		 */
		private var _dispatcher:IEventDispatcher;
		
		/**
		 * Constructeur.
		 * @param	dispatcher Dispatcher (correspond à celui de la map de la recherche).
		 */
		public function GestionPartieManager(dispatcher:IEventDispatcher)
		{
			_dispatcher = dispatcher;
		}
		
	}

}