(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (connected ?c1 - city ?c2 - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (is_meeting_day ?d - day) ; Indicates if a day falls within the friend meeting window Day 6-11
        (friend_met)
    )

    (:action move
        :parameters (?from - city ?to - city ?d_curr - day ?d_next - day)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
            (not (current_day ?d_curr))
            (current_day ?d_next)
        )
    )

    (:action rest
        :parameters (?c - city ?d_curr - day ?d_next - day)
        :precondition (and
            (at ?c)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
        )
    )

    (:action meet_friend
        :parameters (?d_curr - day)
        :precondition (and
            (at bucharest) ; Meeting must happen in Bucharest
            (current_day ?d_curr)
            (is_meeting_day ?d_curr) ; Meeting must be on a designated meeting day
            (not (friend_met)) ; Can only meet friends once
        )
        :effect (and
            (friend_met)
        )
    )
)