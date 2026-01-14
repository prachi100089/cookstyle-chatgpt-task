RSpec.describe Cookstyle::Cops::Chef::DeprecatedExecuteResource do
  subject(:cop) { described_class.new }

  it 'flags execute resource usage' do
    expect_offense(<<~RUBY)
      execute 'install nginx' do
      ^^^^^^^ Avoid using execute resource for package installation. Use package resource instead.
        command 'apt-get install nginx'
      end
    RUBY
  end

  it 'allows package resource' do
    expect_no_offenses(<<~RUBY)
      package 'nginx'
    RUBY
  end
end
