package com.example.view
{
	import com.example.handlers.IPeopleRecievedHandler;
	import com.example.model.Person;
	import com.example.workers.PersonRequest;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	
	import uk.co.ziazoo.notifier.INotificationBus;

	public class PersonListPresenter 
		implements IPeopleRecievedHandler
	{
		private var _personList:PersonList;
		private var _bus:INotificationBus;
		
		public function PersonListPresenter()
		{
		}
		
		[Inject]
		public function set personList( value:PersonList ):void
		{
			_personList = value;
			_personList.addEventListener( "selectPerson", onPersonSelect );	
		}
		
		[Inject]
		public function set notificationBus( value:INotificationBus ):void
		{
			_bus = value;
		}
		
		private function onPersonSelect( event:Event ):void
		{
			var person:Person = _personList.dataGrid.selectedItem as Person;
			_bus.trigger( new PersonRequest( person.name ) );
		}
		
		public function onPeopleRevieved( people:IList ):void
		{
			_personList.people = people;
		}
	}
}