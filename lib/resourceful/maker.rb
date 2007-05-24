require 'resourceful/builder'
require 'resourceful/base'

module Resourceful
  module Maker
    def self.extended(base)
      base.write_inheritable_attribute :resourceful_callbacks, {}
      base.write_inheritable_attribute :resourceful_responses, {}
      base.write_inheritable_attribute :parents,               []
    end

    def make_resourceful(*args, &block)
      include Resourceful::Base

      builder = Resourceful::Builder.new
      builder.instance_eval(&block)
      builder.apply(self)
    end
  end
end
