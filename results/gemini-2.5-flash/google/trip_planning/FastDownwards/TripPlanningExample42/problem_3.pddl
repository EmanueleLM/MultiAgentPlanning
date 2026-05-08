(define (problem trip_planning_example42)
    (:domain trip_planning_domain)
    (:objects
        paris nice mykonos - city
        d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - trip_day
        p0 p1 p2 p3 p4 - paris_day_count
        m0 m1 m2 m3 m4 - mykonos_day_count
        n0 n1 n2 n3 n4 n5 - nice_day_count
    )

    (:init
        (at paris)
        (current_day d0)
        (has_spent_days_in_paris p0)
        (has_spent_days_in_mykonos m0)
        (has_spent_days_in_nice n0)
        (not (friends_met))
        (not (visited paris))
        (not (visited mykonos))
        (not (visited nice))

        (next_day d0 d1)
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)
        (next_day d8 d9)
        (next_day d9 d10)

        (next_paris_day_count p0 p1)
        (next_paris_day_count p1 p2)
        (next_paris_day_count p2 p3)
        (next_paris_day_count p3 p4)

        (next_mykonos_day_count m0 m1)
        (next_mykonos_day_count m1 m2)
        (next_mykonos_day_count m2 m3)
        (next_mykonos_day_count m3 m4)

        (next_nice_day_count n0 n1)
        (next_nice_day_count n1 n2)
        (next_nice_day_count n2 n3)
        (next_nice_day_count n3 n4)
        (next_nice_day_count n4 n5)

        (direct_flight paris nice)
        (direct_flight nice paris)
        (direct_flight nice mykonos)
        (direct_flight mykonos nice)

        (is_meeting_window_day d0)
        (is_meeting_window_day d1)
        (is_meeting_window_day d2)
        (is_meeting_window_day d3)
    )

    (:goal (and
        (current_day d10)
        (has_spent_days_in_paris p4)
        (has_spent_days_in_mykonos m4)
        (has_spent_days_in_nice n5)
        (friends_met)
        (visited paris)
        (visited mykonos)
        (visited nice)
    ))
)