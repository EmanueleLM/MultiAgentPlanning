(define (problem trip_planning_example6_problem)
    (:domain trip_planning_example6)
    (:objects
        the_traveler - traveler
        day1 day2 day3 day4 day5 day6 day7 day8 - day
        dubrovnik berlin munich - city
    )
    (:init
        (current_day day1)
        (at_city the_traveler berlin) ; Assuming start in Berlin due to day1 conference

        ;; Temporal progression
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)

        ;; Direct flight connections (bidirectional)
        (is_connected munich dubrovnik)
        (is_connected dubrovnik munich)
        (is_connected berlin munich)
        (is_connected munich berlin)

        ;; Conference requirements
        (conference_required day1 berlin)
        (conference_required day4 berlin)
    )
    (:goal (and
        ;; Ensure all 8 days are planned and account for conference locations
        (spent_day_in day1 berlin)
        (spent_day_in day2 ?c2)
        (spent_day_in day3 ?c3)
        (spent_day_in day4 berlin)
        (spent_day_in day5 ?c5)
        (spent_day_in day6 ?c6)
        (spent_day_in day7 ?c7)
        (spent_day_in day8 ?c8)
    ))
)