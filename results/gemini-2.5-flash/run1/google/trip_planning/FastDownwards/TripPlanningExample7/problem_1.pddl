(define (problem trip_planning_example_7_problem)
    (:domain trip_planning_example_7)
    (:objects
        venice dubrovnik istanbul - city
    )
    (:init
        (= (total_days_spent) 0)
        (= (days_in_venice) 0)
        (= (days_in_dubrovnik) 0)
        (= (days_in_istanbul) 0)
        (= (total_stay_days_achieved) 0)

        ;; Assumption: The trip starts in Dubrovnik, as it is the only city with outgoing direct flights
        ;; and a specific start city is not provided in the problem statement.
        (at dubrovnik)
        (has_visited dubrovnik) ; Initial city is considered visited

        ;; Direct flight connections
        (direct_flight dubrovnik istanbul)
        (direct_flight dubrovnik venice)
    )
    (:goal (and
        (has_visited venice)
        (has_visited dubrovnik)
        (has_visited istanbul)
        (<= (total_days_spent) 11)
    ))
    (:metric maximize (total_stay_days_achieved))
)