package fr.shifumi.sample.gestionpartie.views.components 
{
	import flash.events.Event;
	import fr.shifumi.sample.model.Choix;
	
	/**
	 * Evenment soulevé lorsque le joueur a effectué un nouveau Choix.
	 * @author Quentin PROUST
	 */
	public class NouveauChoixEvent extends Event 
	{
		public static const EVENT_NAME:String = "fr.shifumi.sample.gestionpartie.views.components.NouveauChoixEvent.event";
	
		public var choix:Choix;
		
		public function NouveauChoixEvent(choix:Choix) 
		{ 
			super(EVENT_NAME, false, false);
			
			this.choix = choix;
			
		} 
		
		public override function clone():Event 
		{ 
			return new NouveauChoixEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("NouveauChoixEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}