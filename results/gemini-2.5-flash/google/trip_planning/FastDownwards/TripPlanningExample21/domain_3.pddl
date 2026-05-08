(define (domain trip_planning_example_21)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day_step
        day_count
    )

    (:predicates
        (at ?c - city)
        (current_day ?d - day_step)
        (next_day ?d1 - day_step ?d2 - day_step)
        (days_remaining_at_current_city ?dc - day_count)
        (next_count ?dc_prev - day_count ?dc_current - day_count)
        (visited ?c - city)
        (flight ?c1 - city ?c2 - city)
        (workshop_attended)
        (is_workshop_day ?d - day_step)
    )

    (:action spend_day_non_venice_or_outside_workshop
        :parameters (?c - city
                     ?current_d ?next_d - day_step
                     ?current_dc ?next_dc - day_count)
        :precondition (and
            (at ?c)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (days_remaining_at_current_city ?current_dc)
            (next_count ?current_dc ?next_dc)
            (not (= ?current_dc count0)) ; Must have days left to spend
            (or (not (= ?c venice)) (not (is_workshop_day ?current_d))) ; Not Venice on a workshop day
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (days_remaining_at_current_city ?current_dc))
            (days_remaining_at_current_city ?next_dc)
        )
    )

    (:action spend_day_venice_attend_workshop
        :parameters (?current_d ?next_d - day_step
                     ?current_dc ?next_dc - day_count)
        :precondition (and
            (at venice)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (days_remaining_at_current_city ?current_dc)
            (next_count ?current_dc ?next_dc)
            (not (= ?current_dc count0)) ; Must have days left to spend
            (is_workshop_day ?current_d) ; It's a workshop day
            (not (workshop_attended)) ; Workshop not yet attended
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (days_remaining_at_current_city ?current_dc))
            (days_remaining_at_current_city ?next_dc)
            (workshop_attended) ; Mark workshop as attended
        )
    )

    (:action spend_day_venice_after_workshop_attended
        :parameters (?current_d ?next_d - day_step
                     ?current_dc ?next_dc - day_count)
        :precondition (and
            (at venice)
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (days_remaining_at_current_city ?current_dc)
            (next_count ?current_dc ?next_dc)
            (not (= ?current_dc count0)) ; Must have days left to spend
            (is_workshop_day ?current_d) ; It's a workshop day
            (workshop_attended) ; Workshop already attended
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (days_remaining_at_current_city ?current_dc))
            (days_remaining_at_current_city ?next_dc)
        )
    )

    (:action fly_mykonos_to_vienna
        :parameters (?current_d - day_step)
        :precondition (and
            (at mykonos)
            (days_remaining_at_current_city count0) ; Must have spent all days in Mykonos
            (flight mykonos vienna)
            (current_day ?current_d) ; Flight does not advance day
        )
        :effect (and
            (not (at mykonos))
            (at vienna)
            (not (days_remaining_at_current_city count0)) ; Reset count
            (days_remaining_at_current_city count2) ; Vienna duration is 2 days
            (visited vienna)
        )
    )

    (:action fly_vienna_to_venice
        :parameters (?current_d - day_step)
        :precondition (and
            (at vienna)
            (days_remaining_at_current_city count0) ; Must have spent all days in Vienna
            (flight vienna venice)
            (current_day ?current_d) ; Flight does not advance day
        )
        :effect (and
            (not (at vienna))
            (at venice)
            (not (days_remaining_at_current_city count0)) ; Reset count
            (days_remaining_at_current_city count6) ; Venice duration is 6 days
            (visited venice)
        )
    )