require 'sinatra'

get '/' do
  pass if params[:number] == nil

  @code_string = params[:code_string]
  @number = params[:number].to_i
  encrypted_code = caesar_cipher(@code_string, @number)
  erb :index, :locals =>{:result => "Encrypted code: #{encrypted_code}"}
end

get '/' do
  pass if params[:number] != nil

  erb :index, :locals =>{:result => ""}
end

def caesar_cipher(string, num)
  newstring = ''
  string.scan(/./) do |x|
    asc = x.ord
    if (97..122).include?(asc)
      asc > 122 - num ? asc = 96 + (num - (122 - asc)) : asc += num
    elsif (65..90).include?(asc)
      asc > 90 - num ?  asc = 64 + (num - (90 - asc)) : asc += num
    else
      asc
    end
    new_character = asc.chr
    newstring = newstring + new_character
  end
  newstring
end
