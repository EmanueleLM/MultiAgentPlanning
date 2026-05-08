(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        stay_count_num
    )

    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (direct_flight ?c1 - city ?c2 - city)
        (stayed_on_day ?c - city ?d - day)
        (valencia_stays ?s - stay_count_num)
        (lyon_stays ?s - stay_count_num)
        (split_stays ?s - stay_count_num)
        (next_stay_count ?s1 - stay_count_num ?s2 - stay_count_num)
    )

    (:action fly
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (direct_flight ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
        )
    )

    (:action spend_day_at_valencia
        :parameters (?d - day ?next_d - day ?prev_s - stay_count_num ?next_s - stay_count_num)
        :precondition (and
            (at city_valencia)
            (current_day ?d)
            (next_day ?d ?next_d)
            (valencia_stays ?prev_s)
            (next_stay_count ?prev_s ?next_s)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (stayed_on_day city_valencia ?d)
            (not (valencia_stays ?prev_s))
            (valencia_stays ?next_s)
        )
    )

    (:action spend_day_at_lyon
        :parameters (?d - day ?next_d - day ?prev_s - stay_count_num ?next_s - stay_count_num)
        :precondition (and
            (at city_lyon)
            (current_day ?d)
            (next_day ?d ?next_d)
            (lyon_stays ?prev_s)
            (next_stay_count ?prev_s ?next_s)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (stayed_on_day city_lyon ?d)
            (not (lyon_stays ?prev_s))
            (lyon_stays ?next_s)
        )
    )

    (:action spend_day_at_split
        :parameters (?d - day ?next_d - day ?prev_s - stay_count_num ?next_s - stay_count_num)
        :precondition (and
            (at city_split)
            (current_day ?d)
            (next_day ?d ?next_d)
            (split_stays ?prev_s)
            (next_stay_count ?prev_s ?next_s)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (stayed_on_day city_split ?d)
            (not (split_stays ?prev_s))
            (split_stays ?next_s)
        )
    )

    (:action finish_trip
        :parameters (?d - day)
        :precondition (and
            (current_day ?d)
            (next_day ?d day_end)
        )
        :effect (and
            (not (current_day ?d))
            (current_day day_end)
        )
    )
)