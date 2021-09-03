require 'json'

# 确定我的文件名 不包含扩展名
filename       = File.basename(__FILE__, File.extname(__FILE__,))
git_repository = File.dirname(File.dirname(__FILE__))
puts git_repository
json = File.read("#{git_repository}/versions/#{filename}.json")
obj  = JSON.parse(json)

puts(obj["version"][""])
