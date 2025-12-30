(define (domain TripPlanningExample5)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        stay_count
    )

    (:constants
        Oslo Porto Dubrovnik - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 D15 D16 D17 - day
        S0 S1 S2 S3 S4 S5 S6 S7 - stay_count
    )

    (:predicates
        (at ?c - city)
        (current-day ?d - day)
        (next-day ?d1 - day ?d2 - day)
        (next-count ?s1 - stay_count ?s2 - stay_count)
        (stay-count ?c - city ?s - stay_count)
        (connection ?c1 ?c2 - city)
        (conference-day ?d - day)
    )

    ; 1. Stay in Dubrovnik on a mandatory conference day (D12 or D16).
    ; This action must be the only valid action available on D12 and D16.
    (:action stay-dubrovnik-conference
        :parameters (?d - day ?d_next - day ?s - stay_count ?s_next - stay_count)
        :precondition (and
            (at Dubrovnik)
            (current-day ?d)
            (conference-day ?d)
            (next-day ?d ?d_next)
            (stay-count Dubrovnik ?s)
            (next-count ?s ?s_next)
        )
        :effect (and
            (not (current-day ?d))
            (current-day ?d_next)
            (not (stay-count Dubrovnik ?s))
            (stay-count Dubrovnik ?s_next)
        )
    )

    ; 2. Stay in any city on a regular day (D != 12, D != 16).
    (:action stay-regular
        :parameters (?c - city ?d - day ?d_next - day ?s - stay_count ?s_next - stay_count)
        :precondition (and
            (at ?c)
            (current-day ?d)
            (not (conference-day ?d))
            (next-day ?d ?d_next)
            (stay-count ?c ?s)
            (next-count ?s ?s_next)
        )
        :effect (and
            (not (current-day ?d))
            (current-day ?d_next)
            (not (stay-count ?c ?s))
            (stay-count ?c ?s_next)
        )
    )

    ; 3. Travel between connected cities, only on days that are NOT conference days.
    (:action travel
        :parameters (?c1 - city ?c2 - city ?d - day ?d_next - day)
        :precondition (and
            (at ?c1)
            (current-day ?d)
            (connection ?c1 ?c2)
            (next-day ?d ?d_next)
            (not (conference-day ?d))
        )
        :effect (and
            (not (at ?c1))
            (at ?c2)
            (not (current-day ?d))
            (current-day ?d_next)
        )
    )
)