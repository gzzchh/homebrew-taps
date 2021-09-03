require 'json'

# 确定文件名 不包含扩展名
filename = File.basename(__FILE__, File.extname(__FILE__,))
# 确定仓库目录,其实就是向上跳转两次
git_repository = File.dirname(File.dirname(__FILE__))
# puts git_repository
# 确定版本信息文件
json = File.read("#{git_repository}/versions/#{filename}.json")
obj  = JSON.parse(json)

puts(obj["version"][""])
