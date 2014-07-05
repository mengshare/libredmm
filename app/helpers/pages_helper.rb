module PagesHelper
  def q_and_a(question, answer)
    [
      content_tag(:p, class: 'question') { icon_fa 'question', question },
      content_tag(:p, class: 'answer'  ) { icon_fa 'user', answer }
    ].join.html_safe
  end
end
