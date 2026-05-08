(define (problem trip_planning_problem_0)
    (:domain trip_planning_domain)
    (:objects
        florence barcelona helsinki - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
        me - traveler
    )
    (:init
        (at me florence) ; Traveler starts in Florence (or is initially in Florence for the first activity)
        (current_day day1) ; Planning starts from Day 1

        ; Day sequencing for 14 days
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

        ; Direct flight connections as specified
        (direct_flight barcelona florence)
        (direct_flight florence barcelona)
        (direct_flight helsinki barcelona)
        (direct_flight barcelona helsinki)

        ; City identification
        (is_florence florence)

        ; Florence meeting window (Day 9 to Day 14 inclusive)
        (is_meeting_possible_day day9)
        (is_meeting_possible_day day10)
        (is_meeting_possible_day day11)
        (is_meeting_possible_day day12)
        (is_meeting_possible_day day13)
        (is_meeting_possible_day day14)
    )
    (:goal (and
        (has_visited florence)
        (has_visited barcelona)
        (has_visited helsinki)
        (meeting_done)
        (current_day day14)     ; Ensures planning completes up to Day 14 (i.e., current_day advanced to day14)
        (scheduled_day day14)   ; Ensures Day 14 itself is an activity day, completing the 14-day trip
    ))