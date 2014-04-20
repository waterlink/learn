module Learn
  class Pdf
    PHANTOMJS_BINARY = ENV['PHANTOMJS_BINARY'] || 'phantomjs'
    RASTERIZE_BINARY = ENV['RASTERIZE_BINARY'] || './lib/learn/pdf/rasterize.js'
    DOWNLOAD_PREFIX = '/downloads/print/'
    STORAGE_PREFIX = './tmp/files/print/'

    def self.print(url)
      puts url
      name = unique_pdf_name
      dump_pdf url, name
      download_url name
    end

    private

    def self.unique_pdf_name
      "#{Time.now.to_i}#{(rand * 10**10).to_i}.pdf"
    end

    def self.dump_pdf(url, name)
      ::ActiveRecord::Base.clear_all_connections!
      Process.fork do
        reestablish_connection
        puts `#{PHANTOMJS_BINARY} ./lib/learn/pdf/rasterize.js '#{url}' #{STORAGE_PREFIX}#{name} A4`
      end
    end

    def self.download_url(name)
      "#{DOWNLOAD_PREFIX}#{name}"
    end

    def self.reestablish_connection
      database_config = YAML::load ERB.new(File.read 'config/database.yml').result
      ::ActiveRecord::Base.establish_connection(database_config[Rails.env])
    end
  end
end
