require 'sinatra'
require 'sqlite3'

get('/') do
	db = SQLite3::Database.new("./db/plebbit.db")
	all = db.execute('SELECT * FROM posts ORDER BY id DESC')
	erb(:index, locals:{posts:all})
end

get('/view/:id') do
	db = SQLite3::Database.new("./db/plebbit.db")
	id = params[:id]
	post = db.execute('SELECT * FROM posts WHERE id IS ' + id)
	erb(:view, locals:{posts:post})
end

get('/post') do
	
end

post('/create') do

end

get('/hot') do
	db = SQLite3::Database.new("./db/plebbit.db")
	all = db.execute('SELECT * FROM posts ORDER BY points DESC')
	erb(:index, locals:{posts:all})
end

get('/title') do
	db = SQLite3::Database.new("./db/plebbit.db")
	all = db.execute('SELECT * FROM posts ORDER BY title')
	erb(:index, locals:{posts:all})	
end



