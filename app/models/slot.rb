class Slot < ApplicationRecord
  belongs_to :schedule

  DURATION_IN_MINUTES = 30

  def generate_time_slots(start_time:, end_time:)
    slots = []
    total = num_slots(start_time, end_time)
    1.upto(total) do
      slot = []
      slot << start_time.to_formatted_s
      start_time += (DURATION_IN_MINUTES * 60)
      slot << start_time.to_formatted_s
      slots << slot
    end
    slots
  end

  def num_slots(start, finish)
    count = (finish.hour - start.hour) * (60 / DURATION_IN_MINUTES)
    if finish.min == 30
      count += 1
    end
    if start.min == 30
      count -= 1
    end
    return count
  end

end
