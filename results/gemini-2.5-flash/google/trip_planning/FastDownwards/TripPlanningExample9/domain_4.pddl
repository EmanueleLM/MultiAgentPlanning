(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        traveler - object
        city - object
        day - object
    )

    (:predicates
        (at ?t - traveler ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (visited ?c - city) ; Marks that at least one day was spent in this city
        (is_workshop_day ?d - day) ; Marks days when the workshop is held
        (attended_workshop) ; True if the workshop has been attended
    )

    (:functions
        (total-stay-days) - number
    )

    (:action fly
        :parameters (?t - traveler ?from - city ?to - city ?d_current - day ?d_next - day)
        :precondition
            (and
                (current_day ?d_current)
                (at ?t ?from)
                (connected ?from ?to)
                (next_day ?d_current ?d_next)
            )
        :effect
            (and
                (not (at ?t ?from))
                (at ?t ?to)
                (not (current_day ?d_current))
                (current_day ?d_next)
            )
    )

    ;; Action to stay in Frankfurt
    (:action stay_in_frankfurt
        :parameters (?t - traveler ?d_current - day ?d_next - day)
        :precondition
            (and
                (current_day ?d_current)
                (at ?t frankfurt)
                (next_day ?d_current ?d_next)
            )
        :effect
            (and
                (not (current_day ?d_current))
                (current_day ?d_next)
                (visited frankfurt)
                (increase (total-stay-days) 1)
            )
    )

    ;; Action to stay in Bucharest
    (:action stay_in_bucharest
        :parameters (?t - traveler ?d_current - day ?d_next - day)
        :precondition
            (and
                (current_day ?d_current)
                (at ?t bucharest)
                (next_day ?d_current ?d_next)
            )
        :effect
            (and
                (not (current_day ?d_current))
                (current_day ?d_next)
                (visited bucharest)
                (increase (total-stay-days) 1)
            )
    )

    ;; Action to stay in Stuttgart and attend the workshop
    ;; This action is only possible if it's a workshop day and the workshop hasn't been attended yet.
    (:action stay_in_stuttgart_and_attend_workshop
        :parameters (?t - traveler ?d_current - day ?d_next - day)
        :precondition
            (and
                (current_day ?d_current)
                (at ?t stuttgart)
                (next_day ?d_current ?d_next)
                (is_workshop_day ?d_current)
                (not (attended_workshop))
            )
        :effect
            (and
                (not (current_day ?d_current))
                (current_day ?d_next)
                (visited stuttgart)
                (attended_workshop)
                (increase (total-stay-days) 1)
            )
    )

    ;; Action to stay in Stuttgart on a day that is NOT a workshop day, and workshop not yet attended
    (:action stay_in_stuttgart_pre_workshop_non_workshop_day
        :parameters (?t - traveler ?d_current - day ?d_next - day)
        :precondition
            (and
                (current_day ?d_current)
                (at ?t stuttgart)
                (next_day ?d_current ?d_next)
                (not (is_workshop_day ?d_current))
                (not (attended_workshop)) ; workshop not attended yet and no opportunity today
            )
        :effect
            (and
                (not (current_day ?d_current))
                (current_day ?d_next)
                (visited stuttgart)
                (increase (total-stay-days) 1)
            )
    )

    ;; Action to stay in Stuttgart after the workshop has already been completed (or if it's a workshop day but already attended)
    (:action stay_in_stuttgart_after_workshop_completed
        :parameters (?t - traveler ?d_current - day ?d_next - day)
        :precondition
            (and
                (current_day ?d_current)
                (at ?t stuttgart)
                (next_day ?d_current ?d_next)
                (attended_workshop) ; workshop already attended
            )
        :effect
            (and
                (not (current_day ?d_current))
                (current_day ?d_next)
                (visited stuttgart)
                (increase (total-stay-days) 1)
            )
    )
)