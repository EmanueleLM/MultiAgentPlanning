(define (domain trip_planning_example23)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (current_city ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (must_be_in_riga ?d - day) ; Predicate to mark days 5-8 for Riga workshop
        (day_processed ?d - day) ; Indicates that actions for day ?d have been completed
    )

    ;; Action to stay in the current city for the day
    ;; This action advances the day and processes the current day's activities
    (action move_to_next_day_stay
        :parameters (?c - city ?d - day ?next_d - day)
        :precondition (and
            (current_city ?c)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (day_processed ?d))
            ;; If it's a Riga workshop day, the agent must be in Riga
            (or (not (must_be_in_riga ?d)) (= ?c riga))
        )
        :effect (and
            (day_processed ?d)
            (not (current_day ?d))
            (current_day ?next_d)
        )
    )

    ;; Action to travel from one city to another, consuming one day
    ;; Agent departs on d_depart and arrives in ?to on d_arrive, processing d_depart
    (action move_to_next_day_travel
        :parameters (?from - city ?to - city ?d_depart - day ?d_arrive - day)
        :precondition (and
            (current_city ?from)
            (current_day ?d_depart)
            (next_day ?d_depart ?d_arrive)
            (connected ?from ?to)
            (not (= ?from ?to)) ; Must travel between different cities
            (not (day_processed ?d_depart))
            ;; If depart day is a Riga workshop day, agent must depart from Riga
            (or (not (must_be_in_riga ?d_depart)) (= ?from riga))
            ;; If arrive day is a Riga workshop day, agent must arrive at Riga
            (or (not (must_be_in_riga ?d_arrive)) (= ?to riga))
        )
        :effect (and
            (day_processed ?d_depart)
            (not (current_city ?from))
            (current_city ?to)
            (not (current_day ?d_depart))
            (current_day ?d_arrive)
        )
    )
)