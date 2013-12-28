package com.wow.evt 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public class WmEvent extends Event 
	{
		public var data:Object = null;
		
		public function WmEvent(type:String, d:Object = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			data = d;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			//return super.clone();
			return new WmEvent(type, data, bubbles, cancelable);
		}
		
	}

}