World(Rack::Test::Methods)

Given(/^task 'walk the dog' is on the system$/) do
  @task = Task.new
  @task.name="walk the dog"
  @task.save
end

When(/^I ask todo$/) do
  get "/task"
end

When(/^I add task 'feed the dog'$/) do
 header 'Content-Type', 'application/json'
 post "/task", "{\"name\":\"feed the dog\"}"
end

When(/^I delete task 'walk the dog'$/) do
  delete "/task/1"
end

Then(/^I should receive a correct response$/) do
  last_response.status == 200
end

Then(/^content 'walk the dog'$/) do
  page = JSON.parse(last_response.body)
  page.length==1
  page.any?{|task|task['name'] == 'walk the dog' }
end

Then(/^content 'walk the dog, feed the dog'$/) do
  page = JSON.parse(last_response.body)
  page.length==2
  page.any?{|task|task['name'] == 'walk the dog' }
  page.any?{|task|task['name'] == 'feed the dog' }
end

Then(/^no content$/) do
  page = JSON.parse(last_response.body)
  page.length==0
end

