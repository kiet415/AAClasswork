require_relative 'Question_Follow.rb'
require_relative 'Question_Likes.rb'
require_relative 'Reply.rb'
require_relative 'User.rb'

class Question 
    attr_accessor :title, :body

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
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

        Question.new(id.first) 
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

        Question.new(title_hash.first) 
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

        Question.new(body_hash.first) 
    end

    def self.find_by_author_id(author_id)
        author = User.find_by_id(author_id)
        author_hash = QuestionsDatabase.instance.execute(<<-SQL, author.id)
        SELECT
            *
        FROM
            questions
        WHERE
            author.id = ?
        SQL

        author_hash.map { |author| Question.new(author) }
    end

    def author
        self.find_by_author_id(author_id)
    end

    def replies
        Reply.find_by_question_id(id)
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