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

	event TaskCompleted(
		uint id,
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



	function toggleCompleted(uint _id) public{

		Task  memory _task = tasks[_id]; ///_ -> local var not state
		_task.completed = !_task.completed;
		tasks[_id] = _task;

		emit TaskCompleted(_id, _task.completed);

	}

}