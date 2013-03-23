desc "Rename project hostname"
task :rename_hostname, :project_hostname do |t, args|

  def replace_in_file(filename, s, r)
    filename = Rails.root.join(filename)
    content = File.open(filename).read.gsub(s, r)
    File.open(filename, "w") {|f| f.write(content) }
  end
  
  
  ['config/environments/production.rb',
  'config/initializers/heroku_wakeup.rb',
  'config/initializers/mail.rb',
  'lib/tasks/rename_hostname.rake'].each do |filename|
    replace_in_file(filename, 'startae-bootstrap.herokuapp.com', args[:project_hostname])
  end
end
