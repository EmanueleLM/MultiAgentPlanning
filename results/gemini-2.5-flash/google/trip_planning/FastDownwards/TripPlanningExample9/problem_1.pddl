(define (problem trip_planning_example9)
    (:domain trip_planning)
    (:objects
        the_traveler - traveler
        frankfurt bucharest stuttgart - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    )

    (:init
        ;; Initial location of the traveler
        (at the_traveler frankfurt) ; Assuming starting in Frankfurt as an unstated initial condition for Day 1.

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
    )

    (:goal
        (and
            (current_day day10) ; The trip must conclude at the end of Day 10
            (attended_workshop) ; Workshop must be attended
            (visited frankfurt) ; Each specified city must be visited at least once
            (visited bucharest)
            (visited stuttgart)
        )
    )
)