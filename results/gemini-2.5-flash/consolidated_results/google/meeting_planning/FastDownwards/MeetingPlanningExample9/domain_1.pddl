(define (domain meeting-planning-temporal)
    (:requirements :typing :durative-actions :numeric-fluents)
    (:types
        location
    )

    (:predicates
        (at ?l - location)
    )

    (:functions
        (current_time)
        (travel_time ?from ?to - location)
        (mary_meeting_duration)
        (mary_availability_start)
        (mary_availability_end)
        (required_meeting_duration)
    )

    ; Action 1: Travel between locations
    (:durative-action travel
        :parameters (?from - location ?to - location)
        :duration (= ?duration (travel_time ?from ?to))
        :condition (and
            (at start (at ?from))
        )
        :effect (and
            (at start (not (at ?from)))
            (at end (at ?to))
            (at end (increase (current_time) ?duration))
        )
    )

    ; Action 2: Meet Mary at Nob Hill
    ; Enforces minimum duration (75 min) and time window (12:00 PM to 4:15 PM)
    (:durative-action meet_mary
        :parameters ()
        :duration (and
            (>= ?duration (required_meeting_duration))
        )
        :condition (and
            (at start (at Nob_Hill))
            ; Start time constraint: >= 720 (12:00 PM)
            (at start (>= (current_time) (mary_availability_start)))
            ; End time constraint: current_time + ?duration <= 975 (4:15 PM)
            (at start (<= (+ (current_time) ?duration) (mary_availability_end)))
        )
        :effect (and
            (at end (increase (current_time) ?duration))
            (at end (increase (mary_meeting_duration) ?duration))
        )
    )

    ; Action 3: Wait action (used to advance time when arriving early)
    (:durative-action wait
        :parameters (?l - location)
        :duration (?duration)
        :condition (and
            (at start (at ?l))
            (at start (>= ?duration 0)) ; Duration must be non-negative
        )
        :effect (and
            (at end (increase (current_time) ?duration))
        )
    )
)