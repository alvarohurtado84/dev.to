
require 'aws-sdk'

client = Aws::SSM::Client.new(region: 'eu-west-1')

parameter_path = '/foodpeople/prod/'
result = client.get_parameters_by_path(path: parameter_path)

while result.next_token do
  result.parameters.each do |parameter|

    variable = parameter.name.gsub(parameter_path, '') + '=' + parameter.value
    File.open('.env', "a") {
      |file| file.puts variable
    }

  end
  
  result = client.get_parameters_by_path(path: parameter_path, next_token:result.next_token)
  
end



#
#file_names.each do |file_name|
#  text = File.read(file_name)
#
#  # Display text for usability
#  puts text
#  # Substitute Variables
#  new_contents = text.gsub(/HOSTEDZONE/, hostedzonename)
#  new_contents = new_contents.gsub(/PASSWORD/, password)
#
#  # To write changes to the file, use:
#  File.open(file_name, "w") {|file| file.puts new_contents.to_s }
#end
#




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
