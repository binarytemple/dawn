package uk.co.ziazoo.injector.impl
{	
	public class InjectableMethod
	{
		public var name:String;
		public var params:Array;
		public var metadata:Array;

		public function InjectableMethod( reflection:XML )
		{
			name = reflection.@name;
			
			params = [];
			for each( var p:XML in reflection.parameter )
			{
				params.push( new Parameter( p ) );
			}
			
			metadata = [];
			for each( var m:XML in reflection.metadata )
			{
				metadata.push( new Metadata( m ) );
			}
		}
	}
}