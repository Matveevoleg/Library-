require 'yaml'

module IOModule

  def save_to_yaml
    File.open('library.yaml','w') do |f|
      f.write(self.to_yaml)
    end
  end

  def load_from_yaml(path)
    data = YAML.load(File.read(path))
    raise 'Error' if data.nil?
    data
  end

end