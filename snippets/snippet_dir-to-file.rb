puts "Enter the dir you wish to convert to a single file"
dir = gets.chomp.to_s
puts "\nEntered dir:  #{dir}\n"
new_file = File.new "#{dir}.snippets", "w+"
if File.directory?(File.dirname(__FILE__) + "/#{dir}")
  Dir.entries(dir).each do |f|
    current_file = File.new("#{dir}/#{f}", "r") unless f == "." or f == ".."
    if current_file
      unless File.directory?(current_file)
        snippet = f.gsub(".snippet", "")
        new_file.puts "##{snippet}\nsnippet #{snippet}"
        current_file.each do |line|
          new_file.puts "\t" + line
        end
        new_file.puts ""
      else
        sub_dir = File.join(dir, f, "*.snippet")
        snippet = "\n##{f}\n----------\n\n"
        Dir.glob(sub_dir) do |d|
          snippet = snippet + "##{f}.#{d.gsub(%r((#{dir}\/#{f}\/|\.snippet)), "")}\n"
          snippet = snippet + "snippet #{f} #{d.gsub(%r((#{dir}\/#{f}\/|\.snippet)), "")}\n"
          sub_file = File.new(d, "r")
          sub_file.each do |line|
            snippet = snippet + "\t" + line
          end
          snippet = snippet + "\n\n"
        end
        snippet = snippet + "----------\n\n"
        new_file.puts snippet
      end
    end
    current_file.close if current_file
  end
else
  puts "Not a directory"
end
