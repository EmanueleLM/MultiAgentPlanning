(define (problem trip_planning_problem_0)
    (:domain trip_planning_domain)
    (:objects
        florence barcelona helsinki - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
        me - traveler
    )
    (:init
        ; Traveler starts on Day 1 in Florence. The specific starting city is an arbitrary choice
        ; to kickstart the planning; the planner can find optimal starting city based on goal.
        (at me florence day1)
        (current_planning_day day1)

        ; Day sequencing
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
        (next_day day11 day12)
        (next_day day12 day13)
        (next_day day13 day14)

        ; Direct flight connections
        (direct_flight barcelona florence)
        (direct_flight florence barcelona)
        (direct_flight helsinki barcelona)
        (direct_flight barcelona helsinki)

        ; Florence meeting window (Day 9 to Day 14 inclusive)
        (is_meeting_day day9)
        (is_meeting_day day10)
        (is_meeting_day day11)
        (is_meeting_day day12)
        (is_meeting_day day13)
        (is_meeting_day day14)
    )
    (:goal (and
        (has_visited florence)
        (has_visited barcelona)
        (has_visited helsinki)
        (meeting_done)
        (current_planning_day day14) ; Ensures all days are accounted for
    ))
)