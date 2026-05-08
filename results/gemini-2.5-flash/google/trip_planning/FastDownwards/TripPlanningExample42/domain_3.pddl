(define (domain trip_planning_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        trip_day
        paris_day_count
        mykonos_day_count
        nice_day_count
    )

    (:predicates
        (at ?c - city)
        (current_day ?d - trip_day)
        (next_day ?d1 - trip_day ?d2 - trip_day)
        (direct_flight ?from ?to - city)
        (has_spent_days_in_paris ?pdc - paris_day_count)
        (next_paris_day_count ?pdc1 - paris_day_count ?pdc2 - paris_day_count)
        (has_spent_days_in_mykonos ?mdc - mykonos_day_count)
        (next_mykonos_day_count ?mdc1 - mykonos_day_count ?mdc2 - mykonos_day_count)
        (has_spent_days_in_nice ?ndc - nice_day_count)
        (next_nice_day_count ?ndc1 - nice_day_count ?ndc2 - nice_day_count)
        (visited ?c - city)
        (friends_met)
        (is_meeting_window_day ?d - trip_day)
    )

    (:action stay_in_paris
        :parameters (?d_curr ?d_next - trip_day ?pdc_curr ?pdc_next - paris_day_count)
        :precondition (and (at paris)
                           (current_day ?d_curr)
                           (next_day ?d_curr ?d_next)
                           (has_spent_days_in_paris ?pdc_curr)
                           (next_paris_day_count ?pdc_curr ?pdc_next))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next)
                     (not (has_spent_days_in_paris ?pdc_curr)) (has_spent_days_in_paris ?pdc_next)
                     (visited paris)))

    (:action stay_in_mykonos
        :parameters (?d_curr ?d_next - trip_day ?mdc_curr ?mdc_next - mykonos_day_count)
        :precondition (and (at mykonos)
                           (current_day ?d_curr)
                           (next_day ?d_curr ?d_next)
                           (has_spent_days_in_mykonos ?mdc_curr)
                           (next_mykonos_day_count ?mdc_curr ?mdc_next))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next)
                     (not (has_spent_days_in_mykonos ?mdc_curr)) (has_spent_days_in_mykonos ?mdc_next)
                     (visited mykonos)))

    (:action stay_in_nice
        :parameters (?d_curr ?d_next - trip_day ?ndc_curr ?ndc_next - nice_day_count)
        :precondition (and (at nice)
                           (current_day ?d_curr)
                           (next_day ?d_curr ?d_next)
                           (has_spent_days_in_nice ?ndc_curr)
                           (next_nice_day_count ?ndc_curr ?ndc_next))
        :effect (and (not (current_day ?d_curr)) (current_day ?d_next)
                     (not (has_spent_days_in_nice ?ndc_curr)) (has_spent_days_in_nice ?ndc_next)
                     (visited nice)))

    (:action travel
        :parameters (?from ?to - city ?d_curr ?d_next - trip_day)
        :precondition (and (at ?from)
                           (direct_flight ?from ?to)
                           (current_day ?d_curr)
                           (next_day ?d_curr ?d_next))
        :effect (and (not (at ?from)) (at ?to)
                     (not (current_day ?d_curr)) (current_day ?d_next)))

    (:action meet_friends
        :parameters (?d - trip_day)
        :precondition (and (at paris)
                           (current_day ?d)
                           (is_meeting_window_day ?d)
                           (not (friends_met)))
        :effect (friends_met))
)