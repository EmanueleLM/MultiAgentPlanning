(define (domain trip_planning_repaired)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        day_count
    )
    (:constants
        seville munich tallinn - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day
        day_count_0 day_count_1 day_count_2 day_count_3 day_count_4 day_count_5 day_count_6 - day_count
    )
    (:predicates
        (is_current_day ?d - day)
        (at_city ?c - city)
        (direct_flight ?c1 ?c2 - city)
        (next_day ?d1 ?d2 - day)
        (next_day_count ?n1 ?n2 - day_count)

        ; Track total days spent in each city
        (days_in_seville ?n - day_count)
        (days_in_munich ?n - day_count)
        (days_in_tallinn ?n - day_count)

        ; To ensure meeting constraint: becomes true once meeting is satisfied
        (tallinn_meeting_held)
    )

    ;; Action to stay in Seville for another day
    (:action stay_in_seville
        :parameters (?d_current - day ?d_next - day ?n_current - day_count ?n_next - day_count)
        :precondition (and
            (is_current_day ?d_current)
            (at_city seville)
            (next_day ?d_current ?d_next)
            (days_in_seville ?n_current)
            (next_day_count ?n_current ?n_next)
            (not (is_current_day day_12)) ; Cannot advance if already on day 12 (i.e., this action moves from day_11 to day_12)
            (not (days_in_seville day_count_6)) ; Cannot stay if max days (6) for Seville reached
        )
        :effect (and
            (not (is_current_day ?d_current))
            (is_current_day ?d_next)
            (not (days_in_seville ?n_current))
            (days_in_seville ?n_next)
        )
    )

    ;; Action to stay in Munich for another day
    (:action stay_in_munich
        :parameters (?d_current - day ?d_next - day ?n_current - day_count ?n_next - day_count)
        :precondition (and
            (is_current_day ?d_current)
            (at_city munich)
            (next_day ?d_current ?d_next)
            (days_in_munich ?n_current)
            (next_day_count ?n_current ?n_next)
            (not (is_current_day day_12)) ; Cannot advance if already on day 12
            (not (days_in_munich day_count_4)) ; Cannot stay if max days (4) for Munich reached
        )
        :effect (and
            (not (is_current_day ?d_current))
            (is_current_day ?d_next)
            (not (days_in_munich ?n_current))
            (days_in_munich ?n_next)
        )
    )

    ;; Action to stay in Tallinn for another day
    (:action stay_in_tallinn
        :parameters (?d_current - day ?d_next - day ?n_current - day_count ?n_next - day_count)
        :precondition (and
            (is_current_day ?d_current)
            (at_city tallinn)
            (next_day ?d_current ?d_next)
            (days_in_tallinn ?n_current)
            (next_day_count ?n_current ?n_next)
            (not (is_current_day day_12)) ; Cannot advance if already on day 12
            (not (days_in_tallinn day_count_2)) ; Cannot stay if max days (2) for Tallinn reached
        )
        :effect (and
            (not (is_current_day ?d_current))
            (is_current_day ?d_next)
            (not (days_in_tallinn ?n_current))
            (days_in_tallinn ?n_next)
        )
    )

    ;; Action to hold the meeting in Tallinn
    (:action hold_tallinn_meeting
        :parameters (?d - day)
        :precondition (and
            (is_current_day ?d)
            (at_city tallinn)
            (or (is_current_day day_11) (is_current_day day_12))
            (not (tallinn_meeting_held)) ; Only need to hold it once
        )
        :effect (and
            (tallinn_meeting_held)
        )
    )

    ;; Travel from Seville to Munich
    ;; On Day_current, agent is in Seville. Travel happens. On Day_next, agent is in Munich and that day counts for Munich.
    (:action travel_seville_munich
        :parameters (?d_current - day ?d_next - day ?n_munich_current - day_count ?n_munich_next - day_count)
        :precondition (and
            (is_current_day ?d_current)
            (at_city seville)
            (next_day ?d_current ?d_next)
            (direct_flight seville munich)
            (not (is_current_day day_12)) ; Cannot travel if already on day 12
            (days_in_munich ?n_munich_current)
            (next_day_count ?n_munich_current ?n_munich_next)
            (not (days_in_munich day_count_4)) ; Cannot travel to Munich if max days (4) already spent there
        )
        :effect (and
            (not (is_current_day ?d_current))
            (is_current_day ?d_next)
            (not (at_city seville))
            (at_city munich)
            (not (days_in_munich ?n_munich_current))
            (days_in_munich ?n_munich_next)
        )
    )

    ;; Travel from Munich to Seville
    (:action travel_munich_seville
        :parameters (?d_current - day ?d_next - day ?n_seville_current - day_count ?n_seville_next - day_count)
        :precondition (and
            (is_current_day ?d_current)
            (at_city munich)
            (next_day ?d_current ?d_next)
            (direct_flight munich seville)
            (not (is_current_day day_12))
            (days_in_seville ?n_seville_current)
            (next_day_count ?n_seville_current ?n_seville_next)
            (not (days_in_seville day_count_6))
        )
        :effect (and
            (not (is_current_day ?d_current))
            (is_current_day ?d_next)
            (not (at_city munich))
            (at_city seville)
            (not (days_in_seville ?n_seville_current))
            (days_in_seville ?n_seville_next)
        )
    )

    ;; Travel from Munich to Tallinn
    (:action travel_munich_tallinn
        :parameters (?d_current - day ?d_next - day ?n_tallinn_current - day_count ?n_tallinn_next - day_count)
        :precondition (and
            (is_current_day ?d_current)
            (at_city munich)
            (next_day ?d_current ?d_next)
            (direct_flight munich tallinn)
            (not (is_current_day day_12))
            (days_in_tallinn ?n_tallinn_current)
            (next_day_count ?n_tallinn_current ?n_tallinn_next)
            (not (days_in_tallinn day_count_2))
        )
        :effect (and
            (not (is_current_day ?d_current))
            (is_current_day ?d_next)
            (not (at_city munich))
            (at_city tallinn)
            (not (days_in_tallinn ?n_tallinn_current))
            (days_in_tallinn ?n_tallinn_next)
        )
    )

    ;; Travel from Tallinn to Munich
    (:action travel_tallinn_munich
        :parameters (?d_current - day ?d_next - day ?n_munich_current - day_count ?n_munich_next - day_count)
        :precondition (and
            (is_current_day ?d_current)
            (at_city tallinn)
            (next_day ?d_current ?d_next)
            (direct_flight tallinn munich)
            (not (is_current_day day_12))
            (days_in_munich ?n_munich_current)
            (next_day_count ?n_munich_current ?n_munich_next)
            (not (days_in_munich day_count_4))
        )
        :effect (and
            (not (is_current_day ?d_current))
            (is_current_day ?d_next)
            (not (at_city tallinn))
            (at_city munich)
            (not (days_in_munich ?n_munich_current))
            (days_in_munich ?n_munich_next)
        )
    )
)