# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_katalog_session',
  :secret      => '8a740268d57f7396d1faa7997f73e8cc1600a10a6a8fea5d891cca9a9f936206ba3f3a476974250cf926dc143e3c3afe345024a4b8f074ba0b541cf2b43976b4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
