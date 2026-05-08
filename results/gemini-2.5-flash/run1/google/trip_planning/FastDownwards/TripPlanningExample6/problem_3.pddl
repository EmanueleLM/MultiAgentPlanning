(define (problem trip-planning-problem)
    (:domain trip-planning)
    (:objects
        traveler - agent
        dubrovnik berlin munich - city
        day1 day2 day3 day4 day5 day6 day7 day8 - day
    )
    (:init
        (next-day day1 day2)
        (next-day day2 day3)
        (next-day day3 day4)
        (next-day day4 day5)
        (next-day day5 day6)
        (next-day day6 day7)
        (next-day day7 day8)

        (connected munich dubrovnik)
        (connected dubrovnik munich)
        (connected berlin munich)
        (connected munich berlin)

        (conference-required berlin day1)
        (conference-required berlin day4)

        (current-agent-location traveler berlin)
        (current-day day1)

        (= (total-days-dubrovnik) 0)
        (= (total-days-berlin) 1)
        (= (total-days-munich) 0)
        (= (total-cost) 0)
    )
    (:goal (and
        (current-day day8)
        (= (total-days-dubrovnik) 3)
        (= (total-days-berlin) 4)
        (= (total-days-munich) 1)
    ))
    (:metric minimize (total-cost))
)