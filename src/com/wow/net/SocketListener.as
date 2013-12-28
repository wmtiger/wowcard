package com.wow.net 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author wmTiger
	 */
	public class SocketListener 
	{
		private static var _instance:SocketListener;
		
		private var _dict:Dictionary;
		
		public function SocketListener() 
		{
			_dict = new Dictionary();
		}
		
		static public function get instance():SocketListener 
		{
			if (_instance == null) 
			{
				_instance = new SocketListener();
			}
			return _instance;
		}
		
		public function regListener(cmd:String, callBack:Function, args:Array = null):void
		{
			if (_dict[cmd] == null) 
			{
				_dict[cmd] = callBack;
			}
		}
		
		public function doCallBack(param:Object):void
		{
			var fun:Function = _dict[param.cmd];
			if (fun != null) 
			{
				fun.call(null, param);
			}
		}
		
	}

}