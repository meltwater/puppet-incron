Puppet::Type.newtype(:incron_allowuser) do
  @doc = "Manage the contents of /etc/incron.allow
  
          incron_allowuser { 'wleese':
              ensure => present,
          }"
  
  ensurable
  
  newparam(:name) do
    desc "The user to manage"
    
    isnamevar
  end
  
  newproperty(:target) do
    desc "Location of the incron.allow file"
    
    defaultto {
      if
        @resource.class.defaultprovider.ancestors.include?(Puppet::Provider::ParsedFile)
        @resource.class.defaultprovider.default_target
      else
        nil
      end
    }
  end
end
