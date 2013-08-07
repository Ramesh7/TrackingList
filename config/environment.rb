# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TicketManagement::Application.initialize!

require 'simplecov'
SimpleCov.start 'rails'