package com.wow.mgr
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	public class EvtMgr extends EventDispatcher 
	{
		private static var _instance:EvtMgr;
		
		public function EvtMgr(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function get instance():EvtMgr
		{
			if(_instance == null)
				_instance = new EvtMgr();
			return _instance;
		}
		
	}
}