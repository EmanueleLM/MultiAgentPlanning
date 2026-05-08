(define (domain trip_planning_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        traveler
    )
    (:predicates
        (at ?agent - traveler ?c - city ?d - day)
        (current_planning_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (direct_flight ?c1 - city ?c2 - city)
        (has_visited ?c - city)
        (is_meeting_day ?d - day)
        (meeting_done)
    )

    (:action stay_in_city
        :parameters (?agent - traveler ?current_city - city ?current_d - day ?next_d - day)
        :precondition (and
            (current_planning_day ?current_d)
            (at ?agent ?current_city ?current_d)
            (next_day ?current_d ?next_d)
        )
        :effect (and
            (not (current_planning_day ?current_d))
            (current_planning_day ?next_d)
            (at ?agent ?current_city ?next_d)
            (has_visited ?current_city)
        )
    )

    (:action stay_in_florence_and_meet
        :parameters (?agent - traveler ?current_d - day ?next_d - day)
        :precondition (and
            (current_planning_day ?current_d)
            (at ?agent florence ?current_d)
            (next_day ?current_d ?next_d)
            (is_meeting_day ?current_d)
            (not (meeting_done))
        )
        :effect (and
            (not (current_planning_day ?current_d))
            (current_planning_day ?next_d)
            (at ?agent florence ?next_d)
            (has_visited florence)
            (meeting_done)
        )
    )

    (:action travel_to_city
        :parameters (?agent - traveler ?from_city - city ?to_city - city ?current_d - day ?next_d - day)
        :precondition (and
            (current_planning_day ?current_d)
            (at ?agent ?from_city ?current_d)
            (direct_flight ?from_city ?to_city)
            (next_day ?current_d ?next_d)
        )
        :effect (and
            (not (current_planning_day ?current_d))
            (current_planning_day ?next_d)
            (not (at ?agent ?from_city ?current_d)) ; This is redundant as 'at' is effectively for start of day
            (at ?agent ?to_city ?next_d)
            (has_visited ?to_city)
        )
    )
)