(define (problem trip-planning-example5)
    (:domain trip-planning)
    (:objects
        oslo porto dubrovnik - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
    )
    (:init
        (at oslo) ; Starting city, arbitrarily chosen as Oslo due to centrality
        (current_day d1)

        ; Flight routes (bidirectional)
        (flight_route oslo dubrovnik)
        (flight_route dubrovnik oslo)
        (flight_route porto oslo)
        (flight_route oslo porto)

        ; Day progression for 16 days (d1 to d17 means 16 full days passed)
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
        (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)

        ; Conference days in Dubrovnik
        (dubrovnik_conference_day d12)
        (dubrovnik_conference_day d16)
    )
    (:goal (and
        (current_day d17) ; Trip ends after 16 full days
        (visited oslo)
        (visited porto)
        (visited dubrovnik)
        (attended_conference_on_day d12)
        (attended_conference_on_day d16)
    ))
)