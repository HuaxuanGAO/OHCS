class Slot < ApplicationRecord
  belongs_to :schedule

  DURATION_IN_MINUTES = 30

  def generate_time_slots(start_time:, end_time:)
    slots = []
    total = num_slots(start_time, end_time)
    1.upto(total) do
      slot = []
      slot << start.to_formatted_string
      start += (DURATION_IN_MINUTES * 60)
      slot << start.to_formatted_string
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

slots_array = Slot.new.generate_time_slots(start_time: start_time, end_time: end_time)

slots_array.map { |slot_time| Slot.create!(schedule: @schedule, start_time: slot_time[0], end_time: slot_time[1]) }