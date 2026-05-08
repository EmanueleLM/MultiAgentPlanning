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
        (current_trip_day ?td - trip_day)
        (next_trip_day ?td1 - trip_day ?td2 - trip_day)
        (direct_flight ?from ?to - city)
        (days_in_paris ?pdc - paris_day_count)
        (next_paris_day_count ?pdc1 - paris_day_count ?pdc2 - paris_day_count)
        (days_in_mykonos ?mdc - mykonos_day_count)
        (next_mykonos_day_count ?mdc1 - mykonos_day_count ?mdc2 - mykonos_day_count)
        (days_in_nice ?ndc - nice_day_count)
        (next_nice_day_count ?ndc1 - nice_day_count ?ndc2 - nice_day_count)
        (visited ?c - city)
        (friends_met_in_paris)
        (in_paris_meeting_window ?td - trip_day)
    )

    (:action stay_in_paris
        :parameters (?td_curr ?td_next - trip_day ?pdc_curr ?pdc_next - paris_day_count)
        :precondition (and (at paris)
                           (current_trip_day ?td_curr)
                           (next_trip_day ?td_curr ?td_next)
                           (days_in_paris ?pdc_curr)
                           (next_paris_day_count ?pdc_curr ?pdc_next))
        :effect (and (not (current_trip_day ?td_curr)) (current_trip_day ?td_next)
                     (not (days_in_paris ?pdc_curr)) (days_in_paris ?pdc_next)
                     (visited paris)))

    (:action stay_in_mykonos
        :parameters (?td_curr ?td_next - trip_day ?mdc_curr ?mdc_next - mykonos_day_count)
        :precondition (and (at mykonos)
                           (current_trip_day ?td_curr)
                           (next_trip_day ?td_curr ?td_next)
                           (days_in_mykonos ?mdc_curr)
                           (next_mykonos_day_count ?mdc_curr ?mdc_next))
        :effect (and (not (current_trip_day ?td_curr)) (current_trip_day ?td_next)
                     (not (days_in_mykonos ?mdc_curr)) (days_in_mykonos ?mdc_next)
                     (visited mykonos)))

    (:action stay_in_nice
        :parameters (?td_curr ?td_next - trip_day ?ndc_curr ?ndc_next - nice_day_count)
        :precondition (and (at nice)
                           (current_trip_day ?td_curr)
                           (next_trip_day ?td_curr ?td_next)
                           (days_in_nice ?ndc_curr)
                           (next_nice_day_count ?ndc_curr ?ndc_next))
        :effect (and (not (current_trip_day ?td_curr)) (current_trip_day ?td_next)
                     (not (days_in_nice ?ndc_curr)) (days_in_nice ?ndc_next)
                     (visited nice)))

    (:action travel
        :parameters (?from ?to - city ?td_curr ?td_next - trip_day)
        :precondition (and (at ?from)
                           (direct_flight ?from ?to)
                           (current_trip_day ?td_curr)
                           (next_trip_day ?td_curr ?td_next))
        :effect (and (not (at ?from)) (at ?to)
                     (not (current_trip_day ?td_curr)) (current_trip_day ?td_next)))

    (:action do_meet_friends
        :parameters (?td - trip_day)
        :precondition (and (at paris)
                           (current_trip_day ?td)
                           (in_paris_meeting_window ?td)
                           (not (friends_met_in_paris)))
        :effect (friends_met_in_paris))
)