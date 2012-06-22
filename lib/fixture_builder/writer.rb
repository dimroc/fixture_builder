module FixtureBuilder
  class Writer
    SUPPORTED_FORMATS = [:yaml, :json]
    class << self
      def create(format)
        raise ArgumentError, "Format #{format} not supported" unless SUPPORTED_FORMATS.include?(format)
        "Writer::#{format.to_s.capitalize}".constantize.new
      end
    end

    def file
      raise NotImplementedError
    end

    def write
      raise NotImplementedError
    end
  end
end
