(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        count_num
    )
    (:constants
        tallinn seville munich - city
        day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
        c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - count_num
    )
    (:predicates
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (at_city ?c - city)
        (connected ?c1 ?c2 - city) ; Symmetric connections
        (days_in_tallinn ?n - count_num)
        (days_in_seville ?n - count_num)
        (days_in_munich ?n - count_num)
        (next_count ?n1 ?n2 - count_num)
        (met_friend_in_tallinn)
        (visited ?c - city) ; To ensure all cities are visited
        (is_day_11 ?d - day)
        (is_day_12 ?d - day)
    )

    ;; Actions to start the trip on Day 1 in one of the cities.
    ;; These actions move from the pre-trip state (day0) to day1 and
    ;; increment the day count for the initial city.
    (:action start_trip_in_tallinn
        :parameters (?d0 ?d1 - day ?c0 ?c1 - count_num)
        :precondition (and (current_day ?d0) (next_day ?d0 ?d1)
                           (days_in_tallinn ?c0) (next_count ?c0 ?c1))
        :effect (and (not (current_day ?d0)) (current_day ?d1)
                     (at_city tallinn) (visited tallinn)
                     (not (days_in_tallinn ?c0)) (days_in_tallinn ?c1)))

    (:action start_trip_in_seville
        :parameters (?d0 ?d1 - day ?c0 ?c1 - count_num)
        :precondition (and (current_day ?d0) (next_day ?d0 ?d1)
                           (days_in_seville ?c0) (next_count ?c0 ?c1))
        :effect (and (not (current_day ?d0)) (current_day ?d1)
                     (at_city seville) (visited seville)
                     (not (days_in_seville ?c0)) (days_in_seville ?c1)))

    (:action start_trip_in_munich
        :parameters (?d0 ?d1 - day ?c0 ?c1 - count_num)
        :precondition (and (current_day ?d0) (next_day ?d0 ?d1)
                           (days_in_munich ?c0) (next_count ?c0 ?c1))
        :effect (and (not (current_day ?d0)) (current_day ?d1)
                     (at_city munich) (visited munich)
                     (not (days_in_munich ?c0)) (days_in_munich ?c1)))


    ;; Actions to stay in a city for another day.
    ;; Separate actions are defined for Tallinn to handle the meeting constraint.

    (:action stay_in_tallinn
        :parameters (?d_prev ?d_curr - day ?t_old ?t_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr) (at_city tallinn)
                           (days_in_tallinn ?t_old) (next_count ?t_old ?t_new)
                           (not (is_day_11 ?d_curr)) (not (is_day_12 ?d_curr))) ; Changed ?d_prev to ?d_curr
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (days_in_tallinn ?t_old)) (days_in_tallinn ?t_new)))

    (:action stay_in_seville
        :parameters (?d_prev ?d_curr - day ?s_old ?s_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr) (at_city seville)
                           (days_in_seville ?s_old) (next_count ?s_old ?s_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (days_in_seville ?s_old)) (days_in_seville ?s_new)))

    (:action stay_in_munich
        :parameters (?d_prev ?d_curr - day ?m_old ?m_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr) (at_city munich)
                           (days_in_munich ?m_old) (next_count ?m_old ?m_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (days_in_munich ?m_old)) (days_in_munich ?m_new)))

    ;; Special action for staying in Tallinn to meet a friend on Day 11 or 12
    (:action stay_in_tallinn_and_meet
        :parameters (?d_prev ?d_curr - day ?t_old ?t_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr) (at_city tallinn)
                           (days_in_tallinn ?t_old) (next_count ?t_old ?t_new)
                           (or (is_day_11 ?d_curr) (is_day_12 ?d_curr)) ; Changed ?d_prev to ?d_curr
                           (not (met_friend_in_tallinn))) ; Meeting can only happen once
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (days_in_tallinn ?t_old)) (days_in_tallinn ?t_new)
                     (met_friend_in_tallinn)))

    ;; Actions to travel between cities.
    ;; Travel implies spending the day of arrival in the destination city, so its day count increments.

    (:action travel_munich_to_tallinn
        :parameters (?d_prev ?d_curr - day ?t_old ?t_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (at_city munich) (connected munich tallinn)
                           (days_in_tallinn ?t_old) (next_count ?t_old ?t_new)
                           (not (is_day_11 ?d_curr)) (not (is_day_12 ?d_curr))) ; Changed ?d_prev to ?d_curr
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (at_city munich)) (at_city tallinn) (visited tallinn)
                     (not (days_in_tallinn ?t_old)) (days_in_tallinn ?t_new)))

    (:action travel_tallinn_to_munich
        :parameters (?d_prev ?d_curr - day ?m_old ?m_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (at_city tallinn) (connected tallinn munich)
                           (days_in_munich ?m_old) (next_count ?m_old ?m_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (at_city tallinn)) (at_city munich) (visited munich)
                     (not (days_in_munich ?m_old)) (days_in_munich ?m_new)))

    (:action travel_munich_to_seville
        :parameters (?d_prev ?d_curr - day ?s_old ?s_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (at_city munich) (connected munich seville)
                           (days_in_seville ?s_old) (next_count ?s_old ?s_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (at_city munich)) (at_city seville) (visited seville)
                     (not (days_in_seville ?s_old)) (days_in_seville ?s_new)))

    (:action travel_seville_to_munich
        :parameters (?d_prev ?d_curr - day ?m_old ?m_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (at_city seville) (connected seville munich)
                           (days_in_munich ?m_old) (next_count ?m_old ?m_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (at_city seville)) (at_city munich) (visited munich)
                     (not (days_in_munich ?m_old)) (days_in_munich ?m_new)))

    ;; Special action for traveling to Tallinn to meet a friend on Day 11 or 12
    (:action travel_munich_to_tallinn_and_meet
        :parameters (?d_prev ?d_curr - day ?t_old ?t_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (at_city munich) (connected munich tallinn)
                           (days_in_tallinn ?t_old) (next_count ?t_old ?t_new)
                           (or (is_day_11 ?d_curr) (is_day_12 ?d_curr)) ; Changed ?d_prev to ?d_curr
                           (not (met_friend_in_tallinn)))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (at_city munich)) (at_city tallinn) (visited tallinn)
                     (not (days_in_tallinn ?t_old)) (days_in_tallinn ?t_new)
                     (met_friend_in_tallinn)))
)