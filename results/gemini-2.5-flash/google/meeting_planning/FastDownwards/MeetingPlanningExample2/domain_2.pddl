(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types
        person
        location
        time-point
    )

    (:constants
        traveler - person
        jessica - person
        haight-ashbury sunset-district - location
        tp-9am tp-3pm tp-3_15pm tp-4_45pm - time-point ; Discretized key time points
    )

    (:predicates
        (at ?p - person ?l - location)
        (meeting-completed)
        (traveler-at-destination-for-meeting) ; Helper predicate for readiness at meeting location
        (current-time-is ?tp - time-point)     ; Tracks the current discrete time point
    )

    (:action wait-for-departure
        :parameters ()
        :precondition (and
            (at traveler haight-ashbury)
            (current-time-is tp-9am) ; Traveler must be at Haight-Ashbury at 9:00 AM
        )
        :effect (and
            (not (current-time-is tp-9am))
            (current-time-is tp-3pm) ; Advances time from 9:00 AM (540 min) to 3:00 PM (900 min)
        )
        :cost 360 ; Waiting duration: 900 - 540 = 360 minutes
    )

    (:action travel-to-sunset-district
        :parameters ()
        :precondition (and
            (at traveler haight-ashbury)
            (current-time-is tp-3pm) ; Traveler must depart Haight-Ashbury at 3:00 PM
        )
        :effect (and
            (not (at traveler haight-ashbury))
            (at traveler sunset-district)
            (not (current-time-is tp-3pm))
            (current-time-is tp-3_15pm) ; Arrives at Sunset District at 3:15 PM (3:00 PM + 15 min travel)
            (traveler-at-destination-for-meeting)
        )
        :cost 15 ; Travel time: 15 minutes
    )

    (:action meet-jessica
        :parameters ()
        :precondition (and
            (traveler-at-destination-for-meeting) ; Traveler must have arrived and be ready
            (at traveler sunset-district)         ; Traveler must be at the meeting location
            (current-time-is tp-3_15pm)           ; Meeting must start at 3:15 PM (Jessica's availability start)
            (not (meeting-completed))             ; Ensure meeting has not already happened
        )
        :effect (and
            (not (current-time-is tp-3_15pm))
            (current-time-is tp-4_45pm) ; Meeting lasts 90 minutes (3:15 PM + 90 min = 4:45 PM)
            (meeting-completed)
        )
        :cost 90 ; Meeting duration: 90 minutes
    )
)