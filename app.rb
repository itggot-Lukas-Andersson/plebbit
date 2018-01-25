require 'sinatra'
require 'sqlite3'

get('/') do
	db = SQLite3::Database.new("./db/plebbit.sqlite")
	all = db.execute('SELECT * FROM posts')
	erb(:index, locals:{posts:all})
end

get('/view/:id') do
	db = SQLite3::Database.new("./db/plebbit.sqlite")
	id = params[:id]
	post = db.execute('SELECT * FROM posts WHERE id IS ' + id)
	erb(:view, locals:{post:post})
end

get('/post') do
	
end

post('/create') do

end


