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

        User.new(id.first) 
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

        User.new(name.first) 

    end

    def authored_questions
        Questions.find_by_author_id
    end

    def authored_replies
        Reply.find_by_user_id
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

