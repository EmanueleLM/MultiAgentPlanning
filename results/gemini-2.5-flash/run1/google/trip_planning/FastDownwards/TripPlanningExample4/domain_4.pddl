(define (domain trip_planning_example4)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        trip_day    ; Represents the current sequential day of the trip (from 0 to 12)
        stay_count  ; Represents the cumulative days spent in a specific city (from 0 to max_days_in_city)
    )
    (:constants
        seville munich tallinn - city
        trip_day_0 trip_day_1 trip_day_2 trip_day_3 trip_day_4 trip_day_5 trip_day_6
        trip_day_7 trip_day_8 trip_day_9 trip_day_10 trip_day_11 trip_day_12 - trip_day
        stay_count_0 stay_count_1 stay_count_2 stay_count_3 stay_count_4 stay_count_5 stay_count_6 - stay_count
    )
    (:predicates
        (current_trip_day ?td - trip_day)
        (at_city ?c - city)
        (direct_flight ?c1 ?c2 - city)
        (next_trip_day ?td1 ?td2 - trip_day)
        (next_stay_count ?sc1 ?sc2 - stay_count)

        ; Track total days spent in each city
        (days_in_seville ?sc - stay_count)
        (days_in_munich ?sc - stay_count)
        (days_in_tallinn ?sc - stay_count)

        ; To ensure meeting constraint: becomes true once meeting is satisfied
        (tallinn_meeting_held)
    )

    ;; Action to spend a day in Seville
    ;; Each such action consumes a trip_day and increments the city's stay_count.
    (:action spend_day_in_seville
        :parameters (?td_current - trip_day ?td_next - trip_day
                     ?sc_seville_current - stay_count ?sc_seville_next - stay_count)
        :precondition (and
            (current_trip_day ?td_current)
            (at_city seville)
            (next_trip_day ?td_current ?td_next) ; Advance overall trip day
            (days_in_seville ?sc_seville_current)
            (next_stay_count ?sc_seville_current ?sc_seville_next) ; Increment Seville stay count
            (not (days_in_seville stay_count_6)) ; Cannot stay if max days (6) for Seville reached
        )
        :effect (and
            (not (current_trip_day ?td_current))
            (current_trip_day ?td_next)
            (not (days_in_seville ?sc_seville_current))
            (days_in_seville ?sc_seville_next)
        )
    )

    ;; Action to spend a day in Munich
    (:action spend_day_in_munich
        :parameters (?td_current - trip_day ?td_next - trip_day
                     ?sc_munich_current - stay_count ?sc_munich_next - stay_count)
        :precondition (and
            (current_trip_day ?td_current)
            (at_city munich)
            (next_trip_day ?td_current ?td_next)
            (days_in_munich ?sc_munich_current)
            (next_stay_count ?sc_munich_current ?sc_munich_next)
            (not (days_in_munich stay_count_4)) ; Cannot stay if max days (4) for Munich reached
        )
        :effect (and
            (not (current_trip_day ?td_current))
            (current_trip_day ?td_next)
            (not (days_in_munich ?sc_munich_current))
            (days_in_munich ?sc_munich_next)
        )
    )

    ;; Action to spend a day in Tallinn
    (:action spend_day_in_tallinn
        :parameters (?td_current - trip_day ?td_next - trip_day
                     ?sc_tallinn_current - stay_count ?sc_tallinn_next - stay_count)
        :precondition (and
            (current_trip_day ?td_current)
            (at_city tallinn)
            (next_trip_day ?td_current ?td_next)
            (days_in_tallinn ?sc_tallinn_current)
            (next_stay_count ?sc_tallinn_current ?sc_tallinn_next)
            (not (days_in_tallinn stay_count_2)) ; Cannot stay if max days (2) for Tallinn reached
        )
        :effect (and
            (not (current_trip_day ?td_current))
            (current_trip_day ?td_next)
            (not (days_in_tallinn ?sc_tallinn_current))
            (days_in_tallinn ?sc_tallinn_next)
        )
    )

    ;; Action to hold the meeting in Tallinn
    (:action hold_tallinn_meeting
        :parameters (?td - trip_day)
        :precondition (and
            (current_trip_day ?td)
            (at_city tallinn)
            ; Meeting required between Day 11 and Day 12 (inclusive)
            ; If trip_day_0 is the state before day 1, then trip_day_10 is the state before day 11,
            ; and trip_day_11 is the state before day 12.
            (or (current_trip_day trip_day_10) (current_trip_day trip_day_11))
            (not (tallinn_meeting_held))
        )
        :effect (tallinn_meeting_held)
    )

    ;; Travel from Seville to Munich (and spend the day in Munich)
    ;; Travel consumes a trip_day and increments the destination city's stay_count for that day.
    (:action travel_seville_munich
        :parameters (?td_current - trip_day ?td_next - trip_day
                     ?sc_munich_current - stay_count ?sc_munich_next - stay_count)
        :precondition (and
            (current_trip_day ?td_current)
            (at_city seville)
            (next_trip_day ?td_current ?td_next)
            (direct_flight seville munich)
            (days_in_munich ?sc_munich_current)
            (next_stay_count ?sc_munich_current ?sc_munich_next)
            (not (days_in_munich stay_count_4)) ; Cannot travel to Munich if max days (4) already spent there
        )
        :effect (and
            (not (current_trip_day ?td_current))
            (current_trip_day ?td_next)
            (not (at_city seville))
            (at_city munich)
            (not (days_in_munich ?sc_munich_current))
            (days_in_munich ?sc_munich_next)
        )
    )

    ;; Travel from Munich to Seville (and spend the day in Seville)
    (:action travel_munich_seville
        :parameters (?td_current - trip_day ?td_next - trip_day
                     ?sc_seville_current - stay_count ?sc_seville_next - stay_count)
        :precondition (and
            (current_trip_day ?td_current)
            (at_city munich)
            (next_trip_day ?td_current ?td_next)
            (direct_flight munich seville)
            (days_in_seville ?sc_seville_current)
            (next_stay_count ?sc_seville_current ?sc_seville_next)
            (not (days_in_seville stay_count_6)) ; Cannot travel to Seville if max days (6) already spent there
        )
        :effect (and
            (not (current_trip_day ?td_current))
            (current_trip_day ?td_next)
            (not (at_city munich))
            (at_city seville)
            (not (days_in_seville ?sc_seville_current))
            (days_in_seville ?sc_seville_next)
        )
    )

    ;; Travel from Munich to Tallinn (and spend the day in Tallinn)
    (:action travel_munich_tallinn
        :parameters (?td_current - trip_day ?td_next - trip_day
                     ?sc_tallinn_current - stay_count ?sc_tallinn_next - stay_count)
        :precondition (and
            (current_trip_day ?td_current)
            (at_city munich)
            (next_trip_day ?td_current ?td_next)
            (direct_flight munich tallinn)
            (days_in_tallinn ?sc_tallinn_current)
            (next_stay_count ?sc_tallinn_current ?sc_tallinn_next)
            (not (days_in_tallinn stay_count_2)) ; Cannot travel to Tallinn if max days (2) already spent there
        )
        :effect (and
            (not (current_trip_day ?td_current))
            (current_trip_day ?td_next)
            (not (at_city munich))
            (at_city tallinn)
            (not (days_in_tallinn ?sc_tallinn_current))
            (days_in_tallinn ?sc_tallinn_next)
        )
    )

    ;; Travel from Tallinn to Munich (and spend the day in Munich)
    (:action travel_tallinn_munich
        :parameters (?td_current - trip_day ?td_next - trip_day
                     ?sc_munich_current - stay_count ?sc_munich_next - stay_count)
        :precondition (and
            (current_trip_day ?td_current)
            (at_city tallinn)
            (next_trip_day ?td_current ?td_next)
            (direct_flight tallinn munich)
            (days_in_munich ?sc_munich_current)
            (next_stay_count ?sc_munich_current ?sc_munich_next)
            (not (days_in_munich stay_count_4)) ; Cannot travel to Munich if max days (4) already spent there
        )
        :effect (and
            (not (current_trip_day ?td_current))
            (current_trip_day ?td_next)
            (not (at_city tallinn))
            (at_city munich)
            (not (days_in_munich ?sc_munich_current))
            (days_in_munich ?sc_munich_next)
        )
    )
)