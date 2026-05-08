(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (at_city ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (has_flight ?c1 - city ?c2 - city)

        ; Tracking days spent in Reykjavik
        (reykjavik_spent_0_days)
        (reykjavik_spent_1_days)
        (reykjavik_spent_2_days)

        ; Tracking days spent in Vienna
        (vienna_spent_0_days)
        (vienna_spent_1_days)
        (vienna_spent_2_days)
        (vienna_spent_3_days)
        (vienna_spent_4_days)
        (vienna_spent_5_days)
        (vienna_spent_6_days)
        (vienna_spent_7_days)

        ; Tracking days spent in Venice
        (venice_spent_0_days)
        (venice_spent_1_days)
        (venice_spent_2_days)
        (venice_spent_3_days)
        (venice_spent_4_days)

        ; Wedding constraint
        (wedding_day ?d - day) ; New predicate to mark wedding days
        (wedding_attended)
    )

    ;; Actions

    ; Travel between cities
    (:action travel
        :parameters (?from - city ?to - city ?current - day ?next - day)
        :precondition (and
            (at_city ?from)
            (has_flight ?from ?to)
            (current_day ?current)
            (next_day ?current ?next)
        )
        :effect (and
            (not (at_city ?from))
            (at_city ?to)
            (not (current_day ?current))
            (current_day ?next)
        )
    )

    ; Stay in Reykjavik
    (:action stay_in_reykjavik_from_0_to_1
        :parameters (?current - day ?next - day)
        :precondition (and (at_city reykjavik) (current_day ?current) (next_day ?current ?next) (reykjavik_spent_0_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (reykjavik_spent_0_days)) (reykjavik_spent_1_days)))
    (:action stay_in_reykjavik_from_1_to_2
        :parameters (?current - day ?next - day)
        :precondition (and (at_city reykjavik) (current_day ?current) (next_day ?current ?next) (reykjavik_spent_1_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (reykjavik_spent_1_days)) (reykjavik_spent_2_days)))
    (:action stay_in_reykjavik_max_days
        :parameters (?current - day ?next - day)
        :precondition (and (at_city reykjavik) (current_day ?current) (next_day ?current ?next) (reykjavik_spent_2_days))
        :effect (and (not (current_day ?current)) (current_day ?next)))

    ; Stay in Vienna
    (:action stay_in_vienna_from_0_to_1
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_0_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (vienna_spent_0_days)) (vienna_spent_1_days)))
    (:action stay_in_vienna_from_1_to_2
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_1_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (vienna_spent_1_days)) (vienna_spent_2_days)))
    (:action stay_in_vienna_from_2_to_3
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_2_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (vienna_spent_2_days)) (vienna_spent_3_days)))
    (:action stay_in_vienna_from_3_to_4
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_3_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (vienna_spent_3_days)) (vienna_spent_4_days)))
    (:action stay_in_vienna_from_4_to_5
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_4_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (vienna_spent_4_days)) (vienna_spent_5_days)))
    (:action stay_in_vienna_from_5_to_6
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_5_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (vienna_spent_5_days)) (vienna_spent_6_days)))
    (:action stay_in_vienna_from_6_to_7
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_6_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (vienna_spent_6_days)) (vienna_spent_7_days)))
    (:action stay_in_vienna_max_days
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_7_days))
        :effect (and (not (current_day ?current)) (current_day ?next)))

    ; Stay in Venice
    (:action stay_in_venice_from_0_to_1
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_0_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (venice_spent_0_days)) (venice_spent_1_days)))
    (:action stay_in_venice_from_1_to_2
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_1_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (venice_spent_1_days)) (venice_spent_2_days)))
    (:action stay_in_venice_from_2_to_3
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_2_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (venice_spent_2_days)) (venice_spent_3_days)))
    (:action stay_in_venice_from_3_to_4
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_3_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (venice_spent_3_days)) (venice_spent_4_days)))
    (:action stay_in_venice_max_days
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_4_days))
        :effect (and (not (current_day ?current)) (current_day ?next)))

    ; Action to attend the wedding, can be performed once on any wedding day while in Venice.
    ; This action does not advance time or increment stay counts.
    (:action attend_venice_wedding
        :parameters (?d - day)
        :precondition (and
            (at_city venice)
            (current_day ?d)
            (wedding_day ?d)
            (not (wedding_attended)) ; Can only attend if not already attended
        )
        :effect (wedding_attended)
    )
)