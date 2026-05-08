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

    ;; Action to stay in Riga on a day when Riga is required (workshop day)
    (action stay_in_riga_required_day
        :parameters (?d - day ?next_d - day)
        :precondition (and
            (current_city riga)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (day_processed ?d))
            (must_be_in_riga ?d)
        )
        :effect (and
            (day_processed ?d)
            (not (current_day ?d))
            (current_day ?next_d)
        )
    )

    ;; Action to stay in any city (including Riga) on a day when Riga is NOT required
    (action stay_in_any_city_optional_day
        :parameters (?c - city ?d - day ?next_d - day)
        :precondition (and
            (current_city ?c)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (day_processed ?d))
            (not (must_be_in_riga ?d))
        )
        :effect (and
            (day_processed ?d)
            (not (current_day ?d))
            (current_day ?next_d)
        )
    )

    ;; Action to travel from one city to another, consuming one day
    ;; Case 1: Neither depart nor arrive day requires Riga
    (action travel_any_to_any_no_riga_constraint
        :parameters (?from - city ?to - city ?d_depart - day ?d_arrive - day)
        :precondition (and
            (current_city ?from)
            (current_day ?d_depart)
            (next_day ?d_depart ?d_arrive)
            (connected ?from ?to)
            (not (= ?from ?to)) ; Must travel between different cities
            (not (day_processed ?d_depart))
            (not (must_be_in_riga ?d_depart))
            (not (must_be_in_riga ?d_arrive))
        )
        :effect (and
            (day_processed ?d_depart)
            (not (current_city ?from))
            (current_city ?to)
            (not (current_day ?d_depart))
            (current_day ?d_arrive)
        )
    )

    ;; Case 2: Depart day requires Riga, arrive day does not
    ;; Agent must depart from Riga
    (action travel_from_riga_to_any_riga_depart
        :parameters (?to - city ?d_depart - day ?d_arrive - day)
        :precondition (and
            (current_city riga)
            (current_day ?d_depart)
            (next_day ?d_depart ?d_arrive)
            (connected riga ?to)
            (not (= riga ?to)) ; Must travel to a different city
            (not (day_processed ?d_depart))
            (must_be_in_riga ?d_depart)
            (not (must_be_in_riga ?d_arrive))
        )
        :effect (and
            (day_processed ?d_depart)
            (not (current_city riga))
            (current_city ?to)
            (not (current_day ?d_depart))
            (current_day ?d_arrive)
        )
    )

    ;; Case 3: Depart day does not require Riga, arrive day requires Riga
    ;; Agent must arrive at Riga
    (action travel_from_any_to_riga_riga_arrive
        :parameters (?from - city ?d_depart - day ?d_arrive - day)
        :precondition (and
            (current_city ?from)
            (current_day ?d_depart)
            (next_day ?d_depart ?d_arrive)
            (connected ?from riga)
            (not (= ?from riga)) ; Must travel from a different city
            (not (day_processed ?d_depart))
            (not (must_be_in_riga ?d_depart))
            (must_be_in_riga ?d_arrive)
        )
        :effect (and
            (day_processed ?d_depart)
            (not (current_city ?from))
            (current_city riga)
            (not (current_day ?d_depart))
            (current_day ?d_arrive)
        )
    )
)