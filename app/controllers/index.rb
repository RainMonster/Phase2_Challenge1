get '/' do
  @all_tasks = Task.all
  @ordered_tasks = display_order(@all_tasks)
  erb :index
end

post '/' do
  @title = params[:title]
  @content = params[:content]
  Task.create(title: @title, content: @content)    
  redirect '/'
end

# -------- Task ----------

get '/task/:id' do
  @task = Task.find_by_id(params[:id])
  erb :task_page
end

put '/task/:id' do
  update_task = Task.find_by_id(params[:id])
  update_task.title = params[:title]
  update_task.content = params[:content]
  update_task.complete = params[:complete]
  update_task.save
  redirect '/'
end

# ------- Delete ----------

post '/delete/:id' do
  @finished_task = Task.find_by_id(params[:id])
  @finished_task.destroy
  redirect '/'
end

get '/delete/confirm/:id' do
  @confirm_task = Task.find_by_id(params[:id])
  erb :confirm_delete
end
