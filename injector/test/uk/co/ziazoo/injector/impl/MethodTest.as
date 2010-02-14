package uk.co.ziazoo.injector.impl
{
	import org.flexunit.Assert;
		
	public class MethodTest
	{
		public function MethodTest()
		{
		}
		
		[Test]
		public function hasParams():void
		{
			var reflect:XML = <method name="injectLeaf" 
				declaredBy="some.thing::Tree" returnType="void">
	      <parameter index="1" type="some.thing::Leaf" optional="false"/>
	      <metadata name="Inject"/>
	    </method>;
			
			var method:Method = new Method( reflect );
			
			Assert.assertTrue( "name of injectLeaf", method.name == "injectLeaf" );
			Assert.assertTrue( "one param", method.params.length == 1 );
			Assert.assertTrue( "one metadata", method.metadata.length == 1 );
		}
	}
}