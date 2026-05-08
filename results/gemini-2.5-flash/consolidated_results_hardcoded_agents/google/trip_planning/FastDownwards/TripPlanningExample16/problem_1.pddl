(define (problem trip-planning-PVR-9days)
    (:domain TripPlanning)
    (:objects
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day_marker
        prague vienna porto - city
    )
    (:init
        ;; Time progression initialization
        (current_day d1)
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)
        (next_day d8 d9)
        (next_day d9 d10)

        ;; Location: Must start in Prague to satisfy the Day 1 constraint
        (at prague)
        
        ;; Duration initialization
        (= (days_in_city prague) 0)
        (= (days_in_city vienna) 0)
        (= (days_in_city porto) 0)
        
        ;; Cost initialization
        (= (total-cost) 0)
    )
    (:goal (and
        (current_day d10) ; Total trip duration of 9 days completed
        
        ;; Duration Constraints (P=3, V=3, R=3 to total 9 days and optimize deviation)
        (= (days_in_city prague) 3)
        (= (days_in_city vienna) 3)
        (= (days_in_city porto) 3)

        ;; Workshop Temporal Constraint (Prague D1, D2, D3 mandatory)
        (visited_prague_d1)
        (visited_prague_d2)
        (visited_prague_d3)
    ))
    (:metric minimize (total-cost))
)