module ApplicationHelper
  def format_date(fecha)
    return nil unless fecha
    fecha.strftime("%d %b %Y %I:%M %p")
  end
  def total_rentas(rentas)
    return 0 unless rentas.any?
    rentas.sum(:total)
  end
end
