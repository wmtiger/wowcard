package com.wow.common.template
{
	public class BuffTemplate
	{
		/**
		 * 此Buff的tid，即：模板id
		 */		
		public var tid:int;
		/**
		 * Buff名字
		 */		
		public var name:String;
		/**
		 * Buff描述
		 */		
		public var desc:String;
		/**
		 * 承受Buff者的特效id
		 */		
		public var buffEffectId:int;
		
		public function BuffTemplate()
		{
		}
	}
}