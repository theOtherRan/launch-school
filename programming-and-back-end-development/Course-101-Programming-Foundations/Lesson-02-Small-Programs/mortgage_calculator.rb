def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to the monthly mortgage calculator.")

loop do
  loan_amount = ''
  loop do
    prompt("Please enter your desired loan amount:")
    loan_amount = gets.strip
  
    if number?(loan_amount)
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  apr = ''
  loop do
    prompt("Please enter your desired Annual Percentage Rate:")
    apr = gets.strip
  
    if number?(apr)
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  loan_duration = ''
  loan_duration_years = ''
  loan_duration_months = ''
  loop do
    prompt("Please enter the length of the loan:")
    loan_duration = gets.strip

    if number?(loan_duration)
      prompt("Will that be in years or months?")
      years_or_months = gets.strip

      if years_or_months.downcase().start_with?('y')
        loan_duration_years = loan_duration.to_i * 12
        prompt("The loan duration in months is #{loan_duration_years}.")
        prompt("Calculating the monthly payment and monthly interest rate...")
        apr = apr.to_f / 100
        monthly_int_rate = (((1 + apr) ** 0.08333) - 1) # 1/12 = 0.08333
        monthly_payment = (loan_amount.to_i * monthly_int_rate) / (1 - ((1 + monthly_int_rate) ** (-loan_duration_years)))
        monthly_payment = '%.2f' % monthly_payment # monthly_payment to 2 decimal places
        prompt("Your monthly payment is: $#{monthly_payment}.")

        monthly_int_rate = '%.7f' % monthly_int_rate # monthly_int_rate to 7 decimal places
        prompt("Your monthly interest rate is: #{monthly_int_rate}.")
      else
        loan_duration_months = loan_duration.to_i
        prompt("The loan duration in months is #{loan_duration_months}.")
        prompt("Calculating the monthly payment and monthly interest rate...")
        apr = apr.to_f / 100
        monthly_int_rate = (((1 + apr) ** 0.08333) - 1) # 1/12 = 0.08333
        monthly_payment = (loan_amount.to_i * monthly_int_rate) / (1 - ((1 + monthly_int_rate) ** (-loan_duration_months)))
        monthly_payment = '%.2f' % monthly_payment # monthly_payment to 2 decimal places
        prompt("Your monthly payment is: $#{monthly_payment}.")

        monthly_int_rate = '%.7f' % monthly_int_rate # monthly_int_rate to 7 decimal places
        prompt("Your monthly interest rate is: #{monthly_int_rate}.")
      end
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  prompt("Would you like to run the calculation again? [Press Y to repeat.]")
  answer = gets.strip
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks you for using the mortgage calculator. Good bye!")