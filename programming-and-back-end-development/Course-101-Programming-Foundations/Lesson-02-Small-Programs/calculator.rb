require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')


def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  number1 = ''
  loop do
  prompt(MESSAGES['number1'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
  end
end

number2 = ''
loop do
  prompt(MESSAGES['number2'])
  number2 = Kernel.gets().chomp()

  if valid_number?(number2)
    break
  else
    prompt(MESSAGES['invalid_number'])
  end
end

operator_prompt = <<-MSG
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
MSG

prompt(operator_prompt)

operator = ''
loop do
  operator = Kernel.gets().chomp()

  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt(MESSAGES['operator_number'])
  end
end

prompt("#{operation_to_message(operator)} the two numbers...")

result = case operator
		      when '1'
		 	      number1.to_i() + number2.to_i()
		      when '2'
		 	      number1.to_i() - number2.to_i()
		      when '3'
		 	      result = number1.to_i() * number2.to_i()
		      when '4'
		 	      result = number1.to_f() / number2.to_f()
end

  prompt("The result is #{result}")

  prompt(MESSAGES['calc_again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['fin'])