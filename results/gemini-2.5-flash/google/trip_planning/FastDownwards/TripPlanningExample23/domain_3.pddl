(define (domain trip_planning_example23)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (current_city ?c - city) ; The city where the agent is at the beginning of the current day
        (current_day ?d - day)   ; The day currently being processed
        (next_day ?d1 - day ?d2 - day) ; Defines the sequence of days
        (connected ?c1 - city ?c2 - city) ; Indicates a direct flight connection between two cities
        (must_be_in_riga ?d - day) ; True if the agent MUST be in Riga on day ?d (for the workshop)
        (day_processed ?d - day) ; Indicates that actions for day ?d have been completed
        (visited ?c - city ?d - day) ; Records that the agent spent day ?d staying in city ?c
        (is_travel_day ?d - day) ; Records that day ?d was spent traveling
    )

    ;; Action to stay in a city for a full day
    ;; The agent remains in the current city for the entire day ?d, and is then ready to start ?next_d.
    ;; If day ?d is a "must_be_in_riga" day, the agent can only stay in Riga.
    (action stay
        :parameters (?c - city ?d - day ?next_d - day)
        :precondition (and
            (current_city ?c)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (day_processed ?d))
            ;; Constraint: If Riga is required for day ?d, the agent must be in Riga
            (or (not (must_be_in_riga ?d)) (and (must_be_in_riga ?d) (= ?c riga)))
        )
        :effect (and
            (day_processed ?d)
            (not (current_day ?d))
            (current_day ?next_d)
            (visited ?c ?d)
        )
    )

    ;; Action to travel from one city to another, consuming one full day
    ;; The agent departs from ?from on ?d_depart and arrives in ?to at the start of ?d_arrive.
    ;; Travel cannot occur on a day where the agent is required to be in Riga.
    (action travel
        :parameters (?from - city ?to - city ?d_depart - day ?d_arrive - day)
        :precondition (and
            (current_city ?from)
            (current_day ?d_depart)
            (next_day ?d_depart ?d_arrive)
            (connected ?from ?to)
            (not (= ?from ?to)) ; Must travel between different cities
            (not (day_processed ?d_depart))
            ;; Constraint: Travel cannot happen on a day when Riga is required
            (not (must_be_in_riga ?d_depart))
        )
        :effect (and
            (day_processed ?d_depart)
            (not (current_city ?from))
            (current_city ?to) ; Agent arrives in 'to' at the start of 'd_arrive'
            (not (current_day ?d_depart))
            (current_day ?d_arrive)
            (is_travel_day ?d_depart)
        )
    )
)