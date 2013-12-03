package com.wow.setting
{
	public class Setting
	{
		public static const LOGIN:String = "login";
		public static const CREATE_ROLE:String = "createRole";
		public static const CARD_MGR:String = "cardMgr";
		public static const FRIEND:String = "friend";
		public static const SEARCH_FIGHTER:String = "searchFighter";
		public static const BATTLE_FIELD:String = "battleField";
		public static const BATTLE_OVER:String = "battleOver";
		
		public static const LOGIN_EVENTS:Object =
			{
//				showLogin: LOGIN
				showCreateRole: CREATE_ROLE
			};
		public static const CREATE_ROLE_EVENTS:Object =
			{
//				showCreateRole: CREATE_ROLE
				showCardMgr: CARD_MGR
			};
		public static const CARD_MGR_EVENTS:Object =
			{
//				showCardMgr: CARD_MGR
				showFriend: FRIEND,
				showSearchFighter: SEARCH_FIGHTER
			};
		public static const FRIEND_EVENTS:Object =
			{
				showCardMgr: CARD_MGR
//				showSearchFighter: SEARCH_FIGHTER
			};
		public static const SEARCH_FIGHTER_EVENTS:Object =
			{
//				showSearchFighter: SEARCH_FIGHTER
				showCardMgr: CARD_MGR,
				showBattleField: BATTLE_FIELD
			};
		public static const BATTLE_FIELD_EVENTS:Object =
			{
//				showBattleField: BATTLE_FIELD
				showBattleOver: BATTLE_OVER
			};
		public static const BATTLE_OVER_EVENTS:Object =
			{
//				showBattleOver: BATTLE_OVER
				showBattleField: BATTLE_FIELD,
				showCardMgr: CARD_MGR
			};
		
		public function Setting()
		{
		}
	}
}