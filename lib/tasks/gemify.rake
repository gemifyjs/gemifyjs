desc 'generate repo'

task :gemify => :environment do 
  # puts ENV['GEMIFY_USER']
  # puts ENV['GEMIFY_PW']
  # fix ENV variables later
  client = Octokit::Client.new(:login => 'avi@flatironschool.com', :password => 'flatiron000')
  client.create_repository("from_app")
  # Jem.create(:name => "created from rake task")

end