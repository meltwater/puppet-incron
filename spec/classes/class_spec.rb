require 'spec_helper'

describe 'incron' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:params) do
          {
            :manage_service => true,
          }
        end
        let(:facts) do
          facts
        end

        context "incron class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('incron::params') }
#          it { is_expected.to contain_class('incron::install').that_comes_before('::incron::config') }
#          it { is_expected.to contain_class('incron::config') }
#          it { is_expected.to contain_class('incron::service').that_subscribes_to('::incron::config') }

          case facts[:osfamily]
          when 'Debian'
            it { is_expected.to contain_service('incron') }
          else
            it { is_expected.to contain_service('incrond') }
            
          end 
          it { is_expected.to contain_package('incron').with_ensure('installed') }
          
        end
      end
    end
  end

end