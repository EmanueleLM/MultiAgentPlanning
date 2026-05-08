(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (has_flight ?from ?to - city)
        (visited ?c - city)
        (stayed_on_day ?c - city ?d - day)
        (met_friend)
    )

    ;; Action to stay in the current city for one day
    ;; This action advances the current day to the next day
    (:action stay_in_city
        :parameters (?c - city ?d ?next_d - day)
        :precondition (and
            (at ?c)
            (current_day ?d)
            (next_day ?d ?next_d)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (visited ?c)
            (stayed_on_day ?c ?d)
        )
    )

    ;; Action to fly between two cities
    ;; This action happens instantaneously and does not advance the day
    (:action fly_to_city
        :parameters (?from ?to - city)
        :precondition (and
            (at ?from)
            (has_flight ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
        )
    )

    ;; Action to meet a friend in Bucharest on Day 5
    ;; This action happens instantaneously and does not advance the day
    (:action meet_friend_on_day5
        :parameters ()
        :precondition (and
            (at bucharest) ; Fixed case to lowercase 'bucharest'
            (current_day d5)
            (not (met_friend)) ; Ensure friend is met only once
        )
        :effect (met_friend)
    )

    ;; Action to meet a friend in Bucharest on Day 6
    ;; This action happens instantaneously and does not advance the day
    (:action meet_friend_on_day6
        :parameters ()
        :precondition (and
            (at bucharest) ; Fixed case to lowercase 'bucharest'
            (current_day d6)
            (not (met_friend)) ; Ensure friend is met only once
        )
        :effect (met_friend)
    )