(define (problem trip_planning_example_21)
    (:domain trip_planning_example_21)
    (:objects
        mykonos vienna venice - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 end_of_trip - day_step
        count0 count1 count2 count3 count4 count5 count6 - day_count
    )
    (:init
        ;; Initial state based on the derived schedule: Mykonos, 2 days, on day 1
        (at mykonos)
        (current_day d1)
        (days_remaining_at_current_city count2) ; Mykonos planned for 2 days
        (visited mykonos) ; Mykonos is visited by being there

        ;; Day progression
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)
        (next_day d8 d9)
        (next_day d9 d10)
        (next_day d10 end_of_trip)

        ;; Day count progression (for decrementing)
        (next_count count1 count0)
        (next_count count2 count1)
        (next_count count3 count2)
        (next_count count4 count3)
        (next_count count5 count4)
        (next_count count6 count5)

        ;; Flight connections (bidirectional)
        (flight mykonos vienna)
        (flight vienna mykonos)
        (flight vienna venice)
        (flight venice vienna)

        ;; Workshop window definition
        (is_workshop_day d5)
        (is_workshop_day d6)
        (is_workshop_day d7)
        (is_workshop_day d8)
        (is_workshop_day d9)
        (is_workshop_day d10)

        ;; Workshop not attended initially (implicitly false by absence)
    )
    (:goal (and
        (current_day end_of_trip) ; Trip completed in 10 days
        (visited mykonos)
        (visited vienna)
        (visited venice) ; All cities visited
        (workshop_attended) ; Workshop attended
        (days_remaining_at_current_city count0) ; All days budgeted for last city must be spent
    ))
)