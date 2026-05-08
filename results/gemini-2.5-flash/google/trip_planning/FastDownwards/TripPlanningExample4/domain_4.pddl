(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        count_num
    )
    (:predicates
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (current_location ?c - city) ; Tracks the agent's current city
        (connected ?c1 ?c2 - city) ; Symmetric connections
        (days_in_tallinn ?n - count_num)
        (days_in_seville ?n - count_num)
        (days_in_munich ?n - count_num)
        (next_count ?n1 ?n2 - count_num)
        (met_friend_in_tallinn)
        (visited ?c - city) ; To ensure all cities are visited
        (is_day_11 ?d - day)
        (is_day_12 ?d - day)
        (trip_not_started) ; Ensures start_trip actions are only used once
    )

    ;; Actions to start the trip on Day 1 in one of the cities.
    ;; These actions move from the pre-trip state (day0) to day1 and
    ;; increment the day count for the initial city, and mark the trip as started.
    (:action start_trip_in_tallinn
        :parameters (?d0 ?d1 - day ?c0 ?c1 - count_num)
        :precondition (and (current_day ?d0) (next_day ?d0 ?d1)
                           (days_in_tallinn ?c0) (next_count ?c0 ?c1)
                           (trip_not_started))
        :effect (and (not (current_day ?d0)) (current_day ?d1)
                     (current_location tallinn) (visited tallinn)
                     (not (days_in_tallinn ?c0)) (days_in_tallinn ?c1)
                     (not (trip_not_started))))

    (:action start_trip_in_seville
        :parameters (?d0 ?d1 - day ?c0 ?c1 - count_num)
        :precondition (and (current_day ?d0) (next_day ?d0 ?d1)
                           (days_in_seville ?c0) (next_count ?c0 ?c1)
                           (trip_not_started))
        :effect (and (not (current_day ?d0)) (current_day ?d1)
                     (current_location seville) (visited seville)
                     (not (days_in_seville ?c0)) (days_in_seville ?c1)
                     (not (trip_not_started))))

    (:action start_trip_in_munich
        :parameters (?d0 ?d1 - day ?c0 ?c1 - count_num)
        :precondition (and (current_day ?d0) (next_day ?d0 ?d1)
                           (days_in_munich ?c0) (next_count ?c0 ?c1)
                           (trip_not_started))
        :effect (and (not (current_day ?d0)) (current_day ?d1)
                     (current_location munich) (visited munich)
                     (not (days_in_munich ?c0)) (days_in_munich ?c1)
                     (not (trip_not_started))))


    ;; Actions to stay in a city for another day.
    ;; Separate actions are defined for Tallinn to handle the meeting constraint.

    (:action stay_in_tallinn
        :parameters (?d_prev ?d_curr - day ?t_old ?t_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr) (current_location tallinn)
                           (days_in_tallinn ?t_old) (next_count ?t_old ?t_new)
                           (not (is_day_11 ?d_curr)) (not (is_day_12 ?d_curr)))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (days_in_tallinn ?t_old)) (days_in_tallinn ?t_new)))

    (:action stay_in_seville
        :parameters (?d_prev ?d_curr - day ?s_old ?s_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr) (current_location seville)
                           (days_in_seville ?s_old) (next_count ?s_old ?s_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (days_in_seville ?s_old)) (days_in_seville ?s_new)))

    (:action stay_in_munich
        :parameters (?d_prev ?d_curr - day ?m_old ?m_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr) (current_location munich)
                           (days_in_munich ?m_old) (next_count ?m_old ?m_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (days_in_munich ?m_old)) (days_in_munich ?m_new)))

    ;; Special action for staying in Tallinn to meet a friend on Day 11 or 12
    (:action stay_in_tallinn_and_meet
        :parameters (?d_prev ?d_curr - day ?t_old ?t_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr) (current_location tallinn)
                           (days_in_tallinn ?t_old) (next_count ?t_old ?t_new)
                           (or (is_day_11 ?d_curr) (is_day_12 ?d_curr))
                           (not (met_friend_in_tallinn))) ; Meeting can only happen once
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (days_in_tallinn ?t_old)) (days_in_tallinn ?t_new)
                     (met_friend_in_tallinn)))

    ;; Actions to travel between cities.
    ;; Travel implies spending the day of arrival in the destination city, so its day count increments.

    (:action travel_munich_to_tallinn
        :parameters (?d_prev ?d_curr - day ?t_old ?t_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (current_location munich) (connected munich tallinn)
                           (days_in_tallinn ?t_old) (next_count ?t_old ?t_new)
                           (not (is_day_11 ?d_curr)) (not (is_day_12 ?d_curr)))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (current_location munich)) (current_location tallinn) (visited tallinn)
                     (not (days_in_tallinn ?t_old)) (days_in_tallinn ?t_new)))

    (:action travel_tallinn_to_munich
        :parameters (?d_prev ?d_curr - day ?m_old ?m_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (current_location tallinn) (connected tallinn munich)
                           (days_in_munich ?m_old) (next_count ?m_old ?m_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (current_location tallinn)) (current_location munich) (visited munich)
                     (not (days_in_munich ?m_old)) (days_in_munich ?m_new)))

    (:action travel_munich_to_seville
        :parameters (?d_prev ?d_curr - day ?s_old ?s_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (current_location munich) (connected munich seville)
                           (days_in_seville ?s_old) (next_count ?s_old ?s_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (current_location munich)) (current_location seville) (visited seville)
                     (not (days_in_seville ?s_old)) (days_in_seville ?s_new)))

    (:action travel_seville_to_munich
        :parameters (?d_prev ?d_curr - day ?m_old ?m_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (current_location seville) (connected seville munich)
                           (days_in_munich ?m_old) (next_count ?m_old ?m_new))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (current_location seville)) (current_location munich) (visited munich)
                     (not (days_in_munich ?m_old)) (days_in_munich ?m_new)))

    ;; Special action for traveling to Tallinn to meet a friend on Day 11 or 12
    (:action travel_munich_to_tallinn_and_meet
        :parameters (?d_prev ?d_curr - day ?t_old ?t_new - count_num)
        :precondition (and (current_day ?d_prev) (next_day ?d_prev ?d_curr)
                           (current_location munich) (connected munich tallinn)
                           (days_in_tallinn ?t_old) (next_count ?t_old ?t_new)
                           (or (is_day_11 ?d_curr) (is_day_12 ?d_curr))
                           (not (met_friend_in_tallinn)))
        :effect (and (not (current_day ?d_prev)) (current_day ?d_curr)
                     (not (current_location munich)) (current_location tallinn) (visited tallinn)
                     (not (days_in_tallinn ?t_old)) (days_in_tallinn ?t_new)
                     (met_friend_in_tallinn)))
)