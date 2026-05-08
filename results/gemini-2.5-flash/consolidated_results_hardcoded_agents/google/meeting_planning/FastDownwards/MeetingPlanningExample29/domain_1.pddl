(define (domain MeetingPlanningExample29)
    (:requirements :strips :typing :negative-preconditions :numeric-fluents)
    (:types location)
    (:predicates
        (at ?l - location)
        (is-meeting)
    )
    (:functions
        (current-time)
        (meeting-start-time)
        (meeting-duration-achieved)
    )

    (:constants
        sd - location ; Sunset District
        ha - location ; Haight-Ashbury
    )

    ;; TRAVEL ACTIONS (15 minutes constant travel time)

    (:action travel_sd_ha
        :parameters ()
        :precondition (and
            (at sd)
            (not (at ha))
        )
        :effect (and
            (not (at sd))
            (at ha)
            (increase (current-time) 15)
        )
    )

    (:action travel_ha_sd
        :parameters ()
        :precondition (and
            (at ha)
            (not (at sd))
        )
        :effect (and
            (not (at ha))
            (at sd)
            (increase (current-time) 15)
        )
    )

    ;; WAITING ACTION
    ; Nancy is available at 1170 (7:30 PM). Allows time jump for long waiting periods.
    (:action wait_until_nancy_available
        :parameters ()
        :precondition (and
            (at ha)
            (< (current-time) 1170)
        )
        :effect (and
            (assign (current-time) 1170)
        )
    )

    ;; MEETING ACTIONS (Nancy at HA, 1170 to 1305. Min duration 75)

    (:action start_meeting_nancy
        :parameters ()
        :precondition (and
            (at ha)
            (not (is-meeting))
            (>= (current-time) 1170)
            ; Latest start time for guaranteed 75 min meeting: 1305 - 75 = 1230.
            (<= (current-time) 1230) 
        )
        :effect (and
            (is-meeting)
            (assign (meeting-start-time) (current-time))
        )
    )

    ; Ends the meeting by jumping time to 1305 (end of availability) for maximization.
    (:action end_meeting_nancy
        :parameters ()
        :precondition (and
            (is-meeting)
            ; Check feasibility: 1305 must be later than T_start + 75
            (>= 1305 (+ (meeting-start-time) 75))
        )
        :effect (and
            (not (is-meeting))
            ; Time jumps to the end of the opportunity window
            (assign (current-time) 1305) 
            (assign (meeting-duration-achieved) (- 1305 (meeting-start-time)))
        )
    )
)