package com.example.handlers
{
	import com.example.model.Person;

	public interface IPersonRecievedHandler
	{
		function onPersonRevieved( person:Person ):void;
	}
}