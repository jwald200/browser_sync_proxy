require 'spec_helper'

describe BrowserSyncProxy::CLI do

  it 'will error if no args given'  do
    expect {BrowserSyncProxy::CLI.new}.to raise_error
  end
end
