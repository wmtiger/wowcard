package com.wow.common.model
{
	import com.wow.common.vo.UserVO;

	public class UserModel
	{
		private static var _instance:UserModel;
		
		public var userVO:UserVO;
		
		public function UserModel()
		{
		}

		public static function get instance():UserModel
		{
			if(_instance == null)
				_instance = new UserModel();
			return _instance;
		}

	}
}