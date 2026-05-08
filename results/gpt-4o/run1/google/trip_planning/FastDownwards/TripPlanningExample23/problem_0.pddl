(define (problem european_trip_problem)
    (:domain european_trip)
    (:objects
        london bucharest riga - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
    )
    (:init
        (at london day_1)
        (flight_exists london bucharest)
        (flight_exists bucharest riga)
        (day_sequence day_1 day_2)
        (day_sequence day_2 day_3)
        (day_sequence day_3 day_4)
        (day_sequence day_4 day_5)
        (day_sequence day_5 day_6)
        (day_sequence day_6 day_7)
        (day_sequence day_7 day_8)
        (workshop_in_riga day_5)
        (workshop_in_riga day_6)
        (workshop_in_riga day_7)
        (workshop_in_riga day_8)
    )
    (:goal (and
        (at riga day_8)
        (or
            (attend_workshop day_5)
            (attend_workshop day_6)
            (attend_workshop day_7)
            (attend_workshop day_8)
        )
        ;; London should be on days 1, 2, and 3 exclusively
        (at london day_1)
        (at london day_2)
        (at london day_3)
        ;; Bucharest should be on days 4, 5, and 6 exclusively
        (at bucharest day_4)
        (at bucharest day_5)
        (at bucharest day_6)
        ;; Riga should be on days 7 and 8 exclusively to fulfill 4 days' requirement
        (at riga day_7)
        (at riga day_8)
    ))
)