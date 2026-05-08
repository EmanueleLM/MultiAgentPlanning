(define (domain meeting-planning)
    (:requirements :strips :typing :durative-actions :fluents :negative-preconditions)

    (:types 
        location
    )

    (:predicates
        (at ?l - location)
        (arrived_rh)        ; Arrived at Russian Hill (T=547)
        (ronald_ready)      ; Ronald is available (T=915, 3:15 PM)
        (min_duration_met)  ; Met for >= 105 minutes (T=1020)
        (meeting_maximized) ; Meeting ended at 9:30 PM (T=1170)
    )
    
    (:fluents
        (meeting_time) ; Total time spent meeting Ronald (in minutes)
    )

    ; Phase 1: Travel Chinatown -> Russian Hill (Duration: 7 min)
    ; Time progression: T_start + 7
    (:durative-action travel_c_rh
        :parameters ()
        :duration (= ?duration 7)
        :condition (at start (at chinatown))
        :effect (and
            (at end (at russian_hill))
            (at end (not (at chinatown)))
            (at end (arrived_rh))
        )
    )

    ; Phase 2: Wait for Ronald (Duration: 368 min = 915 min - 547 min)
    ; Time progression: T_start + 7 + 368 = 915
    (:durative-action wait_for_ronald
        :parameters ()
        :duration (= ?duration 368)
        :condition (at start (and (at russian_hill) (arrived_rh)))
        :effect (at end (ronald_ready))
    )

    ; Phase 3: Meet Mandatory Minimum (Duration: 105 min)
    ; Time progression: T_start + 7 + 368 + 105 = 1020
    (:durative-action meet_ronald_min
        :parameters ()
        :duration (= ?duration 105)
        :condition (at start (and (at russian_hill) (ronald_ready)))
        :effect (and
            (at end (min_duration_met))
            (at end (increase (meeting_time) ?duration))
        )
    )

    ; Phase 4: Meet Extra Time (Maximization) (Duration: 150 min = 255 - 105)
    ; Time progression: T_start + 1020 + 150 = 1170 (9:30 PM deadline reached)
    (:durative-action meet_ronald_max_extra
        :parameters ()
        :duration (= ?duration 150)
        :condition (at start (min_duration_met))
        :effect (and
            (at end (meeting_maximized))
            (at end (increase (meeting_time) ?duration))
        )
    )

    ; Phase 5 (Optional): Travel Russian Hill -> Chinatown (Duration: 9 min)
    (:durative-action travel_rh_c
        :parameters ()
        :duration (= ?duration 9)
        :condition (at start (and (at russian_hill) (meeting_maximized)))
        :effect (and
            (at end (at chinatown))
            (at end (not (at russian_hill)))
        )
    )
)