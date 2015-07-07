module ApplicationHelper
  def render_votes(voteable)
    render :partial => 'votes/form', :locals => { :voteable => voteable }
  end
end
