#/bin/rb

f_in = File.open(ARGV[0])

prev_key = nil
val = nil
line_out = nil
while line = f_in.gets
  #puts line
  vals = line.split("\t")
  key = vals[0]
  if(prev_key == key)
    line_out = line_out + "\t" +line.gsub(/\n/,"")
  else
    if !line_out.nil?
      puts line_out
    end
    prev_key = key
    line_out = line.gsub(/\n/,"")
  end
end

puts line_out
