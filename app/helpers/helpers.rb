helpers do

  def display_order(task_array)
    ordered_by_id = task_array.sort_by(&:id)
  end

end