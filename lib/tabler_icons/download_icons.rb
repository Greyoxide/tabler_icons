require 'fileutils'
require 'open-uri'
require 'zip'

module TablerIcons
  class DownloadIcons
    def self.call(force_download = false)
      source_url = 'https://github.com/tabler/tabler-icons/archive/refs/heads/master.zip'
      destination_dir = File.join(Dir.pwd, 'icons')

      if File.directory?(destination_dir) && Dir.glob(File.join(destination_dir, '*')).any?
        if !force_download
          puts 'Icons directory already exists and is not empty. Use --force to overwrite existing files.'
          return
        else
          FileUtils.rm_rf(destination_dir)
        end
      end

      Zip::File.open(URI.open(source_url)) do |zipfile|
        icons_folder = zipfile.glob('tabler-icons-master/icons/*')
        icons_folder.each do |entry|
          destination_file_path = File.join(destination_dir, entry.name.split('/').last)
          entry.extract(destination_file_path) { true }
        end
      end

      puts 'Icons downloaded and extracted successfully!'
    end
  end
end
