(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day)
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (is_flight ?c1 - city ?c2 - city)

        (venice_days_spent_0)
        (venice_days_spent_1)
        (venice_days_spent_2)

        (geneva_days_spent_0)
        (geneva_days_spent_1)
        (geneva_days_spent_2)

        (madrid_days_spent_0)
        (madrid_days_spent_1)
        (madrid_days_spent_2)
        (madrid_days_spent_3)

        (conference_day4_attended)
        (conference_day5_attended)
        (is_day4 ?d - day) ; New predicate for day-specific actions
        (is_day5 ?d - day) ; New predicate for day-specific actions
    )

    (:action fly
        :parameters (?from - city ?to - city ?d_curr - day ?d_next - day)
        :precondition (and (at ?from) (is_flight ?from ?to) (current_day ?d_curr) (next_day ?d_curr ?d_next))
        :effect (and (not (at ?from)) (at ?to) (not (current_day ?d_curr)) (current_day ?d_next))
    )

    ; --- Actions for staying in Venice and advancing the day (non-conference days) ---
    (:action stay_in_venice_day_0_to_1
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (next_day ?d_curr ?d_next) (venice_days_spent_0) (not (is_day4 ?d_curr)) (not (is_day5 ?d_curr)))
        :effect (and (not (venice_days_spent_0)) (venice_days_spent_1) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_venice_day_1_to_2
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (next_day ?d_curr ?d_next) (venice_days_spent_1) (not (is_day4 ?d_curr)) (not (is_day5 ?d_curr)))
        :effect (and (not (venice_days_spent_1)) (venice_days_spent_2) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_venice_after_2_days
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (next_day ?d_curr ?d_next) (venice_days_spent_2) (not (is_day4 ?d_curr)) (not (is_day5 ?d_curr)))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next))
    )

    ; --- Conference specific actions in Venice on Day 4 ---
    (:action stay_in_venice_day_0_to_1_on_day4_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day4 ?d_curr) (next_day ?d_curr ?d_next) (venice_days_spent_0) (not (conference_day4_attended)))
        :effect (and (not (venice_days_spent_0)) (venice_days_spent_1) (not (current_day ?d_curr)) (current_day ?d_next) (conference_day4_attended))
    )
    (:action stay_in_venice_day_1_to_2_on_day4_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day4 ?d_curr) (next_day ?d_curr ?d_next) (venice_days_spent_1) (not (conference_day4_attended)))
        :effect (and (not (venice_days_spent_1)) (venice_days_spent_2) (not (current_day ?d_curr)) (current_day ?d_next) (conference_day4_attended))
    )
    (:action stay_in_venice_after_2_days_on_day4_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day4 ?d_curr) (next_day ?d_curr ?d_next) (venice_days_spent_2) (not (conference_day4_attended)))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next) (conference_day4_attended))
    )

    ; --- Conference specific actions in Venice on Day 5 ---
    (:action stay_in_venice_day_0_to_1_on_day5_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day5 ?d_curr) (next_day ?d_curr ?d_next) (venice_days_spent_0) (not (conference_day5_attended)))
        :effect (and (not (venice_days_spent_0)) (venice_days_spent_1) (not (current_day ?d_curr)) (current_day ?d_next) (conference_day5_attended))
    )
    (:action stay_in_venice_day_1_to_2_on_day5_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day5 ?d_curr) (next_day ?d_curr ?d_next) (venice_days_spent_1) (not (conference_day5_attended)))
        :effect (and (not (venice_days_spent_1)) (venice_days_spent_2) (not (current_day ?d_curr)) (current_day ?d_next) (conference_day5_attended))
    )
    (:action stay_in_venice_after_2_days_on_day5_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day5 ?d_curr) (next_day ?d_curr ?d_next) (venice_days_spent_2) (not (conference_day5_attended)))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next) (conference_day5_attended))
    )

    ; --- Actions for staying in Geneva and advancing the day ---
    (:action stay_in_geneva_day_0_to_1
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at geneva) (current_day ?d_curr) (next_day ?d_curr ?d_next) (geneva_days_spent_0))
        :effect (and (not (geneva_days_spent_0)) (geneva_days_spent_1) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_geneva_day_1_to_2
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at geneva) (current_day ?d_curr) (next_day ?d_curr ?d_next) (geneva_days_spent_1))
        :effect (and (not (geneva_days_spent_1)) (geneva_days_spent_2) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_geneva_after_2_days
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at geneva) (current_day ?d_curr) (next_day ?d_curr ?d_next) (geneva_days_spent_2))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next))
    )

    ; --- Actions for staying in Madrid and advancing the day ---
    (:action stay_in_madrid_day_0_to_1
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at madrid) (current_day ?d_curr) (next_day ?d_curr ?d_next) (madrid_days_spent_0))
        :effect (and (not (madrid_days_spent_0)) (madrid_days_spent_1) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_madrid_day_1_to_2
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at madrid) (current_day ?d_curr) (next_day ?d_curr ?d_next) (madrid_days_spent_1))
        :effect (and (not (madrid_days_spent_1)) (madrid_days_spent_2) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_madrid_day_2_to_3
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at madrid) (current_day ?d_curr) (next_day ?d_curr ?d_next) (madrid_days_spent_2))
        :effect (and (not (madrid_days_spent_2)) (madrid_days_spent_3) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_madrid_after_3_days
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at madrid) (current_day ?d_curr) (next_day ?d_curr ?d_next) (madrid_days_spent_3))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next))
    )
)