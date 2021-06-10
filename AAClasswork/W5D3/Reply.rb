require_relative 'Question_Likes.rb'
require_relative 'Question.rb'
require_relative 'Question_Follow.rb'
require_relative 'User.rb'

class Reply

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @author_id = options['author_id']
        @body = options['body']
    end

    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        return nil unless id.length > 0

        Reply.new(id.first) 
    end

    def self.find_by_parent_id(parent_id)
        id = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
        SELECT
            *
        FROM
            replies
        WHERE
            parent_id = ?
        SQL
        return nil unless parent_id.length > 0

        Reply.new(id.first) 
    end

    def self.find_by_question_id(question_id)
        question = Question.find_by_id(question_id)
        question_hash = QuestionsDatabase.instance.execute(<<-SQL, question.id)
        SELECT
            *
        FROM
            replies
        WHERE
            question.id = ?
        SQL

        question_hash.map { |user| Reply.new(user) }
    end

    def self.find_by_author_id(author_id)
        author = User.find_by_id(author_id)
        author_hash = QuestionsDatabase.instance.execute(<<-SQL, author.id)
        SELECT
            *
        FROM
            replies
        WHERE
            author.id = ?
        SQL

        author_hash.map { |user| Reply.new(user) }
    end
    def self.find_by_body(body)
        body_hash = QuestionsDatabase.instance.execute(<<-SQL, body)
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        return nil unless body_hash.length > 0

        Reply.new(body_hash.first) 
    end

    def author
        Reply.find_by_author_id(author_id)
    end

    def question
        Question.find_by_question_id(question_id)
    end

    def parent_reply
        return nil if !author_id
        Reply.find_by_id(author_id)
    end

    def child_replies
        Reply.find_by_parent_id(id)
    end

    def create
        raise "#{self} already in database" if @id
        QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @author_id, @body)
        INSERT INTO
            replies (question_id, parent_id, author_id, body)
        VALUES
            (?, ?, ?, ?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @author_id, @body, @id)
        UPDATE
            replies
        SET
        question_id = ?, parent_id = ?, author_id = ? , body = ?
        WHERE
            id = ?
        SQL  
    end
end