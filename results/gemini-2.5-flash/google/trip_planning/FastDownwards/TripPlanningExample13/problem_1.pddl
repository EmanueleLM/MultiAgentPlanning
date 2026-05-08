(define (problem tripplanningexample13)
    (:domain trip_planning)
    (:objects
        lyon bucharest manchester - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day_index
        n0 n1 n2 n3 n4 n5 n6 n7 - num_count
    )
    (:init
        ; Day progression for 17 days
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
        (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)

        ; Number count progression up to n7 for 7 days in Manchester
        (next_num n0 n1) (next_num n1 n2) (next_num n2 n3) (next_num n3 n4)
        (next_num n4 n5) (next_num n5 n6) (next_num n6 n7)

        ; Connectivity: Manchester <-> Bucharest, Bucharest <-> Lyon
        (is_connected manchester bucharest)
        (is_connected bucharest manchester)
        (is_connected bucharest lyon)
        (is_connected lyon bucharest)

        ; Helper predicate for Lyon relatives visit window (Day 13-17 inclusive)
        (day_is_d13_or_later d13)
        (day_is_d13_or_later d14)
        (day_is_d13_or_later d15)
        (day_is_d13_or_later d16)
        (day_is_d13_or_later d17)
    )
    (:goal (and
        (current_day d17) ; The trip must end after day 17 has been spent
        (days_in_lyon n5) ; Stay 5 days in Lyon
        (days_in_bucharest n5) ; Stay 5 days in Bucharest (adjusted from 7 by orchestrator)
        (days_in_manchester n7) ; Stay 7 days in Manchester (consistent with adjusted total)
        (has_visited lyon) ; All cities must be visited
        (has_visited bucharest)
        (has_visited manchester)
        (lyon_relatives_met) ; Relatives in Lyon visited between day 13 and day 17
    ))
)