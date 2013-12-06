package com.wow.mgr
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class GameMgr
	{
		private static var _instance:GameMgr;
		
		private var settingFile:File;
		private var fs:FileStream;
		
		public function GameMgr()
		{
			settingFile = File.applicationStorageDirectory.resolvePath("setting");
			fs = new FileStream();
		}
		
		public static function get instance():GameMgr
		{
			if(_instance == null)
				_instance = new GameMgr();
			return _instance;
		}
		
		public function saveDataToSetting(key:String, data:Object):void
		{
			try
			{
				fs.open(settingFile,FileMode.UPDATE);
				fs.writeUTF(data as String);
				fs.close();
			}
			catch(e:Error)
			{
				fs.close();
			}
		}
		
		public function getDataFromSetting():Object
		{
			var str:String;
			try
			{
				fs.open(settingFile,FileMode.READ);
				str = fs.readUTF();
				fs.close();
			}
			catch(e:Error)
			{
				fs.close();
			}
			return str;
		}

	}
}