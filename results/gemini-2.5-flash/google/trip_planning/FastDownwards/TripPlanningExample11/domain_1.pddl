(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (at ?c - city)
        (direct_flight ?c1 ?c2 - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (conference_on_day_at ?d - day ?c - city)
        (conference_attended ?d - day ?c - city)
    )

    ; Action to stay in the current city on a non-conference day
    (:action stay_day
        :parameters (?c - city ?d - day ?next_d - day)
        :precondition (and
            (at ?c)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (conference_on_day_at ?d ?c)) ; Cannot use this action if there's a conference on this day in this city
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
        )
    )

    ; Action to attend a conference in the current city on a conference day
    (:action attend_conference_stay
        :parameters (?c - city ?d - day ?next_d - day)
        :precondition (and
            (at ?c)
            (current_day ?d)
            (next_day ?d ?next_d)
            (conference_on_day_at ?d ?c) ; Must be a conference day in the current city
            (not (conference_attended ?d ?c)) ; Ensure conference is attended only once
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (conference_attended ?d ?c)
        )
    )

    ; Action to travel between cities. Travel takes one day.
    ; The trip starts on day D and ends in city ?to on day Next_D.
    ; Cannot travel if there's a mandatory conference in the current city on day D.
    (:action travel_to
        :parameters (?from ?to - city ?d - day ?next_d - day)
        :precondition (and
            (at ?from)
            (current_day ?d)
            (next_day ?d ?next_d)
            (direct_flight ?from ?to)
            (not (= ?from ?to))
            (not (conference_on_day_at ?d ?from)) ; Cannot travel away if a conference is scheduled in ?from on ?d
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current_day ?d))
            (current_day ?next_d)
        )
    )
)