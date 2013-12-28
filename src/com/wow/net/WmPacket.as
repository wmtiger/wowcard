package com.wow.net 
{
	import flash.utils.ByteArray;
	/**
	 * ...
	 * @author wmtiger
	 */
	public class WmPacket 
	{
		static public const SIZE_BYTES_HEAD:int = 4;
		
		private var _length:int;
		private var _content:ByteArray;
		private var _buf:ByteArray;
		
		public function WmPacket() 
		{
			_length = 0;
			_content = new ByteArray();
			_buf = new ByteArray();
		}
		
		public function get length():int
		{
			return _length;
		}
		
		public function serialization():ByteArray
		{
			_buf.length = 0;
			_buf.position = 0;
			_buf.writeInt(_content.length);
			_buf.writeBytes(_content);
			return _buf;
		}
		
		public function deserialization(buf:ByteArray):Boolean
		{
			if (buf.bytesAvailable < SIZE_BYTES_HEAD)
			{
				return false;
			}
			var pos:int = buf.position;
			var len:uint = buf.readInt();
			if (buf.bytesAvailable < len)
			{
				buf.position = pos;
				return false;
			}
			if (len > 0)
			{
				_content.writeBytes(buf, buf.position, len);
				buf.position += len;
				_content.position = 0;
			}
			return true;
		}
		
		public static function buildPacketFromByteArray(buf:ByteArray):WmPacket
		{
			var pk:WmPacket = new WmPacket();
			if (pk.deserialization(buf))
			{
				return pk;
			}
			return null;
		}
		
		public function get content():ByteArray
		{
			return _content;
		}
		
	}

}