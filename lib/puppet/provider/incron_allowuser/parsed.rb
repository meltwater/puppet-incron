require 'puppet/provider/parsedfile'

incronallow = case Facter.value(:osfamily)
  when 'RedHat'
    "/etc/incron.allow"
  else
    "/etc/incron.allow"
  end

unless File.exists?(incronallow)
  File.open(incronallow, 'w') do |file| 
    file.write "root"
  end
end

Puppet::Type.type(:incron_allowuser).provide(:parsed, :parent => Puppet::Provider::ParsedFile, :default_target => incronallow, :filetype => :flat) do

  desc "The incron_allowuser provider that uses the ParsedFile class"
  
  text_line :comment, :match => /^#/;
  text_line :blank, :match => /^\s*$/;
  
  record_line :parsed, :fields => %w{name}
end
