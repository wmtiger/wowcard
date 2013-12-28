package com.wow.setting
{
	public class Setting
	{
		public static const LOGIN:String = "login";
		public static const CREATE_ROLE:String = "createRole";
		public static const CARD_MGR:String = "cardMgr";
		public static const USER:String = "user";
		public static const FRIEND:String = "friend";
		public static const ONE_FRIEND:String = "oneFriend";
		public static const EDIT_CARD_GROUP:String = "editCardGroup";
		public static const BATTLE_FIELD:String = "battleField";
		
		public static const SHOW_LOGIN:String = "showLogin";
		public static const SHOW_CREATE_ROLE:String = "showCreateRole";
		public static const SHOW_CARD_MGR:String = "showCardMgr";
		public static const SHOW_USER:String = "showUser";
		public static const SHOW_FRIEND:String = "showFriend";
		public static const SHOW_ONE_FRIEND:String = "showOneFriend";
		public static const SHOW_EDIT_CARD_GROUP:String = "showEditCardGroup";
		public static const SHOW_BATTLE_FIELD:String = "showBattleField";
		
		public static var STAGE_WIDTH:int;
		public static var STAGE_HEIGHT:int;
		
		public static const LOGIN_EVENTS:Object =
			{
				showCreateRole: CREATE_ROLE,
				showBattleField: BATTLE_FIELD,
				showUser: USER
			};
		public static const CREATE_ROLE_EVENTS:Object =
			{
				showUser: USER
			};
		public static const CARD_MGR_EVENTS:Object =
			{
				showUser: USER,
				showEditCardGroup: EDIT_CARD_GROUP,
				showBattleField: BATTLE_FIELD
			};
		public static const EDIT_CARD_GROUP_EVENTS:Object =
			{
				showCardMgr: CARD_MGR,
				showBattleField: BATTLE_FIELD
			};
		public static const USER_EVENTS:Object =
			{
				showCardMgr: CARD_MGR,
				showFriend: FRIEND,
				showBattleField: BATTLE_FIELD
			};
		public static const FRIEND_EVENTS:Object =
			{
				showUser: USER,
				showOneFriend: ONE_FRIEND
			};
		public static const ONE_FRIEND_EVENTS:Object =
			{
				showFriend: FRIEND,
				showBattleField: BATTLE_FIELD
			};
		public static const BATTLE_FIELD_EVENTS:Object =
			{
				showBattleField: BATTLE_FIELD,
				showCardMgr: CARD_MGR
			};
		
		public function Setting()
		{
		}
	}
}