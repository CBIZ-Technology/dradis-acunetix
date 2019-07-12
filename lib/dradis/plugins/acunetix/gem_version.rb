module Dradis
  module Plugins
    module Acunetix
      # Returns the version of the currently loaded Acunetix as a <tt>Gem::Version</tt>
      def self.gem_version
        Gem::Version.new VERSION::STRING
      end

      module VERSION
        MAJOR = 3
        MINOR = 13
        TINY = 0
        PRE = 1

        STRING = [MAJOR, MINOR, TINY, PRE].compact.join(".")
      end
    end
  end
end
