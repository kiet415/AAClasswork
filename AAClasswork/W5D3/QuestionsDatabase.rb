require 'sqlite3'
require 'singleton'
require_relative 'Question_Follow.rb'
require_relative 'Question_Likes.rb'
require_relative 'Question.rb'
require_relative 'Reply.rb'
require_relative 'User.rb'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')  #COULD BE WRONG , could be users
        self.type_translation = true
        self.results_as_hash = true
    end
end

hash = {
    'fname' => 'Homer',
    'lname' => 'Simpson'
}
