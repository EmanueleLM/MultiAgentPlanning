(define (domain trip_planning_example6)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        day - object
        city - object
        traveler - object
    )
    (:predicates
        (current_day ?d - day)                   ; The day being planned for (at its start)
        (next_day ?d1 - day ?d2 - day)           ; Temporal ordering of days
        (at_city ?t - traveler ?c - city)        ; Traveler's location at the start of current_day
        (is_connected ?c1 - city ?c2 - city)     ; Direct flight connection (bidirectional)
        (conference_required ?d - day ?c - city) ; Mandatory city for a specific day
        (spent_day_in ?d - day ?c - city)        ; Records where the day was spent
    )

    ;; Action to spend the current day in the current city, then transition to the next day.
    ;; The traveler remains in the same city for the next day.
    (:action spend_day_and_stay
        :parameters (?t - traveler ?c - city ?current - day ?next - day)
        :precondition (and
            (current_day ?current)
            (at_city ?t ?c)
            (next_day ?current ?next)
            ;; Ensure conference constraint is met:
            ;; If a conference is required on ?current day in 'berlin',
            ;; this action is only valid if ?c is 'berlin'.
            ;; This is expressed by forbidding the action if conference is in berlin
            ;; but the current city ?c is NOT berlin.
            (not (and (conference_required ?current berlin) (not (= ?c berlin))))
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (spent_day_in ?current ?c)
        )
    )

    ;; Action to spend the current day in 'from_c', then fly to 'to_c' for the next day.
    (:action spend_day_and_fly
        :parameters (?t - traveler ?from_c - city ?to_c - city ?current - day ?next - day)
        :precondition (and
            (current_day ?current)
            (at_city ?t ?from_c)
            (is_connected ?from_c ?to_c)
            (next_day ?current ?next)
            ;; Ensure conference constraint is met for 'current' day:
            ;; The current day ?current is spent in ?from_c. So, if a conference
            ;; is required in 'berlin', ?from_c must be 'berlin'.
            (not (and (conference_required ?current berlin) (not (= ?from_c berlin))))
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (not (at_city ?t ?from_c))
            (at_city ?t ?to_c)
            (spent_day_in ?current ?from_c)
        )
    )

    ;; Action to finish the trip after day 8. This action consumes day8.
    (:action end_trip
        :parameters (?t - traveler ?c - city ?day8 - day)
        :precondition (and
            (current_day ?day8)
            (at_city ?t ?c)
            ;; Ensure conference constraint is met for day 8 if applicable
            (not (and (conference_required ?day8 berlin) (not (= ?c berlin))))
        )
        :effect (and
            (not (current_day ?day8)) ; No 'next_day' for day 8, so current_day becomes false.
            (spent_day_in ?day8 ?c)
        )
    )
)