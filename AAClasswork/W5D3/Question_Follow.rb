require_relative 'Question_Likes.rb'
require_relative 'Question.rb'
require_relative 'Reply.rb'
require_relative 'User.rb'

class Question_Follow
    
    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.find_by_user_id(user_id)
        user = User.find_by_id(user_id)
        user_hash = QuestionsDatabase.instance.execute(<<-SQL, user.id)
        SELECT
            *
        FROM
            question_follows
        WHERE
            user.id = ?
        SQL

        user_hash.map { |user| Question_Follow.new(user) }
    end

    def self.find_by_question_id(question_id)
        question = User.find_by_id(question_id)
        question_hash = QuestionsDatabase.instance.execute(<<-SQL, question.id)
        SELECT
            *
        FROM
            question_follows
        WHERE
            question.id = ?
        SQL

        question_hash.map { |user| Question_follow.new(user) }
    end

    def self.followers_for_question_id(question_id)

    end

    def self.followed_questions_for_user_id(user_id)

    end


end