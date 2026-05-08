(define (domain MeetingPlanningExample29)
    (:requirements :strips :typing :negative-preconditions)
    (:types location)
    (:predicates
        (at ?l - location)
        (is-meeting)
        (t-540-start) ; 9:00 AM (Traveler starts)
        (t-555-arrived-ha) ; 9:15 AM (Traveler arrives Haight-Ashbury)
        (t-1170-ready-to-meet) ; 7:30 PM (Nancy available)
        (t-1305-finished-meeting) ; 9:45 PM (Nancy leaves, end of window)
        (met-for-min-75) ; Goal proxy for achieving minimum duration
    )

    (:constants
        sd - location ; Sunset District
        ha - location ; Haight-Ashbury
    )

    ;; 1. TRAVEL SD -> HA (540 -> 555, Duration 15 min)
    (:action travel_sd_ha
        :parameters ()
        :precondition (and
            (at sd)
            (t-540-start)
        )
        :effect (and
            (not (at sd))
            (at ha)
            (not (t-540-start))
            (t-555-arrived-ha)
        )
    )

    ;; 2. WAIT at HA (555 -> 1170)
    (:action wait_for_nancy_window
        :parameters ()
        :precondition (and
            (at ha)
            (t-555-arrived-ha)
        )
        :effect (and
            (not (t-555-arrived-ha))
            (t-1170-ready-to-meet)
        )
    )

    ;; 3. START MEETING (at 1170)
    (:action start_meeting_nancy
        :parameters ()
        :precondition (and
            (at ha)
            (t-1170-ready-to-meet)
            (not (is-meeting))
        )
        :effect (is-meeting)
    )

    ;; 4. END MEETING (1170 -> 1305, Duration 135 min, maximizing time)
    ; This action implicitly models a meeting ending at T=1305, achieving 135 minutes, thus satisfying the minimum 75 minutes requirement optimally.
    (:action end_meeting_nancy_max
        :parameters ()
        :precondition (is-meeting)
        :effect (and
            (not (is-meeting))
            (not (t-1170-ready-to-meet)) 
            (t-1305-finished-meeting)
            (met-for-min-75)
        )
    )
)