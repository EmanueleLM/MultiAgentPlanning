(define (domain MeetingPlanningExample29)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        location 
        time_point
    )
    (:predicates
        (at ?l - location)
        (ready_at ?t - time_point)
        (meeting_duration_satisfied)
    )
    (:functions
        (total-meeting-time)
    )

    ;; 1. Travel from Sunset (T540 / 9:00AM) to Haight (T555 / 9:15AM). Duration 15 min.
    (:action travel_sunset_haight
        :parameters ()
        :precondition (and
            (at sunset)
            (ready_at T540)
        )
        :effect (and
            (not (at sunset))
            (at haight)
            (not (ready_at T540))
            (ready_at T555)
        )
    )

    ;; 2. Wait at Haight (T555 -> T1170 / 7:30PM). Duration 615 min.
    (:action wait_for_nancy
        :parameters ()
        :precondition (and
            (at haight)
            (ready_at T555)
        )
        :effect (and
            (not (ready_at T555))
            (ready_at T1170)
        )
    )

    ;; 3. Meet Nancy (Required minimum 75 min). T1170 -> T1245 (8:45PM).
    (:action meet_nancy_required_75
        :parameters ()
        :precondition (and
            (at haight)
            (ready_at T1170)
            (not (meeting_duration_satisfied))
        )
        :effect (and
            (not (ready_at T1170))
            (ready_at T1245)
            (meeting_duration_satisfied)
            (increase (total-meeting-time) 75)
        )
    )

    ;; 4. Meet Nancy (Optional remainder 60 min). T1245 -> T1305 (9:45PM).
    (:action meet_nancy_optional_60
        :parameters ()
        :precondition (and
            (at haight)
            (ready_at T1245)
        )
        :effect (and
            (not (ready_at T1245))
            (ready_at T1305)
            (increase (total-meeting-time) 60)
        )
    )
)