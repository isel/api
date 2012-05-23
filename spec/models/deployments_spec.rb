require 'spec_helper'

describe Deployments do
  let(:api) do
    api = Object.new

    stub(api).log=
    stub(api).login

    api
  end

  subject do
    Deployments.new(api)
  end

  it 'should do a get for the list of deployments' do
    mock(subject).get('deployments') do
      [
        {'nickname' => 'name1'},
        {'nickname' => 'name2'}
      ]
    end

    result = subject.all
    result.count.should == 2
    result[0].name.should == 'name1'
    result[1].name.should == 'name2'
  end

end