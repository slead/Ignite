module ApplicationHelper
  # Highlight the current menu item in the navigation
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
  def markdown(content)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disabled_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end

  def og_description
    #Personalise the Facebook description text for each page
    if @og_description.nil?
      puts "description is standard one"
      return "Ignite is a series of 5-minute presentations, where each presenter must use 20 slides, which auto-advance every 15 seconds. Ignite events take place all over the world."
    else
      puts "descrition is " + @og_description
      return @og_description
   end 
  end 
  
end
