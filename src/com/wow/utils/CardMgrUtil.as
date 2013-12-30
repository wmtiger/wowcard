package com.wow.utils
{
	import com.wow.common.model.CardModel;
	import com.wow.common.template.CardTemplate;
	import com.wow.common.utils.NormalUtil;
	import com.wow.common.vo.CardGroupVO;
	import com.wow.themes.UIAssets;

	public class CardMgrUtil
	{
		public function CardMgrUtil()
		{
		}
		
		/**
		 * 获取卡片管理中需要的卡组数据，列表显示用的
		 */	
		public static function getCardGroupObjList():Array
		{
			var items:Array = [];
			var vo:CardGroupVO = CardModel.instance.getCardGroups()[0] as CardGroupVO;
			var item:Object = {id:vo.id, text: vo.name, icon:UIAssets.instance.cardSmallFaceTexture};
			items.push(item);
			return items;
		}
		
		/**
		 * 获取卡片管理中需要的卡片的object数据，列表显示用的
		 */		
		public static function getAllCardObjList(arr:Array):Array
		{
			var items:Array = [];
			var l:int = arr.length;
			
			for(var i:int = 0; i < l; i++)
			{
				var temp:CardTemplate = CardTemplate.getTemp(arr[i].tid);
				var idx:int = hasRepeatTid(items, arr[i].tid); 
				if(idx >= 0)
				{
					items[idx].num++;
					items[idx].text = temp.name + " ×" + items[idx].num;
				}
				else
				{
					var item:Object = {id:i, tid:arr[i].tid, num:1, text: temp.name + " ×" + 1, icon:NormalUtil.getCardImgByTid(arr[i].tid)};
					items.push(item);
				}
			}
			return items;
		}
		private static function hasRepeatTid(arr:Array, tid:int):int
		{
			var l:int = arr.length;
			for(var i:int = 0; i < l; i++)
			{
				if(arr[i].tid == tid)
					return i;
			}
			return -1;
		}
		
	}
}