# require modules here
require 'pry'
def load_library(file_path)
  # code goes here
  require "yaml"
  file_path = YAML::load_file(File.join(__dir__, 'emoticons.yml'))
  new_hash = file_path.each_with_object({}) do |(key,value),hash|
     arr_keys = [:english,:japanese]
     result = arr_keys.zip(value).to_h
     hash.store(key, result)
  end
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  data = load_library(file)
  #binding.pry
  #data.each do |key,value|
  data.each_value do |value| 
  if value.include?(emoticon)
  return value
  #binding.pry
  end
  end
  #binding.pry
 end

def get_english_meaning(file, emoticon)
  data = load_library(file)
  data.each do |key, value|
  if value.include?(emoticon)
    return key
   end
    #else
      #return "not found"
  end
end