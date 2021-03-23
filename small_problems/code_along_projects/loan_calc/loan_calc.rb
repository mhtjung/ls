require 'yaml'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def messages(msg, lang='en')
  MESSAGES[lang][msg]
end

def integer?(num)
  /^-?\d+$/.match(num)
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def number?(input)
  integer?(input) || float?(input)
end

def get_principal
  loop do
    prompt(messages('get_principal'))
    principal = gets.chomp
    return principal.to_f if number?(principal)
    prompt(messages('invalid_input'))
  end
end

def get_monthly_interest
  loop do
    prompt(messages('get_monthly_interest'))
    mth_int = gets.chomp
    return mth_int.to_f / 12 if number?(mth_int)
    prompt(messages('invalid_input'))
  end
end

def get_loan_duration
  loop do
    prompt(messages('get_duration'))
    duration = gets.chomp
    return duration.to_f * 12 if number?(duration)
    prompt(messages('invalid_input'))
  end
end

def loan_calculator
  principal = get_principal
  mth_int = get_monthly_interest
  duration = get_loan_duration
  m = principal * (mth_int / (1 - (1 + mth_int)**(-duration)))
  prompt("Your monthly payment is #{m}")
end

loan_calculator
