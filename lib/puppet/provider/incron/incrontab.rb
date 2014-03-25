require 'puppet/provider/parsedfile'

Puppet::Type.type(:incron).provide(:incrontab, :parent => Puppet::Provider::ParsedFile, :default_target => "/var/spool/incron/#{user}") do
  commands :incrontab => "incrontab"

  text_line :blank, :match => /^\s*$/;
  record_line :incrontab, :fields => %w{path mask command}
end
