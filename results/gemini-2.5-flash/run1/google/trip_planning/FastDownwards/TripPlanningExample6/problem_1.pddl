(define (problem trip-planning-problem)
    (:domain trip-planning)
    (:objects
        traveler - agent
        dubrovnik berlin munich - city
        day1 day2 day3 day4 day5 day6 day7 day8 - day
    )
    (:init
        ;; Day progression facts
        (next-day day1 day2)
        (next-day day2 day3)
        (next-day day3 day4)
        (next-day day4 day5)
        (next-day day5 day6)
        (next-day day6 day7)
        (next-day day7 day8)

        ;; Flight connections (bidirectional)
        (connected munich dubrovnik)
        (connected dubrovnik munich)
        (connected berlin munich)
        (connected munich berlin)

        ;; Conference requirements
        (conference-required berlin day1)
        (conference-required berlin day4)

        ;; Initial state for the traveler on Day 1
        (current-agent-location traveler berlin)
        (current-day day1)

        ;; Initial fluent values
        ;; Day 1 is in Berlin as per specification, so total-days-berlin starts at 1.
        ;; The actions will then count for Day 2 through Day 8.
        (= (total-days-dubrovnik) 0)
        (= (total-days-berlin) 1)
        (= (total-days-munich) 0)
        (= (total-cost) 0)
    )
    (:goal (and
        (current-day day8) ; Ensure the plan covers all days up to Day 8
        (= (total-days-dubrovnik) 3)
        (= (total-days-berlin) 4)
        (= (total-days-munich) 1)
    ))
    (:metric minimize (total-cost))
)