(define (problem trip-planning-p1)
    (:domain trip-planning)

    (:init
        ; Start at Berlin on Day 1
        (at berlin)
        (current_day d1)

        ; Connectivity (Berlin <-> Warsaw, Warsaw <-> Bucharest)
        (direct_flight berlin warsaw)
        (direct_flight warsaw berlin)
        (direct_flight warsaw bucharest)
        (direct_flight bucharest warsaw)
    )

    (:goal (and
        ; Total trip duration constraints satisfied (2 days each city)
        (stayed_berlin_2)
        (stayed_warsaw_2)
        (stayed_bucharest_2)
        ; Temporal/Activity constraint satisfied
        (friend_met)
        ; Trip must conclude on Day 6
        (current_day d6)
    ))
)