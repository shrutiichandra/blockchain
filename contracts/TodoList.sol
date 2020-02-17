pragma solidity ^0.5.0;

contract TodoList{
	///keep track of number of task counts, state variable
	uint public taskCount = 0;


	struct Task{
		uint id;
		string content;
		bool completed;
	}


	mapping(uint => Task) public tasks;

	event TaskCreated(
		uint id,
		string content,
		bool completed
	);

	constructor() public{
		///add a default task
		createTask("hello dude!");
	}

	function createTask(string memory _content) public{
		taskCount ++;
		///putting tasks inside map
		tasks[taskCount] = Task(taskCount, _content, false);

		///broadcast an event that task was made
		emit TaskCreated(taskCount, _content, false);
	}


}