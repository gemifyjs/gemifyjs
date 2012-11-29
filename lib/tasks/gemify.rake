desc 'generate repo'

task :gemify => :environment do 
  # puts ENV['GEMIFY_USER']
  # puts ENV['GEMIFY_PW']
  # fix ENV variables later
  # client = Octokit::Client.new(:login => 'avi@flatironschool.com', :password => 'flatiron000')
  
  def template(source, *args, &block)
    config = args.last.is_a?(Hash) ? args.pop : {}
    destination = args.first || source.sub(/\.tt$/, '')

    source  = File.expand_path("./templates/#{source.to_s}")
    context = instance_eval('binding')

    create_file destination, nil, config do
      content = ERB.new(::File.binread(source), nil, '-', '@output_buffer').result(context)
      content = block.call(content) if block
      content
    end
  end
  
  jem = Jem.last
  name = jem.name
  opts = {:constant_name => name}

  # source_root File.expand_path('../generators/gemfying/templates', __FILE__)

  target = File.join(Dir.pwd, "jems/#{name}-rails")
  FileUtils.mkdir_p(target)
  FileUtils.mkdir_p(File.join(target, 'lib', "#{name}-rails"))
  File.join(target, 'lib', "#{name}-rails")
  template(File.join("engine.rb.tt"),  
               File.join(target, "lib/#{name}-rails/engine.rb"),  opts)

  template "engine.rb.erb", 
               File.join(target, "lib/#{file_name}-rails/engine.rb")

  template "version.rb.erb", 
               File.join(target, "lib/#{file_name}-rails/version.rb")

  template "railtie.rb.erb",
               File.join(target, "lib/#{file_name}-rails/railtie.rb")

  template "versioncontrol.rb.erb",
               File.join(target, "lib/#{file_name}-rails.rb")

  # client.create_repository("from_ap")
  # Jem.create(:name => "created from rake task")

end

