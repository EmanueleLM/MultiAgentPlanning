(define (problem trip_planning_example_29_problem)
    (:domain trip_planning_example_29)
    (:objects
        frankfurt krakow dubrovnik - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
        c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 - count
    )
    (:init
        ;; Flight connections (bidirectional)
        (can_fly frankfurt krakow)
        (can_fly krakow frankfurt)
        (can_fly dubrovnik frankfurt)
        (can_fly frankfurt dubrovnik)

        ;; Day sequence
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10)

        ;; Count sequence
        (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
        (next_count c4 c5) (next_count c5 c6) (next_count c6 c7) (next_count c7 c8)
        (next_count c8 c9) (next_count c9 c10)

        ;; Starting state: User starts in Dubrovnik on Day 1.
        ;; This choice is made because the 12 total city-units required in 10 days
        ;; effectively forces a path where Dubrovnik is either the start or end
        ;; due to its 7-day requirement.
        (at dubrovnik d1)
        (was_at dubrovnik d1)
        (city_count dubrovnik c1)
        (city_count frankfurt c0)
        (city_count krakow c0)
    )
    (:goal
        (and
            ;; Krakow wedding constraint: present in Krakow on Day 9 and Day 10.
            (was_at krakow d9)
            (was_at krakow d10)

            ;; City duration constraints:
            ;; Krakow: 2 days
            ;; Dubrovnik: 7 days
            ;; Frankfurt: 3 days
            (city_count krakow c2)
            (city_count dubrovnik c7)
            (city_count frankfurt c3)

            ;; Ensure the trip lasts through Day 10.
            (at krakow d10)
        )
    )
)