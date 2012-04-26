require "bundler"
Bundler.require :default, :development, :test

RSpec.configure do |c|
  # so we can use `:vcr` rather than `:vcr => true`;
  # in RSpec 3 this will no longer be necessary.
  # c.treat_symbols_as_metadata_keys_with_true_values = true
  c.extend VCR::RSpec::Macros
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :fakeweb
  # c.configure_rspec_metadata!
end
