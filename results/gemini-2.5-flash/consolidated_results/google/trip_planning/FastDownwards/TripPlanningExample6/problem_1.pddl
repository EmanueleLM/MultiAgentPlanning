(define (problem trip-planning-6-problem)
    (:domain trip-planning-6)
    (:objects
        D1 D2 D3 D4 D5 D6 D7 D8 - day
    )

    (:init
        ; Time progression D1 -> D8
        (current-day D1)
        (next-day D1 D2)
        (next-day D2 D3)
        (next-day D3 D4)
        (next-day D4 D5)
        (next-day D5 D6)
        (next-day D6 D7)
        (next-day D7 D8)
        
        (final-day D8)

        ; Connectivity: Munich <-> Dubrovnik, Berlin <-> Munich
        (is-direct-flight MUN DUB)
        (is-direct-flight DUB MUN)
        (is-direct-flight BER MUN)
        (is-direct-flight MUN BER)
        
        ; Traveler starts in Berlin for Day 1 conference requirement
        (at BER) 
        
        ; Mandatory conference location constraints (Requires arrival location for D4 to be BER)
        (required-at-berlin D4)
    )

    (:goal (and
        (goal-D8-reached) 
        
        ; Duration constraints: BER 4, DUB 3, MUN 1
        (ber-c4)
        (dub-c3)
        (mun-c1)
    ))
)