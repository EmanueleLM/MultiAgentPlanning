(define (problem tripplanningexample12)
    (:domain trip-planning)
    (:init
        (at home) ; Traveler starts at home
        (current_day day0) ; The trip begins on day 0

        ; Sequential definition of days for the 15-day trip duration
        (next_day day0 day1)
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
        (next_day day14 day15)

        ; Defined direct flight connections between cities (symmetric)
        (has_flight amsterdam tallinn)
        (has_flight tallinn amsterdam)
        (has_flight valencia amsterdam)
        (has_flight amsterdam valencia)

        ; Predicates marking the valid days for the Tallinn meeting
        (day_is_between_9_and_15 day9)
        (day_is_between_9_and_15 day10)
        (day_is_between_9_and_15 day11)
        (day_is_between_9_and_15 day12)
        (day_is_between_9_and_15 day13)
        (day_is_between_9_and_15 day14)
        (day_is_between_9_and_15 day15)
    )
    (:goal (and
        (visited valencia) ; All three cities must be visited
        (visited amsterdam)
        (visited tallinn)
        (tallinn_meeting_met) ; The friend meeting in Tallinn must occur
        (at home) ; The trip must end by returning home
        (current_day day15) ; The trip must conclude exactly on day 15
    ))
)