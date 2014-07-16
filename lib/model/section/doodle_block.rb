class Model::Section::DoodleBlock < SitePrism::Section
            
  #Element  #ID,                  locator
  elements  :arch_results,         '#archive-list .title a'

  def result (index)
    wait_for_arch_results
    arch_results[index]
  end

end