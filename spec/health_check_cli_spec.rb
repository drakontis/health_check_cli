require "spec_helper"

RSpec.describe HealthCheckCli do
  it "has a version number" do
    expect(HealthCheckCli::VERSION).not_to be nil
  end
end
