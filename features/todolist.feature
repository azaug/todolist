Feature: list to remind task
In order to not forget tasks
A user
Should add and remove things to remember

  Scenario:   list task
      Given task 'walk the dog' is on the system
       When I ask todo
       Then I should receive a correct response
	   And content 'walk the dog'
         

  Scenario:   add task
      Given task 'walk the dog' is on the system
       When I add task 'feed the dog'
	   And I ask todo
       Then I should receive a correct response 
	   And content 'walk the dog, feed the dog' 
	   
Scenario:   delete task
      Given task 'walk the dog' is on the system
       When I delete task 'walk the dog'
	   And I ask todo
       Then I should receive a correct response 
	   And no content 