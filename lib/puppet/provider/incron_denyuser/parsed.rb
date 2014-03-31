require 'puppet/provider/parsedfile'

incrondeny = case Facter.value(:osfamily)
  when 'RedHat'
    "/etc/incron.deny"
  else
    "/etc/incron.deny"
  end

unless File.exists?(incrondeny)
  File.open(incrondeny, 'w') do |file| 
    file.write ""
  end
end

Puppet::Type.type(:incron_denyuser).provide(:parsed, :parent => Puppet::Provider::ParsedFile, :default_target => incrondeny, :filetype => :flat) do

  desc "The incron_allowuser provider that uses the ParsedFile class"
  
  text_line :comment, :match => /^#/;
  text_line :blank, :match => /^\s*$/;
  
  record_line :parsed, :fields => %w{name}
end
