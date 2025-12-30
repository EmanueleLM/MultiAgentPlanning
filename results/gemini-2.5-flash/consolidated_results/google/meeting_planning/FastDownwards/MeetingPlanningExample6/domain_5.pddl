(define (domain MeetingPlanning)
    (:requirements :typing :action-costs :durative-actions :numeric-fluents :negative-preconditions)
    (:types
        location
        person
    )

    (:predicates
        (at ?l - location)
    )

    (:functions
        (current_time) ; Minutes elapsed since 9:00 AM (t=0)
        (meeting_time ?p - person) ; Total minutes spent meeting this person
        (total-cost) ; Metric tracking time spent waiting/traveling
    )

    ;; Travel FW to NH (11 minutes)
    (define (durative-action travel_fw_nh)
        :parameters ()
        :duration (= ?duration 11)
        :condition (and
            (at start (at FW))
        )
        :effect (and
            (at end (not (at FW)))
            (at end (at NH))
            (at end (increase (current_time) 11))
            (increase (total-cost) 11)
        )
    )

    ;; Travel NH to FW (11 minutes)
    (define (durative-action travel_nh_fw)
        :parameters ()
        :duration (= ?duration 11)
        :condition (and
            (at start (at NH))
        )
        :effect (and
            (at end (not (at NH)))
            (at end (at FW))
            (at end (increase (current_time) 11))
            (increase (total-cost) 11)
        )
    )

    ;; Meet Kenneth at Nob Hill
    ;; Availability window: T=315 (2:15 PM) to T=645 (7:45 PM)
    (define (durative-action meet_kenneth_at_nh)
        :parameters ()
        :duration (?d)
        :condition (and
            (at start (at NH))
            ; Must start during or after availability begins (315 min)
            (at start (>= (current_time) 315)) 
            ; Must end before availability concludes (645 min)
            (at end (<= (current_time) 645))
            (> ?d 0)
        )
        :effect (and
            (at end (increase (current_time) ?d))
            (at end (increase (meeting_time Kenneth) ?d))
            (increase (total-cost) 0) ; Meeting time does not count towards cost minimization (we minimize travel/wait time)
        )
    )

    ;; Wait action (to bridge gaps and reach optimal start time)
    (define (durative-action wait)
        :parameters (?l - location)
        :duration (?d)
        :condition (and
            (at start (at ?l))
            (> ?d 0)
        )
        :effect (and
            (at end (increase (current_time) ?d))
            (increase (total-cost) ?d) ; Waiting adds to cost
        )
    )
)