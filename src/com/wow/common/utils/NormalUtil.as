package com.wow.common.utils
{
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
		
		//test
		public static function getCardImgByTid(tid:int, type:String = "small"):String
		{
			var s:String="";
			if(tid == 1)
				s = "/assets/images/cards/"+type+"/jbubing.jpg";
			else if(tid == 2)
				s = "/assets/images/cards/"+type+"/jgongbing.jpg";
			else if(tid == 3)
				s = "/assets/images/cards/"+type+"/jhuangjinzei.jpg";
			else if(tid == 4)
				s = "/assets/images/cards/"+type+"/jmenghubing.jpg";
			else if(tid == 5)
				s = "/assets/images/cards/"+type+"/jqiangbing.jpg";
			else if(tid == 6)
				s = "/assets/images/cards/"+type+"/jqibing.jpg";
			else if(tid == 7)
				s = "/assets/images/cards/"+type+"/jtengjiabing.jpg";
			else if(tid == 8)
				s = "/assets/images/cards/"+type+"/jtieqibing.jpg";
			return s;
		}
	}
}