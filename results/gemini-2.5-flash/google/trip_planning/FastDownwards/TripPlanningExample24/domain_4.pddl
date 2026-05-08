(define (domain trip_planning)
    (:requirements :typing :negative-preconditions)
    (:types
        city
        day
        day_count
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (connected ?c1 ?c2 - city)
        (visited ?c - city)

        (florence_stay_count ?n - day_count)
        (amsterdam_stay_count ?n - day_count)
        (riga_stay_count ?n - day_count)

        (florence_minimum_stay_met)
        (amsterdam_minimum_stay_met)
        (riga_minimum_stay_met)
    )

    ;; Actions for staying in Florence (4 days required)
    (action stay_florence_day_1
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at florence)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (florence_stay_count c0)
            (not (florence_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (florence_stay_count c0))
            (florence_stay_count c1)
        )
    )
    (action stay_florence_day_2
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at florence)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (florence_stay_count c1)
            (not (florence_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (florence_stay_count c1))
            (florence_stay_count c2)
        )
    )
    (action stay_florence_day_3
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at florence)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (florence_stay_count c2)
            (not (florence_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (florence_stay_count c2))
            (florence_stay_count c3)
        )
    )
    (action stay_florence_day_4_complete
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at florence)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (florence_stay_count c3)
            (not (florence_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (florence_stay_count c3))
            (florence_stay_count c4)
            (florence_minimum_stay_met)
        )
    )

    ;; Actions for staying in Amsterdam (2 days required after adjustment)
    (action stay_amsterdam_day_1
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at amsterdam)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (amsterdam_stay_count c0)
            (not (amsterdam_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (amsterdam_stay_count c0))
            (amsterdam_stay_count c1)
        )
    )
    (action stay_amsterdam_day_2_complete
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at amsterdam)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (amsterdam_stay_count c1)
            (not (amsterdam_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (amsterdam_stay_count c1))
            (amsterdam_stay_count c2)
            (amsterdam_minimum_stay_met)
        )
    )
    ;; Removed actions for day_3, day_4, day_5 to match new c2 goal for Amsterdam.

    ;; Actions for staying in Riga (4 days required after adjustment)
    (action stay_riga_day_1
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at riga)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (riga_stay_count c0)
            (not (riga_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (riga_stay_count c0))
            (riga_stay_count c1)
        )
    )
    (action stay_riga_day_2
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at riga)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (riga_stay_count c1)
            (not (riga_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (riga_stay_count c1))
            (riga_stay_count c2)
        )
    )
    (action stay_riga_day_3
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at riga)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (riga_stay_count c2)
            (not (riga_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (riga_stay_count c2))
            (riga_stay_count c3)
        )
    )
    (action stay_riga_day_4_complete
        :parameters (?current_d - day ?next_d - day)
        :precondition (and
            (at riga)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (riga_stay_count c3)
            (not (riga_minimum_stay_met))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (riga_stay_count c3))
            (riga_stay_count c4)
            (riga_minimum_stay_met)
        )
    )

    ;; General travel action
    (action travel
        :parameters (?from - city ?to - city ?current_d - day ?next_d - day)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            ;; Cannot travel on workshop days (Day 1-4) in Florence
            (not (current_day d1))
            (not (current_day d2))
            (not (current_day d3))
            (not (current_day d4))
            ;; Must meet minimum stay requirement before leaving a city
            (or
                (not (at florence))
                (florence_minimum_stay_met)
            )
            (or
                (not (at amsterdam))
                (amsterdam_minimum_stay_met)
            )
            (or
                (not (at riga))
                (riga_minimum_stay_met)
            )
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current_day ?current_d))
            (current_day ?next_d)
            (visited ?to)
        )
    )
)