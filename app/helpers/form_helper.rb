module FormHelper
  def form_errors(model)
    render partial: 'shared/error_explanation', locals: { model: model }
  end
end
