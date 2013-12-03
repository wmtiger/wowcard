package com.wow.view.game
{
	import com.wow.setting.Setting;
	import com.wow.themes.WowCardTheme;
	import com.wow.view.cardsmgr.CardsMgrScreen;
	import com.wow.view.createrole.CreateRoleScreen;
	import com.wow.view.friend.FriendScreen;
	import com.wow.view.login.LoginScreen;
	import com.wow.view.search.SearchFighterScreen;
	
	import feathers.controls.Drawers;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.events.FeathersEventType;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	public class MainView extends Drawers
	{
		private var _navigator:ScreenNavigator;
		private var _transitionManager:ScreenSlidingStackTransitionManager;
		private var _login:LoginScreen;
		
		public function MainView()
		{
			super();
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}
		
		private function initializeHandler(event:Event):void
		{
			new WowCardTheme();
			
			this._navigator = new ScreenNavigator();
			this.content = this._navigator;
			
			this._transitionManager = new ScreenSlidingStackTransitionManager(this._navigator);
			this._transitionManager.duration = 0.4;
			
			this._navigator.addScreen(Setting.CREATE_ROLE, new ScreenNavigatorItem(CreateRoleScreen, Setting.CREATE_ROLE_EVENTS));
			
			this._navigator.addScreen(Setting.CARD_MGR, new ScreenNavigatorItem(CardsMgrScreen, Setting.CARD_MGR_EVENTS));
			
			this._navigator.addScreen(Setting.FRIEND, new ScreenNavigatorItem(FriendScreen, Setting.FRIEND_EVENTS));
			
			this._navigator.addScreen(Setting.SEARCH_FIGHTER, new ScreenNavigatorItem(SearchFighterScreen, Setting.SEARCH_FIGHTER_EVENTS));
			
			if(DeviceCapabilities.isTablet(Starling.current.nativeStage))
			{
				this._navigator.clipContent = true;
				this._login = new LoginScreen();
				for(var eventType:String in Setting.LOGIN_EVENTS)
				{
					this._login.addEventListener(eventType, loginEventHandler);
				}
				this._login.height = 200;
				this.leftDrawer = this._login;
				this.leftDrawerDockMode = Drawers.DOCK_MODE_BOTH;
			}
			else
			{
				this._navigator.addScreen(Setting.LOGIN, new ScreenNavigatorItem(LoginScreen, Setting.LOGIN_EVENTS));
				this._navigator.showScreen(Setting.LOGIN);
			}
		}
		
		private function loginEventHandler(event:Event):void
		{
			const screenName:String = Setting.LOGIN_EVENTS[event.type];
			this._transitionManager.clearStack();
			this._transitionManager.skipNextTransition = true;
			this._navigator.showScreen(screenName);
		}
	}
}