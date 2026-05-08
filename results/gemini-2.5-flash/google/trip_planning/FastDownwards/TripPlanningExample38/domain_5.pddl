(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day)
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (is_flight ?c1 - city ?c2 - city)

        (days_in_venice_is_0)
        (days_in_venice_is_1)
        (days_in_venice_is_2)

        (days_in_geneva_is_0)
        (days_in_geneva_is_1)
        (days_in_geneva_is_2)

        (days_in_madrid_is_0)
        (days_in_madrid_is_1)
        (days_in_madrid_is_2)
        (days_in_madrid_is_3)

        (conference_day4_attended)
        (conference_day5_attended)
        (is_day4 ?d - day)
        (is_day5 ?d - day)
    )

    (:action fly
        :parameters (?from - city ?to - city ?d_curr - day ?d_next - day)
        :precondition (and (at ?from) (is_flight ?from ?to) (current_day ?d_curr) (next_day ?d_curr ?d_next))
        :effect (and (not (at ?from)) (at ?to) (not (current_day ?d_curr)) (current_day ?d_next))
    )

    ; --- Actions for staying in Venice and advancing the day (non-conference days) ---
    (:action stay_in_venice_to_1
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_venice_is_0) (not (is_day4 ?d_curr)) (not (is_day5 ?d_curr)))
        :effect (and (not (days_in_venice_is_0)) (days_in_venice_is_1) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_venice_to_2
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_venice_is_1) (not (is_day4 ?d_curr)) (not (is_day5 ?d_curr)))
        :effect (and (not (days_in_venice_is_1)) (days_in_venice_is_2) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_venice_pass_day
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_venice_is_2) (not (is_day4 ?d_curr)) (not (is_day5 ?d_curr)))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next))
    )

    ; --- Conference specific actions in Venice on Day 4 ---
    (:action stay_in_venice_to_1_on_day4_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day4 ?d_curr) (next_day ?d_curr ?d_next) (days_in_venice_is_0) (not (conference_day4_attended)))
        :effect (and (not (days_in_venice_is_0)) (days_in_venice_is_1) (not (current_day ?d_curr)) (current_day ?d_next) (conference_day4_attended))
    )
    (:action stay_in_venice_to_2_on_day4_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day4 ?d_curr) (next_day ?d_curr ?d_next) (days_in_venice_is_1) (not (conference_day4_attended)))
        :effect (and (not (days_in_venice_is_1)) (days_in_venice_is_2) (not (current_day ?d_curr)) (current_day ?d_next) (conference_day4_attended))
    )
    (:action stay_in_venice_pass_day_on_day4_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day4 ?d_curr) (next_day ?d_curr ?d_next) (days_in_venice_is_2) (not (conference_day4_attended)))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next) (conference_day4_attended))
    )

    ; --- Conference specific actions in Venice on Day 5 ---
    (:action stay_in_venice_to_1_on_day5_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day5 ?d_curr) (next_day ?d_curr ?d_next) (days_in_venice_is_0) (not (conference_day5_attended)))
        :effect (and (not (days_in_venice_is_0)) (days_in_venice_is_1) (not (current_day ?d_curr)) (current_day ?d_next) (conference_day5_attended))
    )
    (:action stay_in_venice_to_2_on_day5_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day5 ?d_curr) (next_day ?d_curr ?d_next) (days_in_venice_is_1) (not (conference_day5_attended)))
        :effect (and (not (days_in_venice_is_1)) (days_in_venice_is_2) (not (current_day ?d_curr)) (current_day ?d_next) (conference_day5_attended))
    )
    (:action stay_in_venice_pass_day_on_day5_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at venice) (current_day ?d_curr) (is_day5 ?d_curr) (next_day ?d_curr ?d_next) (days_in_venice_is_2) (not (conference_day5_attended)))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next) (conference_day5_attended))
    )

    ; --- Actions for staying in Geneva and advancing the day ---
    (:action stay_in_geneva_to_1
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at geneva) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_geneva_is_0))
        :effect (and (not (days_in_geneva_is_0)) (days_in_geneva_is_1) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_geneva_to_2
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at geneva) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_geneva_is_1))
        :effect (and (not (days_in_geneva_is_1)) (days_in_geneva_is_2) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_geneva_pass_day
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at geneva) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_geneva_is_2))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next))
    )

    ; --- Actions for staying in Madrid and advancing the day ---
    (:action stay_in_madrid_to_1
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at madrid) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_madrid_is_0))
        :effect (and (not (days_in_madrid_is_0)) (days_in_madrid_is_1) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_madrid_to_2
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at madrid) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_madrid_is_1))
        :effect (and (not (days_in_madrid_is_1)) (days_in_madrid_is_2) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_madrid_to_3
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at madrid) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_madrid_is_2))
        :effect (and (not (days_in_madrid_is_2)) (days_in_madrid_is_3) (not (current_day ?d_curr)) (current_day ?d_next))
    )
    (:action stay_in_madrid_pass_day
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at madrid) (current_day ?d_curr) (next_day ?d_curr ?d_next) (days_in_madrid_is_3))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next))
    )
)