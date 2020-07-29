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
  data.each do |key,value|
   value.each_value do |inner_value| 
     if inner_value == emoticon
       return value[:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  data = load_library(file)
  data.each do |key, value|
   value.each_value do |inner_value| 
     if inner_value == emoticon
       return key 
      end
    end
  end
  return "Sorry, that emoticon was not found"
end