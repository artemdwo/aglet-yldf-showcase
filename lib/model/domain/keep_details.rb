#encoding: UTF-8
class Model::Domain::KeepDetails < Model::Domain::Content

  def initialize
    @host_to_match = 'keep.google.com'
  end

end