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
  new_data = data.each_with_object({})do |(key,value),final_hash|
    value.each do |inner_key,inner_value|
      inner_value.each do |name|
  #data.each do |key,value|
  #value.each_value do |value| 
  if name.include?(emoticon)
  return final_hash[key]
  end
  end
  end
  end
  #binding.pry
 end

def get_english_meaning(file, emoticon)
  data = load_library(file)
  data.each do |key, value|
  if value.include?(emoticon)
    return data[key]
   end
    #else
      #return "not found"
  end
end