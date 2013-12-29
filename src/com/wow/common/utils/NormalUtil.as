package com.wow.common.utils
{
	import com.wow.common.constant.Constant;
	
	import starling.utils.formatString;

	public class NormalUtil
	{
		public function NormalUtil()
		{
		}
		
		public static function searchCardById(arr:Array, id:int):Object
		{
			var idx:int = getCardObjectIdxById(arr,id);
			if(idx >= 0)
				return arr[idx];
			return null;
		}
		
		public static function getCardObjectIdxById(arr:Array, id:int):int
		{
			var l:int = arr.length;
			for(var i:int = 0; i < l; i++)
			{
				if(arr[i].id == id)
					return i;
			}
			return -1;
		}
		
		public static function getCardImgByTid(tid:int, type:String = "small"):String
		{
			return formatString(Constant.CARD_IMG_PATH, type,tid);
		}
	}
}