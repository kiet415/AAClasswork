require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')  #COULD BE WRONG , could be users
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :fname, :lname
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        SQL
        return nil unless id.length > 0

        Name.new(id.first) 
    end

    def self.find_by_name(fname, lname)
        name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = ? AND lname = ?
        SQL
        return nil unless name.length > 0

        Name.new(name.first) 

    end

    def create
        raise "#{self} already in database" if @id
        QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO
            users (fname, lname)
        VALUES
            (?, ?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE
            users
        SET
            fname = ?, lname = ?
        WHERE
            id = ?
        SQL  
    end

end

class Questions 
    attr_accessor :title, :body

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        return nil unless id.length > 0

        Questions.new(id.first) 
    end

    def self.find_by_title(title)
        title_hash = QuestionsDatabase.instance.execute(<<-SQL, title)
        SELECT
            *
        FROM
            questions
        WHERE
            title = ?
        SQL
        return nil unless title_hash.length > 0

        Questions.new(title_hash.first) 
    end

    def self.find_by_body(body)
        body_hash = QuestionsDatabase.instance.execute(<<-SQL, body)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        return nil unless body_hash.length > 0

        Questions.new(body_hash.first) 
    end

    def self.find_by_user_id(user_id)
        user = User.find_by_id(user_id)
        user_hash = QuestionsDatabase.instance.execute(<<-SQL, user.id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL

        user_hash.map { |user| Questions.new(user) }
    end

    def create
        raise "#{self} already in database" if @id
        QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
        INSERT INTO
            questions (title, body, user_id)
        VALUES
            (?, ?, ?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
        UPDATE
            questions
        SET
            title = ?, body = ?, user_id = ?
        WHERE
            id = ?
        SQL  
    end

end


hash = {
    'fname' => 'Homer',
    'lname' => 'Simpson'
}
