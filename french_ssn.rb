require 'yaml'
require 'date'
SSN_PATTERN = /\A(?<gender>[1-2])\W?(?<year>[0-9]{2})\W?(?<month>0[1-9]|1[0-2])\W?(?<dept>[0-8][0-9]|9[0-5]|2[ABab])\W?(?<random>[0-9]{3}\W?[0-9]{3})\W?(?<key>[0-9]{2})\z/

def gender(match_data)
  match_data[:gender] == "1" ? "man" : "woman"
end

def month(match_data)
  Date::MONTHNAMES[match_data[:month].to_i]
end

def dept(match_data)
  departments = YAML.load_file('data/french_departments.yml')
  departments[match_data[:dept]]
end

def french_ssn_info(ssn) # ssn == string
  # match_data = .match
  match_data = ssn.match(SSN_PATTERN)
  if match_data
    "a #{gender(match_data)}, born in #{month(match_data)}, 19#{match_data[:year]} in #{dept(match_data)}."
  else
    "The number is invalid"
  end
end


puts french_ssn_info('100102B12312312')


