(define (domain trip_planning_example49)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        city
        day
        reykjavik_day_count
        milan_day_count
        split_day_count
    )

    (:predicates
        (at ?p - person ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (days_in_reykjavik ?count - reykjavik_day_count)
        (next_reykjavik_count ?c1 - reykjavik_day_count ?c2 - reykjavik_day_count)
        (days_in_milan ?count - milan_day_count)
        (next_milan_count ?c1 - milan_day_count ?c2 - milan_day_count)
        (days_in_split ?count - split_day_count)
        (next_split_count ?c1 - split_day_count ?c2 - split_day_count)
        (visited_city_on_day ?c - city ?d - day)
    )

    (:action fly
        :parameters (?p - person ?from - city ?to - city)
        :precondition (and (at ?p ?from) (connected ?from ?to))
        :effect (and (not (at ?p ?from)) (at ?p ?to)))

    (:action end_day_in_reykjavik
        :parameters (?p - person ?d_curr - day ?d_next - day ?r_curr - reykjavik_day_count ?r_next - reykjavik_day_count)
        :precondition (and (at ?p reykjavik)
                           (current_day ?d_curr)
                           (next_day ?d_curr ?d_next)
                           (days_in_reykjavik ?r_curr)
                           (next_reykjavik_count ?r_curr ?r_next))
        :effect (and (not (current_day ?d_curr))
                    (current_day ?d_next)
                    (visited_city_on_day reykjavik ?d_curr)
                    (not (days_in_reykjavik ?r_curr))
                    (days_in_reykjavik ?r_next)))

    (:action end_day_in_milan
        :parameters (?p - person ?d_curr - day ?d_next - day ?m_curr - milan_day_count ?m_next - milan_day_count)
        :precondition (and (at ?p milan)
                           (current_day ?d_curr)
                           (next_day ?d_curr ?d_next)
                           (days_in_milan ?m_curr)
                           (next_milan_count ?m_curr ?m_next))
        :effect (and (not (current_day ?d_curr))
                    (current_day ?d_next)
                    (visited_city_on_day milan ?d_curr)
                    (not (days_in_milan ?m_curr))
                    (days_in_milan ?m_next)))

    (:action end_day_in_split
        :parameters (?p - person ?d_curr - day ?d_next - day ?s_curr - split_day_count ?s_next - split_day_count)
        :precondition (and (at ?p split)
                           (current_day ?d_curr)
                           (next_day ?d_curr ?d_next)
                           (days_in_split ?s_curr)
                           (next_split_count ?s_curr ?s_next))
        :effect (and (not (current_day ?d_curr))
                    (current_day ?d_next)
                    (visited_city_on_day split ?d_curr)
                    (not (days_in_split ?s_curr))
                    (days_in_split ?s_next)))

    (:action end_last_day_in_reykjavik
        :parameters (?p - person ?d_curr - day ?r_curr - reykjavik_day_count ?r_next - reykjavik_day_count)
        :precondition (and (at ?p reykjavik)
                           (current_day ?d_curr)
                           (not (exists (?d_next_dummy - day) (next_day ?d_curr ?d_next_dummy)))
                           (days_in_reykjavik ?r_curr)
                           (next_reykjavik_count ?r_curr ?r_next))
        :effect (and (visited_city_on_day reykjavik ?d_curr)
                    (not (days_in_reykjavik ?r_curr))
                    (days_in_reykjavik ?r_next)))

    (:action end_last_day_in_milan
        :parameters (?p - person ?d_curr - day ?m_curr - milan_day_count ?m_next - milan_day_count)
        :precondition (and (at ?p milan)
                           (current_day ?d_curr)
                           (not (exists (?d_next_dummy - day) (next_day ?d_curr ?d_next_dummy)))
                           (days_in_milan ?m_curr)
                           (next_milan_count ?m_curr ?m_next))
        :effect (and (visited_city_on_day milan ?d_curr)
                    (not (days_in_milan ?m_curr))
                    (days_in_milan ?m_next)))

    (:action end_last_day_in_split
        :parameters (?p - person ?d_curr - day ?s_curr - split_day_count ?s_next - split_day_count)
        :precondition (and (at ?p split)
                           (current_day ?d_curr)
                           (not (exists (?d_next_dummy - day) (next_day ?d_curr ?d_next_dummy)))
                           (days_in_split ?s_curr)
                           (next_split_count ?s_curr ?s_next))
        :effect (and (visited_city_on_day split ?d_curr)
                    (not (days_in_split ?s_curr))
                    (days_in_split ?s_next)))
)