module ApplicationHelper


  

  

  def pluralize_sk(count, plural_1, singular, plural_2)
    case count
      when 1
        "#{count} #{singular}"
      when 2..4
        "#{count} #{plural_2}"
      else
        "#{count} #{plural_1}"
    end
  end




  def do_fun name
    "--------------" + name + "--------------"
  end

end
