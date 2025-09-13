(define (problem CombinedMeetingScheduling)
    (:domain CombinedMeetingScheduler)

    (:objects
        arthur michael samantha - participant
        slot-9-10 slot-11-12 slot-12-13 slot-13-14 - time-slot
    )

    (:init
        ;; Work hours
        (during-work-hours slot-9-10)
        (during-work-hours slot-11-12)
        (during-work-hours slot-12-13)
        (during-work-hours slot-13-14)

        ;; Arthur's availability
        (available arthur slot-12-13)
        (available arthur slot-13-14)

        ;; Michael's availability
        (available michael slot-11-12)
        (available michael slot-12-13)

        ;; Samantha's availability
        (available samantha slot-9-10)
        (available samantha slot-11-12)

    )

    (:goal
        (exists (?t - time-slot) 
            (meeting_scheduled ?t)
        )
    )
)