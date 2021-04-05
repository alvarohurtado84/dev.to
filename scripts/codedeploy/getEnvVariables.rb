
require 'aws-sdk'

client = Aws::SSM::Client.new(region: 'eu-west-1')

parameter_path = '/foodpeople/prod/'

first_round = true
result = nil

loop do

  if first_round
    result = client.get_parameters_by_path(path: parameter_path)
  else
    result = client.get_parameters_by_path(path: parameter_path, next_token:result.next_token)
  end
  
  result.parameters.each do |parameter|

    variable = parameter.name.gsub(parameter_path, '') + '=' + parameter.value
    File.open('.env', "a") {
      |file| file.puts variable
    }

  end
  
  if result.next_token
    first_round = false
  else
    break
  end
  
end


#resp.parameters #=> Array
#resp.parameters[0].name #=> String
#resp.parameters[0].type #=> String, one of "String", "StringList", "SecureString"
#resp.parameters[0].value #=> String
#resp.parameters[0].version #=> Integer
#resp.parameters[0].selector #=> String
#resp.parameters[0].source_result #=> String
#resp.parameters[0].last_modified_date #=> Time
#resp.parameters[0].arn #=> String
#resp.parameters[0].data_type #=> String
#resp.next_token #=> String
