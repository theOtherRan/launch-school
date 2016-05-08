WINNING_RULES = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(paper spock),
  'spock' => %w(rock scissors)
}.freeze

SHORTCUT_RULES = { "r" => "rock", "p" => "paper", "s" => "scissors", "v" => "spock", "l" => "lizard" }.freeze

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear_screen
  system('clear') || system('cls')
end

def win?(first, second)
  WINNING_RULES[first].include?(second)
end

def display_results(user_wins, computer_wins)
  if user_wins > computer_wins
    prompt("You won the game!")
  elsif computer_wins > user_wins
    prompt("Computer won the game!")
  else
    prompt("It's a tie.")
  end
end

def valid_answer?(answer)
  answer.downcase == 'y' || answer.downcase == 'n'
end

loop do # main loop
  user_choice_key = ''
  user_wins = 0
  computer_wins = 0
  winner_found = false
  round = 1 # keeping track of rounds
  until winner_found == true
    clear_screen()
    prompt("--------------------Round #{round}--------------------")
    loop do
      prompt("Enter your choice:")
      prompt("r for rock, p for paper, s for scissors, l for lizard, or v for spock")
      user_choice_key = Kernel.gets().chomp()
      break if SHORTCUT_RULES.key?(user_choice_key.downcase)
    end

    user_choice = SHORTCUT_RULES[user_choice_key]
    computer_choice = WINNING_RULES.keys.sample

    prompt("You chose #{user_choice}; Computer chose #{computer_choice}")

    if win?(user_choice, computer_choice)
      prompt("You won this round!")
      user_wins += 1
    elsif win?(computer_choice, user_choice)
      prompt("Computer won this round!")
      computer_wins += 1
    else
      prompt("It's a tie.")
    end

    prompt("Current Score is User: #{user_wins} || Computer: #{computer_wins}")
    prompt("Press enter to continue... ")
    Kernel.gets # pause the screen

    round += 1
    winner_found = true if user_wins == 5 || computer_wins == 5
  end

  display_results(user_wins, computer_wins)

  answer = ''
  loop do
    prompt("Do you want to play again? Enter Y or N")
    answer = Kernel.gets().chomp()
    break if valid_answer?(answer)
  end

  break unless answer.downcase == 'y'
end

prompt("Thank you for playing. Good bye!")
