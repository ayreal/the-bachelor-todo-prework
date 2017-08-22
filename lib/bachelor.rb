require 'pry'
def get_first_name_of_season_winner(data, season)
  winner = data[season][0]["name"].split[0]
end

# array = [{a: 1, b:2, c:3}, {d:4, e: 5, f:6}]


def get_contestant_name(data, occupation)
  name = ""
  data.each do |season, cont_data_all|
    cont_data_all.each do |cont_data_one|
      cont_data_one.each do |info, detail|
        if detail == occupation
          name = cont_data_one["name"]
        end
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  same_hometown = 0
  data.each do |season, cont_data_all|
    cont_data_all.each do |cont_data_one|
      if cont_data_one.value?(hometown)
        same_hometown += 1
      end
    end
  end
  same_hometown
end

def get_occupation(data, hometown)
  occupation = []
  data.each do |season, cont_data_all|
    cont_data_all.each do |cont_data_one|
      if cont_data_one.value?(hometown)
        occupation.push(cont_data_one["occupation"])
      end
    end
  end
  occupation[0]
end

def get_average_age_for_season(data, season)
# Iterate through the hash and return the average age of all of the contestants for that season.
# How will you iterate down into the level of the hash that contains each contestant's age?
# How will you collect the ages of each contestant and average them? Remember that the values of the "age" keys are not numbers, they are strings. How do we convert strings to numbers in Ruby?
# Remember that dividing *integers* in Ruby always rounds down. In this case though, we want the normal math sort of rounding (where .5 and higher rounds *up*), instead. Consider the difference between `to_f` and `to_i`.
  age = 0
  count = 0
  data[season].each do |cont_data_one|
    number = cont_data_one["age"].to_f
    age = age + number
    count += 1
  end
  (age / count).round()
end
