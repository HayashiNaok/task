
json.array!(@schedules) do |schedule|
    json.extract! schedule, :id, :task
    json.start schedule.start_date
    json.end schedule.end_date
    json.url event_url(schedule, format: :html)
end