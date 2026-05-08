(define (problem trip_planning_example46)
    (:domain trip_planning_example46)
    (:objects
        seville manchester stockholm - city
        d01 d02 d03 d04 d05 d06 d07 d08 d09 d10 d11 - day
        s0 s1 s2 s3 s4 s5 - city_stay_count_marker
        st0 st1 st2 st3 - stockholm_stay_count_marker
    )
    (:init
        ; Initial agent location (assumed 'manchester' as not specified in problem, but conflicts with conference on day 1)
        (at manchester)

        ; Current day
        (current_day d01)

        ; Day sequence
        (next_day d01 d02)
        (next_day d02 d03)
        (next_day d03 d04)
        (next_day d04 d05)
        (next_day d05 d06)
        (next_day d06 d07)
        (next_day d07 d08)
        (next_day d08 d09)
        (next_day d09 d10)
        (next_day d10 d11)

        ; Direct flights (bidirectional)
        (direct_flight manchester seville)
        (direct_flight seville manchester)
        (direct_flight stockholm manchester)
        (direct_flight manchester stockholm)

        ; Initial stay counts
        (seville_days_stayed s0)
        (manchester_days_stayed s0)
        (stockholm_days_stayed st0)

        ; Stay count marker sequence for cities requiring up to 5 days
        (next_city_stay_marker s0 s1)
        (next_city_stay_marker s1 s2)
        (next_city_stay_marker s2 s3)
        (next_city_stay_marker s3 s4)
        (next_city_stay_marker s4 s5)

        ; Stockholm stay count marker sequence (up to 3 days for Stockholm)
        (next_stockholm_stay_marker st0 st1)
        (next_stockholm_stay_marker st1 st2)
        (next_stockholm_stay_marker st2 st3)

        ; Conference specific days
        (is_conference_day d01)
        (is_conference_day d03)

        ; Initial conference attendance status
        (not (conference_d01_attended))
        (not (conference_d03_attended))
    )
    (:goal (and
        ; Trip ends on day 11
        (current_day d11)
        
        ; Required stay durations
        (seville_days_stayed s5)
        (manchester_days_stayed s5)
        (stockholm_days_stayed st3)
        
        ; Conference attendance requirements
        (conference_d01_attended)
        (conference_d03_attended)
    ))
)