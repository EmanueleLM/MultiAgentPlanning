(define (problem trip_planning_example42)
    (:domain trip_planning_domain)
    (:objects
        paris nice mykonos - city
        td0 td1 td2 td3 td4 td5 td6 td7 td8 td9 td10 - trip_day
        pdc0 pdc1 pdc2 pdc3 pdc4 - paris_day_count
        mdc0 mdc1 mdc2 mdc3 mdc4 - mykonos_day_count
        ndc0 ndc1 ndc2 ndc3 ndc4 ndc5 - nice_day_count
    )

    (:init
        ; Agent's initial location
        (at paris)

        ; Current trip day
        (current_trip_day td0)

        ; Initial day counts for cities
        (days_in_paris pdc0)
        (days_in_mykonos mdc0)
        (days_in_nice ndc0)

        ; Friends not met yet
        (not (friends_met_in_paris))

        ; Cities not visited yet
        (not (visited paris))
        (not (visited mykonos))
        (not (visited nice))

        ; Define trip day sequence (11 days total: td0 to td10)
        (next_trip_day td0 td1)
        (next_trip_day td1 td2)
        (next_trip_day td2 td3)
        (next_trip_day td3 td4)
        (next_trip_day td4 td5)
        (next_trip_day td5 td6)
        (next_trip_day td6 td7)
        (next_trip_day td7 td8)
        (next_trip_day td8 td9)
        (next_trip_day td9 td10)

        ; Define Paris day count sequence
        (next_paris_day_count pdc0 pdc1)
        (next_paris_day_count pdc1 pdc2)
        (next_paris_day_count pdc2 pdc3)
        (next_paris_day_count pdc3 pdc4)

        ; Define Mykonos day count sequence
        (next_mykonos_day_count mdc0 mdc1)
        (next_mykonos_day_count mdc1 mdc2)
        (next_mykonos_day_count mdc2 mdc3)
        (next_mykonos_day_count mdc3 mdc4)

        ; Define Nice day count sequence
        (next_nice_day_count ndc0 ndc1)
        (next_nice_day_count ndc1 ndc2)
        (next_nice_day_count ndc2 ndc3)
        (next_nice_day_count ndc3 ndc4)
        (next_nice_day_count ndc4 ndc5)

        ; Define direct flights
        (direct_flight paris nice)
        (direct_flight nice paris)
        (direct_flight nice mykonos)
        (direct_flight mykonos nice)

        ; Define Paris meeting window (human day 1 to 4 corresponds to trip_day td0 to td3)
        (in_paris_meeting_window td0)
        (in_paris_meeting_window td1)
        (in_paris_meeting_window td2)
        (in_paris_meeting_window td3)
    )

    (:goal (and
        ; Total trip duration of 11 days (current_trip_day td10 means 11 steps completed)
        (current_trip_day td10)
        ; Spend 4 days in Paris
        (days_in_paris pdc4)
        ; Visit Mykonos for 4 days
        (days_in_mykonos mdc4)
        ; Stay in Nice for 5 days
        (days_in_nice ndc5)
        ; Meet friends in Paris
        (friends_met_in_paris)
        ; All cities visited
        (visited paris)
        (visited mykonos)
        (visited nice)
    ))
)