package com.wow.common.utils
{
	import com.wow.common.cfg.CardConfig;
	import com.wow.common.model.CardModel;
	import com.wow.common.template.CardTemplate;
	import com.wow.common.vo.CardVO;

	public class CfgUtil
	{
		public function CfgUtil()
		{
		}
		
		public static function testCardVO():void
		{
			//设置我所有的卡
			var l:int = CardConfig.instance.cfg.length;
			for(var i:int = 0; i < 60; i++)
			{
				var vo:CardVO = makeCardVO(i, CardConfig.instance.cfg[int(Math.random() * l)].tid);
				CardModel.instance.addCardInAll(vo);
			}
		}
		private static function makeCardVO(id:int, tid:int, cost:int = 0, atk:int = 0, hp:int = 0, buffs:Array = null):CardVO
		{
//			var temp:CardTemplate = CardTemplate.getTemp(tid);
			var vo:CardVO = new CardVO();
			vo.id = id;
			vo.tid = tid;
			vo.cost = cost;
			vo.atk = atk;
			vo.hp = hp;
			vo.buffs = buffs;
			return vo;
		}
		
		public static function testCardTemp():void
		{
			CardConfig.instance.cfg.push(makeCardTemp(10001,"步兵","普通的步兵",1,5,10001,1,1,1));
			CardConfig.instance.cfg.push(makeCardTemp(10002,"弓兵","普通的弓兵",1,5,10002,1,2,1));
			CardConfig.instance.cfg.push(makeCardTemp(10003,"黄巾贼","普通的黄巾贼",1,5,10003,2,2,2));
			CardConfig.instance.cfg.push(makeCardTemp(10004,"猛虎兵","普通的猛虎兵",1,5,10004,3,3,3));
			CardConfig.instance.cfg.push(makeCardTemp(10005,"枪兵","普通的枪兵",1,5,10005,3,3,2));
			CardConfig.instance.cfg.push(makeCardTemp(10006,"骑兵","普通的骑兵",1,5,10006,4,4,4));
			CardConfig.instance.cfg.push(makeCardTemp(10007,"藤甲兵","普通的藤甲兵",1,5,10007,4,3,5));
			CardConfig.instance.cfg.push(makeCardTemp(10008,"铁骑兵","普通的铁骑兵",1,5,10008,5,5,5));
			
			var l:int = CardConfig.instance.cfg.length;
			for(var i:int = 0; i < l; i++)
				CardConfig.instance.dict[CardConfig.instance.cfg[i].tid] = CardConfig.instance.cfg[i];
		}
		private static function makeCardTemp(tid:int,name:String,desc:String,type:int,camp:int,imgId:int,
											 cost:int=1,atk:int=1,hp:int=1,quality:int=0,keywords:String="",creation:int=0,
											 split:int=0,skillId:Array=null,imgEffectId:int=0,atkSndId:int=0,deadSndId:int=0,
											 joinFieldSndId:int=0,joinFieldEffectId:int=0):CardTemplate
		{
			var t:CardTemplate = new CardTemplate();
			t.tid = tid;
			t.name = name;
			t.desc = desc;
			t.type = type;
			t.camp = camp;
			t.imgId = imgId;
			t.cost = cost;
			t.atk = atk;
			t.hp = hp;
			t.quality = quality;
			t.keywords = keywords;
			t.creation = creation;
			t.split = split;
			t.skillIds = skillId;
			t.imgEffectId = imgEffectId;
			t.atkSndId = atkSndId;
			t.deadSndId = deadSndId;
			t.joinFieldSndId = joinFieldSndId;
			t.joinFieldEffectId = joinFieldEffectId;
			return t;
		}
	}
}