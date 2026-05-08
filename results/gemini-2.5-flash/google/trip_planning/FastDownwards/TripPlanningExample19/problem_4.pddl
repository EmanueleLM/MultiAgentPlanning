(define (problem trip_planning_example_19_problem)
    (:domain trip_planning_example_19)
    (:objects
        brussels valencia nice - city ; All cities are defined here as objects
        d0 d1 d2 d3 d4 d5 d6 d7 d8 - day
        nsd_none nsd1 nsd2 nsd3 nsd4 nsd5 nsd6 nsd_overflow - nice_stay_day_tracker
    )
    (:init
        ; Initial state for trip
        (current_city brussels) ; Arbitrarily starting in Brussels as no explicit start is given
        (visited brussels) ; The starting city is considered visited
        (current_day d0) ; Start on day 0

        ; Identify 'Nice' city
        (is_nice nice)

        ; Initial state for Nice stay counter
        (nice_day_count_is nsd_none) ; Not in Nice initially

        ; Direct flight routes
        (direct_flight brussels valencia)
        (direct_flight valencia brussels)
        (direct_flight nice brussels)
        (direct_flight brussels nice)

        ; Day sequence for the overall trip (9 days total: d0 to d8)
        (next_day d0 d1)
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)

        ; Sequence for Nice stay day counter
        ; (next_nice_day_count nsd_none nsd1) ; Special transition is handled in travel_from_x_to_nice action
        (next_nice_day_count nsd1 nsd2)
        (next_nice_day_count nsd2 nsd3)
        (next_nice_day_count nsd3 nsd4)
        (next_nice_day_count nsd4 nsd5)
        (next_nice_day_count nsd5 nsd6)
        (next_nice_day_count nsd6 nsd_overflow) ; For days beyond the meeting window

        ; Definition of the meeting window within a Nice stay (Day 1 to Day 6)
        (can_meet_on_this_nice_day nsd1)
        (can_meet_on_this_nice_day nsd2)
        (can_meet_on_this_nice_day nsd3)
        (can_meet_on_this_nice_day nsd4)
        (can_meet_on_this_nice_day nsd5)
        (can_meet_on_this_nice_day nsd6)
    )
    (:goal (and
        (current_day d8) ; Trip must end on the 9th day (d8 if starting at d0)
        (visited brussels)
        (visited valencia)
        (visited nice)
        (friends_met) ; Friends must be met in Nice
    ))
)