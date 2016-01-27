require 'spec_helper_acceptance'

describe 'incron class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'incron': }
        
      incron {'test1':
        user    => 'root',
        command => 'touch /tmp/1',
        path    => '/root/',
        mask    => ['IN_CREATE'],
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end
    
    _osfamily               = fact('osfamily')
    _operatingsystem        = fact('operatingsystem')
    _operatingsystemrelease = fact('operatingsystemrelease').to_f
      
    case _osfamily
    when 'Debian'
      describe service('incron') do
        it { is_expected.to be_enabled }
        it { is_expected.to be_running }
      end
    else
      describe service('incrond') do
        it { is_expected.to be_enabled }
        it { is_expected.to be_running }
      end
    end
    
    describe file('/var/spool/incron/root') do
      it { should be_file }
      it { should contain '/root/ IN_CREATE touch /tmp/1' }
    end
  end
end