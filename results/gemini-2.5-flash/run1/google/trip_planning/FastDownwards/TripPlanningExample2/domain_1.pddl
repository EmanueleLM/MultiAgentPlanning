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
        (reykjavik_spent_1_day)
        (reykjavik_spent_2_days)

        ; Tracking days spent in Vienna
        (vienna_spent_0_days)
        (vienna_spent_1_day)
        (vienna_spent_2_days)
        (vienna_spent_3_days)
        (vienna_spent_4_days)
        (vienna_spent_5_days)
        (vienna_spent_6_days)
        (vienna_spent_7_days)

        ; Tracking days spent in Venice
        (venice_spent_0_days)
        (venice_spent_1_day)
        (venice_spent_2_days)
        (venice_spent_3_days)
        (venice_spent_4_days)

        ; Wedding constraint
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
        :precondition (and
            (at_city reykjavik)
            (current_day ?current)
            (next_day ?current ?next)
            (reykjavik_spent_0_days)
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (not (reykjavik_spent_0_days))
            (reykjavik_spent_1_day)
        )
    )
    (:action stay_in_reykjavik_from_1_to_2
        :parameters (?current - day ?next - day)
        :precondition (and
            (at_city reykjavik)
            (current_day ?current)
            (next_day ?current ?next)
            (reykjavik_spent_1_day)
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (not (reykjavik_spent_1_day))
            (reykjavik_spent_2_days)
        )
    )
    (:action stay_in_reykjavik_max_days
        :parameters (?current - day ?next - day)
        :precondition (and
            (at_city reykjavik)
            (current_day ?current)
            (next_day ?current ?next)
            (reykjavik_spent_2_days) ; Already met requirement
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
        )
    )

    ; Stay in Vienna
    ; (0->1) to (6->7)
    (:action stay_in_vienna_from_0_to_1
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_0_days))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (vienna_spent_0_days)) (vienna_spent_1_day)))
    (:action stay_in_vienna_from_1_to_2
        :parameters (?current - day ?next - day)
        :precondition (and (at_city vienna) (current_day ?current) (next_day ?current ?next) (vienna_spent_1_day))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (vienna_spent_1_day)) (vienna_spent_2_days)))
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

    ; Stay in Venice (normal days)
    ; These actions are for days NOT between day08 and day11.
    (:action stay_in_venice_from_0_to_1
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_0_days)
                            (not (current_day day08)) (not (current_day day09)) (not (current_day day10)) (not (current_day day11)))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (venice_spent_0_days)) (venice_spent_1_day)))
    (:action stay_in_venice_from_1_to_2
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_1_days)
                            (not (current_day day08)) (not (current_day day09)) (not (current_day day10)) (not (current_day day11)))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (venice_spent_1_days)) (venice_spent_2_days)))
    (:action stay_in_venice_from_2_to_3
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_2_days)
                            (not (current_day day08)) (not (current_day day09)) (not (current_day day10)) (not (current_day day11)))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (venice_spent_2_days)) (venice_spent_3_days)))
    (:action stay_in_venice_from_3_to_4
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_3_days)
                            (not (current_day day08)) (not (current_day day09)) (not (current_day day10)) (not (current_day day11)))
        :effect (and (not (current_day ?current)) (current_day ?next) (not (venice_spent_3_days)) (venice_spent_4_days)))
    (:action stay_in_venice_max_days
        :parameters (?current - day ?next - day)
        :precondition (and (at_city venice) (current_day ?current) (next_day ?current ?next) (venice_spent_4_days)
                            (not (current_day day08)) (not (current_day day09)) (not (current_day day10)) (not (current_day day11)))
        :effect (and (not (current_day ?current)) (current_day ?next)))

    ; Stay in Venice (wedding days - Day 8)
    ; These actions also set (wedding_attended) to true.
    (:action stay_in_venice_from_0_to_1_on_day08
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day08) (next_day day08 ?next) (venice_spent_0_days) (not (wedding_attended)))
        :effect (and (not (current_day day08)) (current_day ?next) (not (venice_spent_0_days)) (venice_spent_1_day) (wedding_attended)))
    (:action stay_in_venice_from_1_to_2_on_day08
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day08) (next_day day08 ?next) (venice_spent_1_days) (not (wedding_attended)))
        :effect (and (not (current_day day08)) (current_day ?next) (not (venice_spent_1_days)) (venice_spent_2_days) (wedding_attended)))
    (:action stay_in_venice_from_2_to_3_on_day08
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day08) (next_day day08 ?next) (venice_spent_2_days) (not (wedding_attended)))
        :effect (and (not (current_day day08)) (current_day ?next) (not (venice_spent_2_days)) (venice_spent_3_days) (wedding_attended)))
    (:action stay_in_venice_from_3_to_4_on_day08
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day08) (next_day day08 ?next) (venice_spent_3_days) (not (wedding_attended)))
        :effect (and (not (current_day day08)) (current_day ?next) (not (venice_spent_3_days)) (venice_spent_4_days) (wedding_attended)))
    (:action stay_in_venice_max_days_on_day08
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day08) (next_day day08 ?next) (venice_spent_4_days) (not (wedding_attended)))
        :effect (and (not (current_day day08)) (current_day ?next) (wedding_attended)))

    ; Stay in Venice (wedding days - Day 9)
    (:action stay_in_venice_from_0_to_1_on_day09
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day09) (next_day day09 ?next) (venice_spent_0_days) (not (wedding_attended)))
        :effect (and (not (current_day day09)) (current_day ?next) (not (venice_spent_0_days)) (venice_spent_1_day) (wedding_attended)))
    (:action stay_in_venice_from_1_to_2_on_day09
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day09) (next_day day09 ?next) (venice_spent_1_days) (not (wedding_attended)))
        :effect (and (not (current_day day09)) (current_day ?next) (not (venice_spent_1_days)) (venice_spent_2_days) (wedding_attended)))
    (:action stay_in_venice_from_2_to_3_on_day09
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day09) (next_day day09 ?next) (venice_spent_2_days) (not (wedding_attended)))
        :effect (and (not (current_day day09)) (current_day ?next) (not (venice_spent_2_days)) (venice_spent_3_days) (wedding_attended)))
    (:action stay_in_venice_from_3_to_4_on_day09
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day09) (next_day day09 ?next) (venice_spent_3_days) (not (wedding_attended)))
        :effect (and (not (current_day day09)) (current_day ?next) (not (venice_spent_3_days)) (venice_spent_4_days) (wedding_attended)))
    (:action stay_in_venice_max_days_on_day09
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day09) (next_day day09 ?next) (venice_spent_4_days) (not (wedding_attended)))
        :effect (and (not (current_day day09)) (current_day ?next) (wedding_attended)))

    ; Stay in Venice (wedding days - Day 10)
    (:action stay_in_venice_from_0_to_1_on_day10
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day10) (next_day day10 ?next) (venice_spent_0_days) (not (wedding_attended)))
        :effect (and (not (current_day day10)) (current_day ?next) (not (venice_spent_0_days)) (venice_spent_1_day) (wedding_attended)))
    (:action stay_in_venice_from_1_to_2_on_day10
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day10) (next_day day10 ?next) (venice_spent_1_days) (not (wedding_attended)))
        :effect (and (not (current_day day10)) (current_day ?next) (not (venice_spent_1_days)) (venice_spent_2_days) (wedding_attended)))
    (:action stay_in_venice_from_2_to_3_on_day10
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day10) (next_day day10 ?next) (venice_spent_2_days) (not (wedding_attended)))
        :effect (and (not (current_day day10)) (current_day ?next) (not (venice_spent_2_days)) (venice_spent_3_days) (wedding_attended)))
    (:action stay_in_venice_from_3_to_4_on_day10
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day10) (next_day day10 ?next) (venice_spent_3_days) (not (wedding_attended)))
        :effect (and (not (current_day day10)) (current_day ?next) (not (venice_spent_3_days)) (venice_spent_4_days) (wedding_attended)))
    (:action stay_in_venice_max_days_on_day10
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day10) (next_day day10 ?next) (venice_spent_4_days) (not (wedding_attended)))
        :effect (and (not (current_day day10)) (current_day ?next) (wedding_attended)))

    ; Stay in Venice (wedding days - Day 11)
    (:action stay_in_venice_from_0_to_1_on_day11
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day11) (next_day day11 ?next) (venice_spent_0_days) (not (wedding_attended)))
        :effect (and (not (current_day day11)) (current_day ?next) (not (venice_spent_0_days)) (venice_spent_1_day) (wedding_attended)))
    (:action stay_in_venice_from_1_to_2_on_day11
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day11) (next_day day11 ?next) (venice_spent_1_days) (not (wedding_attended)))
        :effect (and (not (current_day day11)) (current_day ?next) (not (venice_spent_1_days)) (venice_spent_2_days) (wedding_attended)))
    (:action stay_in_venice_from_2_to_3_on_day11
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day11) (next_day day11 ?next) (venice_spent_2_days) (not (wedding_attended)))
        :effect (and (not (current_day day11)) (current_day ?next) (not (venice_spent_2_days)) (venice_spent_3_days) (wedding_attended)))
    (:action stay_in_venice_from_3_to_4_on_day11
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day11) (next_day day11 ?next) (venice_spent_3_days) (not (wedding_attended)))
        :effect (and (not (current_day day11)) (current_day ?next) (not (venice_spent_3_days)) (venice_spent_4_days) (wedding_attended)))
    (:action stay_in_venice_max_days_on_day11
        :parameters (?next - day)
        :precondition (and (at_city venice) (current_day day11) (next_day day11 ?next) (venice_spent_4_days) (not (wedding_attended)))
        :effect (and (not (current_day day11)) (current_day ?next) (wedding_attended)))
)