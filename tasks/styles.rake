namespace :css do

  desc "Clear the CSS"
  task :clear => ["compile:clear"]

  desc "Compile CSS"
  task :compile => ["compile:default"]

  task :watch do
    system "compass watch"
  end

  namespace :compile do

    task :clear do
      puts "*** Clearing CSS ***"
      system "rm -Rfv public/stylesheets/*"
    end

    task :default => :clear do
      puts "*** Compiling CSS ***"
      system "compass compile"
    end

    desc "Compile CSS for production"
    task :prod => :clear do
      puts "*** Compiling CSS ***"
      system "compass compile --output-style compressed --force"
    end
  end
end
