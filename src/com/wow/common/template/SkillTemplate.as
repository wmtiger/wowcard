package com.wow.common.template
{
	public class SkillTemplate
	{
		/**
		 * 此技能的tid，即：模板id
		 */		
		public var tid:int;
		/**
		 * 技能名字
		 */		
		public var name:String;
		/**
		 * 技能描述
		 */		
		public var desc:String;
		/**
		 * 技能类型，分为：战吼(1)；永续(2)；嘲讽(3)；毒药(4)；亡语(5)
		 */		
		public var type:int;
		/**
		 * 技能使用时的特效id
		 */		
		public var useEffectId:int;
		/**
		 * 技能使用时的音效id
		 */		
		public var useSndId:int;
		/**
		 * 使用后，被使用者的buff状态id
		 */		
		public var buffId:int;
		
		public function SkillTemplate()
		{
		}
	}
}