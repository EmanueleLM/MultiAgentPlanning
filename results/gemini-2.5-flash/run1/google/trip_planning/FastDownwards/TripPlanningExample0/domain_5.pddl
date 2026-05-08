(define (domain trip_planning_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        traveler
    )
    (:predicates
        (at ?agent - traveler ?c - city)        ; Agent's current location (changes with actions)
        (current_day ?d - day)                  ; The day currently being planned for/concluded
        (next_day ?d1 - day ?d2 - day)          ; Defines the sequence of days
        (direct_flight ?c1 - city ?c2 - city)
        (has_visited ?c - city)                 ; Tracks if a city has been visited (i.e., entered/stayed at least once)
        (meeting_done)                          ; Meeting in Florence is accomplished
        (is_meeting_possible_day ?d - day)      ; Days when a meeting is possible in Florence
        (is_florence ?c - city)                 ; Predicate to identify Florence
        (day_spent_in_city ?c - city ?d - day)  ; Marks day 'd' as a day spent staying in city 'c'
        (day_spent_traveling ?d - day)          ; Marks day 'd' as a day spent traveling
        (scheduled_day ?d - day)                ; Marks that some activity (stay or travel) has been planned for day 'd'
    )

    (:action stay_in_city
        :parameters (?agent - traveler ?c - city ?current_d - day ?next_d - day)
        :precondition (and
            (current_day ?current_d)
            (at ?agent ?c)
            (next_day ?current_d ?next_d)
            (not (scheduled_day ?current_d)) ; Ensure each day is scheduled exactly once
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (has_visited ?c)
            (day_spent_in_city ?c ?current_d)
            (scheduled_day ?current_d)
        )
    )

    (:action stay_in_florence_and_meet
        :parameters (?agent - traveler ?c - city ?current_d - day ?next_d - day)
        :precondition (and
            (current_day ?current_d)
            (at ?agent ?c)
            (is_florence ?c)
            (next_day ?current_d ?next_d)
            (is_meeting_possible_day ?current_d)
            (not (meeting_done))
            (not (scheduled_day ?current_d))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (has_visited ?c)
            (meeting_done)
            (day_spent_in_city ?c ?current_d)
            (scheduled_day ?current_d)
        )
    )

    (:action travel_to_city
        :parameters (?agent - traveler ?from_c - city ?to_c - city ?current_d - day ?next_d - day)
        :precondition (and
            (current_day ?current_d)
            (at ?agent ?from_c)
            (direct_flight ?from_c ?to_c)
            (next_day ?current_d ?next_d)
            (not (scheduled_day ?current_d))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (at ?agent ?from_c))
            (at ?agent ?to_c)
            (has_visited ?to_c) ; Mark destination city as visited upon arrival
            (day_spent_traveling ?current_d)
            (scheduled_day ?current_d)
        )
    )
    
    (:action end_trip_on_day_14
        :parameters (?agent - traveler ?c - city)
        :precondition (and
            (current_day day14)             ; Planning has advanced to Day 14
            (at ?agent ?c)                  ; Agent is in some city at Day 14
            (not (scheduled_day day14))     ; Day 14 has not yet been marked as scheduled
        )
        :effect (and
            (scheduled_day day14)
            (day_spent_in_city ?c day14)    ; Day 14 is spent staying in the agent's current city
        )
    )