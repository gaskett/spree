# Spree Configuration
SESSION_KEY = '_spree_session_id'
SHIPPING_METHODS = [:flat_rate]
FLAT_SHIPPING_RATE = 10 # applies only to the flat rate shipping option
ORDER_FROM = "orders@example.com"
ORDER_BCC = []

TXN_TYPES = [:authorize, :capture, :purchase, :void, :credit]

ORDER_STATES = [:incomplete, :authorized, :captured, :canceled, :returned, :shipped, :paid, :pending_payement]
ORDER_OPERATIONS = [:authorize, :capture, :cancel, :return, :ship, :comp, :delete]

AVAILABLE_OPERATIONS = {
  :incomplete => [:delete],
  :authorized => [:capture, :ship, :cancel],
  :captured => [:ship, :cancel],
  :canceled => [],
  :returned => [],
  :shipped => [:return, :cancel],
  :paid => [:ship, :cancel]
}

INVENTORY_STATES = [:on_hand, :sold, :shipped, :back_ordered]

#require 'spree/support/core_ext/array/conversions'

# TODO - Add the lib/plugins stuff maybe?

ActiveRecord::Base.send :include, Spree::Preferences
ActiveRecord::Base.send :include, Spree::Preferences::ModelHooks
Spree::Preferences::MailSettings.init

# Add extra support goodies (similar to rails active support)
#class Array #:nodoc:
#  include Spree::Support::CoreExtensions::Array::Conversions
#end