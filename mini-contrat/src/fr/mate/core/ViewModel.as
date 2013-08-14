package fr.mate.core 
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	/**
	 * Base d'un view model correspondant à une vue.
	 */
	public class ViewModel extends EventDispatcher
	{
		/** Dispatcher pour l'envoie d'évènements dans un map */
		protected var dispatcher:IEventDispatcher;
		
		/**
		 * Constructeur prennant en paramètre un dispatcher.
		 * @param	dispatcher Dispatcher pour l'envoie d'évènements dans un map.
		 */
		public function ViewModel(dispatcher:IEventDispatcher) 
		{
			this.dispatcher = dispatcher;
		}
		
	}

}