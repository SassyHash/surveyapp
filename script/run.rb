def run
  puts "Welcome to Survey Ninja!"
  puts "What would you like to do? 
  \nType (N) to make a new user. \nType (F) if you are already a user?"
  a = gets.chomp.upcase
  case a
  when "N"
    puts "What would you like as your screen name?"
    print "> "
    screen_name = gets.chomp
    puts "What is your email?"
    print "> "
    email = gets.chomp
    user = User.create(:screen_name => screen_name, :email_address => email)
  when "F"
    email = gets.chomp
    user = User.where(:email_address => email)
  end
  screen_name, email = "", ""
  ask_for_actions(user)
end

def ask_for_actions(user)
  puts "Would you like to (M)ake or (A)nswer the survey?"
  a = gets.chomp.upcase
  case a
  when "M"
    user.make_survey.make_question.make_response

  when "A"
    user.choose_survey
  end
end

run