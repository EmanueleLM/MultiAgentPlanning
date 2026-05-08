(define (domain trip_planning_example49)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        traveler
        day
        day_one_to_three - day
        day_later - day
        reykjavik_day_count
        milan_day_count
        split_day_count
        total_day_count
    )
    (:predicates
        (at ?p - traveler ?loc - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (days_in_reykjavik_count ?n - reykjavik_day_count)
        (next_r_count ?n1 - reykjavik_day_count ?n2 - reykjavik_day_count)
        (days_in_milan_count ?n - milan_day_count)
        (next_m_count ?n1 - milan_day_count ?n2 - milan_day_count)
        (days_in_split_count ?n - split_day_count)
        (next_s_count ?n1 - split_day_count ?n2 - split_day_count)
        (total_trip_days_count ?n - total_day_count)
        (next_t_count ?n1 - total_day_count ?n2 - total_day_count)
        (visited_split_on_day_1_to_3_flag)
    )

    (:functions (total-cost))

    ;; Action: Fly between cities
    (:action fly
        :parameters (?p - traveler ?from - city ?to - city)
        :precondition (and
            (at ?p ?from)
            (connected ?from ?to)
            (not (at ?p ?to)) ; Traveler must not already be at the destination
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Spend a day in Reykjavik
    (:action spend_day_in_reykjavik
        :parameters (?p - traveler
                     ?d - day ?next_d - day
                     ?rc1 - reykjavik_day_count ?rc2 - reykjavik_day_count
                     ?tc1 - total_day_count ?tc2 - total_day_count)
        :precondition (and
            (at ?p reykjavik)
            (current_day ?d)
            (next_day ?d ?next_d)
            (days_in_reykjavik_count ?rc1)
            (next_r_count ?rc1 ?rc2)
            (total_trip_days_count ?tc1)
            (next_t_count ?tc1 ?tc2)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_reykjavik_count ?rc1))
            (days_in_reykjavik_count ?rc2)
            (not (total_trip_days_count ?tc1))
            (total_trip_days_count ?tc2)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Spend a day in Milan
    (:action spend_day_in_milan
        :parameters (?p - traveler
                     ?d - day ?next_d - day
                     ?mc1 - milan_day_count ?mc2 - milan_day_count
                     ?tc1 - total_day_count ?tc2 - total_day_count)
        :precondition (and
            (at ?p milan)
            (current_day ?d)
            (next_day ?d ?next_d)
            (days_in_milan_count ?mc1)
            (next_m_count ?mc1 ?mc2)
            (total_trip_days_count ?tc1)
            (next_t_count ?tc1 ?tc2)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_milan_count ?mc1))
            (days_in_milan_count ?mc2)
            (not (total_trip_days_count ?tc1))
            (total_trip_days_count ?tc2)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Spend a day in Split during the special window (day 1-3)
    (:action spend_day_in_split_day_1_to_3
        :parameters (?p - traveler
                     ?d - day_one_to_three ?next_d - day
                     ?sc1 - split_day_count ?sc2 - split_day_count
                     ?tc1 - total_day_count ?tc2 - total_day_count)
        :precondition (and
            (at ?p split)
            (current_day ?d)
            (next_day ?d ?next_d)
            (days_in_split_count ?sc1)
            (next_s_count ?sc1 ?sc2)
            (total_trip_days_count ?tc1)
            (next_t_count ?tc1 ?tc2)
            (not (visited_split_on_day_1_to_3_flag)) ; Only set the flag once
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_split_count ?sc1))
            (days_in_split_count ?sc2)
            (not (total_trip_days_count ?tc1))
            (total_trip_days_count ?tc2)
            (visited_split_on_day_1_to_3_flag)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Spend a day in Split outside the special window (day 0 or after day 3)
    (:action spend_day_in_split_day_later
        :parameters (?p - traveler
                     ?d - day_later ?next_d - day
                     ?sc1 - split_day_count ?sc2 - split_day_count
                     ?tc1 - total_day_count ?tc2 - total_day_count)
        :precondition (and
            (at ?p split)
            (current_day ?d)
            (next_day ?d ?next_d)
            (days_in_split_count ?sc1)
            (next_s_count ?sc1 ?sc2)
            (total_trip_days_count ?tc1)
            (next_t_count ?tc1 ?tc2)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_split_count ?sc1))
            (days_in_split_count ?sc2)
            (not (total_trip_days_count ?tc1))
            (total_trip_days_count ?tc2)
            (increase (total-cost) 1)
        )
    )
)