(define (problem TripPlanningExample18)
    (:domain trip-planning)
    (:objects
        amsterdam vilnius bucharest - city
    )
    (:init
        (at amsterdam) ; Starting city, chosen arbitrarily
        (visited amsterdam) ; Starting city is considered visited
        (not (visited vilnius))
        (not (visited bucharest))

        (connected amsterdam bucharest)
        (connected bucharest amsterdam)
        (connected vilnius amsterdam)
        (connected amsterdam vilnius)

        (= (current-day) 1)
        (= (days-spent-amsterdam) 0)
        (= (days-spent-vilnius) 0)
        (= (days-spent-bucharest) 0)
        (= (total-cost) 0)
        (not (friend-met))
    )
    (:goal (and
        (visited amsterdam)
        (visited vilnius)
        (visited bucharest)
        (friend-met)
        (= (current-day) 11) ; The trip must last exactly 11 days
        (preference p_amsterdam (>= (days-spent-amsterdam) 5)) ; Desired stay in Amsterdam
        (preference p_vilnius (>= (days-spent-vilnius) 2))     ; Desired stay in Vilnius
        (preference p_bucharest (>= (days-spent-bucharest) 6)) ; Desired stay in Bucharest
    ))
    (:metric minimize (total-cost))
)