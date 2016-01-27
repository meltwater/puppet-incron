require 'spec_helper'

# find all parameters that don't have default values and put in here
# ensure validation occurs
describe Puppet::Type.type(:incron_allowuser) do
  # these should be only the require parameters
  let(:required_properties) do
    {

      :name => 'some_name'
    }
  end

  let(:optional_properties) do
     {

     }
  end

  let(:properties) do
     required_properties.merge(optional_properties)
  end

  let(:name) do
     'some_name'
  end

  let(:type_instance) do
    #
    Puppet::Type.type(:incron_allowuser).new(:name => name) 
  end


  describe :name do
    it 'should have a name parameter' do
      expect(Puppet::Type.type(:incron_allowuser).attrtype(:name)).to eq(:param)
    end
#    it 'should raise ArgumentError if not valid value' do
#      expect { Puppet::Type.type(:incron_allowuser).new(:name => name, :ensure => :present) }.to raise_error(Puppet::ResourceError)
#    end
#    it 'should validate and pass if valid value' do
#      expect(Puppet::Type.type(:incron_allowuser).new(:name => name, :ensure => :present)).to eq('')
#    end
  end

  describe :ensure do
    it 'should have a ensure property' do
      expect(Puppet::Type.type(:incron_allowuser).attrtype(:ensure)).to eq(:property)
    end
    it 'should raise ArgumentError if not valid value' do
      expect do
        Puppet::Type.type(:incron_allowuser).new(:name => name, :ensure => :present, :ensure => 'some_bad_value')
      end.to raise_error(Puppet::ResourceError)
    end
#    it 'should validate and pass if valid value' do
#      expect(Puppet::Type.type(:incron_allowuser).new(:name => name, :ensure => :present, :ensure => 'some_value')).to eq('')
#    end
  end

  describe :target do
    it 'should have a target property' do
      expect(Puppet::Type.type(:incron_allowuser).attrtype(:target)).to eq(:property)
    end
#    it 'should raise ArgumentError if not valid value' do
#      expect do
#        Puppet::Type.type(:incron_allowuser).new(:name => name, :ensure => :present, :target => 'some_bad_value')
#      end.to raise_error(Puppet::ResourceError)
#    end
#    it 'should validate and pass if valid value' do
#      expect(Puppet::Type.type(:incron_allowuser).new(:name => name, :ensure => :present, :target => 'some_value')).to eq('')
#    end
  end
end
