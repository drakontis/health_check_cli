require "spec_helper"

RSpec.describe HealthCheckCli do
  it "has a version number" do
    expect(HealthCheckCli::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
