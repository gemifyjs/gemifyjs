desc 'generate repo'

task :gemify => :environment do 
  Jem.create(:name => "created from rake task")
end