package fr.mate.sample.application 
{
	import flash.events.Event;
	/**
	 * Evènement de navigation entre les pages de l'application.
	 */
	public class ApplicationNavigationEvent extends Event
	{
		/** Nom de l'event. */
		public static const EVENT:String = "fr.mate.sample.application.ApplicationNavigationEvent";
		
		/** Nouvel état demandé lors de l'envoi de l'event. */
		private var _etat:String;
		
		/**
		 * Constructeur prenant en paramètre un état de l'application.
		 * Voir l'énumeration ApplicationStates pour connaitre la liste des états possibles.
		 * @param	etat Etat de l'application.
		 */
		public function ApplicationNavigationEvent(etat:String) 
		{
			super(EVENT);
			_etat = etat;
		}
		
		/**
		 * Nouvel état demandé lors de l'envoi de l'event.
		 */
		public function get etat():String {
			return _etat;
		}
		
		public override function clone():Event 
		{ 
			return new ApplicationNavigationEvent(this._etat);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ApplicationNavigationEvent", "_etat"); 
		}
	}

}