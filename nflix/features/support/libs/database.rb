require "pg"

class Database 
    def initialize
        @connection = PG.connect(host: "192.168.99.100", dbname: "ninjaflix", user: "postgres", password: "qaninja")
    end

    def delet_movie(title)
        @connection.exec("DELETE from public.movies where title = '#{title}';")
    end

    def insert_movie(movie)
        sql_script = "INSERT INTO public.movies(TITLE, STATUS, YEAR, RELEASE_DATE, CREATED_AT, UPDATED_AT)"\
                     "VALUES('#{movie['title']}', '#{movie['status']}', #{movie['year']} , '#{movie['release_date']}', current_timestamp, current_timestamp);"
        @connection.exec(sql_script)
    end
end