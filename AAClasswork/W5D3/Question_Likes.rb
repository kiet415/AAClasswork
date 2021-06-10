require_relative 'Question_Follow.rb'
require_relative 'Question.rb'
require_relative 'Reply.rb'
require_relative 'User.rb'

class Question_Likes
    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id]
        @user_likes = options['user_likes]
    end

end