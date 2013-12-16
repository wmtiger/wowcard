package com.wow.view.game
{
	import com.wow.setting.Setting;
	import com.wow.themes.WowCardTheme;
	import com.wow.view.cardsmgr.CardsMgrScreen;
	import com.wow.view.cardsmgr.EditCardGroupScreen;
	import com.wow.view.craeterole.CreateRoleScreen;
	import com.wow.view.fight.BattleFieldScreen;
	import com.wow.view.friend.FriendScreen;
	import com.wow.view.friend.OneFriendScreen;
	import com.wow.view.login.LoginScreen;
	import com.wow.view.user.UserScreen;
	
	import feathers.controls.Drawers;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.events.FeathersEventType;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	
	import starling.events.Event;
	
	public class Game extends Drawers
	{
		private var _navigator:ScreenNavigator;
		private var _transitionManager:ScreenSlidingStackTransitionManager;
		private var _login:LoginScreen;
		
		public function Game()
		{
			super();
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}
		
		private function initializeHandler(event:Event):void
		{
			Setting.STAGE_WIDTH = stage.stageWidth;
			Setting.STAGE_HEIGHT = stage.stageHeight;
			
			new WowCardTheme();
			
			this._navigator = new ScreenNavigator();
			this.content = this._navigator;
			
			this._transitionManager = new ScreenSlidingStackTransitionManager(this._navigator);
			this._transitionManager.duration = 0.4;
			
			this._navigator.addScreen(Setting.LOGIN, new ScreenNavigatorItem(LoginScreen, Setting.LOGIN_EVENTS));
			
			this._navigator.addScreen(Setting.CREATE_ROLE, new ScreenNavigatorItem(CreateRoleScreen, Setting.CREATE_ROLE_EVENTS));

			const idx:Object = {};
			this._navigator.addScreen(Setting.CARD_MGR, new ScreenNavigatorItem(CardsMgrScreen, Setting.CARD_MGR_EVENTS, {selectedCardGroup:idx}));
			
			this._navigator.addScreen(Setting.EDIT_CARD_GROUP, new ScreenNavigatorItem(EditCardGroupScreen, Setting.EDIT_CARD_GROUP_EVENTS, {selectedCardGroup:idx}));

			this._navigator.addScreen(Setting.USER, new ScreenNavigatorItem(UserScreen, Setting.USER_EVENTS));

			this._navigator.addScreen(Setting.FRIEND, new ScreenNavigatorItem(FriendScreen, Setting.FRIEND_EVENTS));
			
			this._navigator.addScreen(Setting.ONE_FRIEND, new ScreenNavigatorItem(OneFriendScreen, Setting.ONE_FRIEND_EVENTS));

			this._navigator.addScreen(Setting.BATTLE_FIELD, new ScreenNavigatorItem(BattleFieldScreen, Setting.BATTLE_FIELD_EVENTS));
			
			this._navigator.showScreen(Setting.LOGIN);
		}
	}
}