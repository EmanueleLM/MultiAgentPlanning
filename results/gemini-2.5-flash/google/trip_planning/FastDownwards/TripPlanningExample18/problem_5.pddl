(define (problem TripPlanningExample18)
    (:domain trip-planning)
    (:objects
        amsterdam vilnius bucharest - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    )
    (:init
        ; Initial location and visited status
        (at amsterdam)
        (visited amsterdam)
        
        ; Direct flight connections (bidirectional)
        (connected amsterdam bucharest)
        (connected bucharest amsterdam)
        (connected vilnius amsterdam)
        (connected amsterdam vilnius)

        ; Initial day of the trip
        (current_day day1)
        
        ; Chronological order of days for a 11-day trip
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)
        (next_day day8 day9)
        (next_day day9 day10)
        (next_day day10 day11)

        ; Days when the friend meeting is possible (Day 6 through Day 11)
        (is_meeting_day day6)
        (is_meeting_day day7)
        (is_meeting_day day8)
        (is_meeting_day day9)
        (is_meeting_day day10)
        (is_meeting_day day11)

        ; Friend meeting status
        (not (friend_met))
    )
    (:goal (and
        ; All specified cities must be visited
        (visited amsterdam)
        (visited vilnius)
        (visited bucharest)
        ; The friend meeting requirement must be fulfilled
        (friend_met)
        ; The trip must last exactly 11 days, meaning the final state is on day11
        (current_day day11)
    ))
)