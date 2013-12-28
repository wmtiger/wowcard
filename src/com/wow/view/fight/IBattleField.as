package com.wow.view.fight
{
	public interface IBattleField
	{
		function addToArmyField(id:int, from:int = 1):void;
		function removeFromArmyField(id:int):void;
		function addToHands(num:int = 1, from:int = 0, id:int = -1):void;
		function removeFromHands(id:int):void;
	}
}