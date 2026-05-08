(define (problem tripplanningexample11)
    (:domain trip_planning)
    (:objects
        vienna vilnius valencia - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day ; d16 represents the state after day 15 is complete
    )
    (:init
        ; Initial location (arbitrarily chosen as Vienna, as not specified, but must be one of the cities)
        (at vienna)
        ; Trip starts on day 1
        (current_day d1)

        ; Initialize total-cost fluent for action costs
        (= (total-cost) 0)

        ; Direct flight connections (bi-directional as implied by "to commute between cities")
        (direct_flight vienna valencia)
        (direct_flight valencia vienna)
        (direct_flight vilnius vienna)
        (direct_flight vienna vilnius)

        ; Define the sequence of days for the 15-day trip
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
        (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) ; d16 marks the completion of day 15

        ; Hard conference schedule
        (conference_on_day_at d9 valencia)
        (conference_on_day_at d15 valencia)
    )
    (:goal (and
        ; Ensure the trip concludes after exactly 15 days (i.e., we have progressed past d15 to the state representing d16)
        (current_day d16)
        ; Ensure all mandatory conferences are attended
        (conference_attended d9 valencia)
        (conference_attended d15 valencia)
        ; Explicitly not including required stays (Vienna 5, Vilnius 5, Valencia 7) as hard goals,
        ; as their sum (17) exceeds the total available days (15),
        ; following the directive to prioritize hard conferences and total duration.
    ))
    (:metric minimize (total-cost)) ; Fast Downwards should minimize the total cost of actions
)