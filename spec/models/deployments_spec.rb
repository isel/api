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
    mock(subject).get('deployments') { { 'deployment' => 42 } }

    subject.all(nil).should == 42
  end
end