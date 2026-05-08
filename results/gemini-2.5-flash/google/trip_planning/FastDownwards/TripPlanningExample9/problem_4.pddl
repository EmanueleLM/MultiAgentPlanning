(define (problem trip_planning_example9)
    (:domain trip_planning)
    (:objects
        the_traveler - traveler
        frankfurt bucharest stuttgart - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day ; Added day11 for next_day day10 day11
    )

    (:init
        ;; Initial location of the traveler (assuming starting in Frankfurt for Day 1 as per common practice)
        (at the_traveler frankfurt)

        ;; Current day
        (current_day day1)

        ;; Day progression
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)
        (next_day day8 day9)
        (next_day day9 day10)
        (next_day day10 day11) ; Need a successor for day10 for actions on day10

        ;; Direct flight connections (bidirectional)
        (connected bucharest frankfurt)
        (connected frankfurt bucharest)
        (connected frankfurt stuttgart)
        (connected stuttgart frankfurt)

        ;; Workshop availability days in Stuttgart (Day 5 to Day 10)
        (is_workshop_day day5)
        (is_workshop_day day6)
        (is_workshop_day day7)
        (is_workshop_day day8)
        (is_workshop_day day9)
        (is_workshop_day day10)

        ;; Workshop not attended initially
        (not (attended_workshop))

        ;; Initialize total stay days to 0 for the metric
        (= (total-stay-days) 0)
    )

    (:goal
        (and
            (current_day day11) ; The trip must conclude AFTER Day 10, meaning on Day 11
            (attended_workshop) ; Workshop must be attended
            (visited frankfurt) ; Each specified city must be visited at least once
            (visited bucharest)
            (visited stuttgart)
        )
    )
    (:metric maximize (total-stay-days))
)