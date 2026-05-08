(define (problem TripPlanningExample18)
    (:domain trip-planning)
    (:objects
        amsterdam vilnius bucharest - city
    )
    (:init
        (at amsterdam) ; Starting city, chosen arbitrarily
        (visited amsterdam) ; Starting city is considered visited
        
        (connected amsterdam bucharest)
        (connected bucharest amsterdam)
        (connected vilnius amsterdam)
        (connected amsterdam vilnius)

        (= (current-day) 1)
        (not (friend-met))
    )
    (:goal (and
        (visited amsterdam)
        (visited vilnius)
        (visited bucharest)
        (friend-met)
        (= (current-day) 11) ; The trip must last exactly 11 days
    ))
)