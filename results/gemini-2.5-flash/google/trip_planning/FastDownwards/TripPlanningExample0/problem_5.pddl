(define (problem trip_planning_example0)
    (:domain trip_planning)
    (:objects
        florence barcelona helsinki - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
        c0 c1 c2 c3 - city_count
    )
    (:init
        ; Initial state: agent is at a start_node, it's day 1, and 0 cities have been visited.
        (at_location start_node)
        (current_day day1)
        (num_cities_visited c0)
        (= (total-cost) 0)

        ; Day sequencing definition
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

        ; City count sequencing definition
        (next_count c0 c1)
        (next_count c1 c2)
        (next_count c2 c3)

        ; Direct flight connections (bidirectional as stated)
        (direct_flight barcelona florence)
        (direct_flight florence barcelona)
        (direct_flight helsinki barcelona)
        (direct_flight barcelona helsinki)

        ; Days within the meeting window for Florence (Day 9 to Day 14 inclusive)
        (is_meeting_window day9)
        (is_meeting_window day10)
        (is_meeting_window day11)
        (is_meeting_window day12)
        (is_meeting_window day13)
        (is_meeting_window day14)
    )
    (:goal (and
        (current_day day14)
        (num_cities_visited c3)
        (met_friend_in_florence)
    ))
)