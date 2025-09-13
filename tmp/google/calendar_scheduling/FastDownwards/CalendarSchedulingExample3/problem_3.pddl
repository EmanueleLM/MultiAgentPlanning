(define (problem CombinedMeetingScheduling)
    (:domain CombinedMeetingScheduler)

    (:objects
        arthur michael samantha - participant
        slot-9-10 slot-10-11 slot-11-12 slot-12-13 slot-13-14 slot-14-15 slot-15-16 - time-slot
        9 10 11 12 13 14 15 16 17 - hour
    )

    (:init
        ;; Work hours
        (during-work-hours slot-9-10)
        (during-work-hours slot-10-11)
        (during-work-hours slot-11-12)
        (during-work-hours slot-12-13)
        (during-work-hours slot-13-14)
        (during-work-hours slot-14-15)
        (during-work-hours slot-15-16)

        ;; Arthur's availability
        (available arthur slot-9-10)
        (available arthur slot-12-13)
        (available arthur slot-13-14)
        (available arthur slot-14-15)
        (available arthur slot-15-16)

        ;; Michael's availability
        (available_slot slot-9-10)
        (available_slot slot-10-11)
        (available_slot slot-11-12)
        (available_slot slot-15-16)

        ;; Samantha's blocked times
        (blocked samantha 10)
        (blocked samantha 11)
        (blocked samantha 12)
        (blocked samantha 13)
        (blocked samantha 14)
        (blocked samantha 15)
        (blocked samantha 16)

        ;; Define the successor relationship between hours
        (successor 9 10)
        (successor 10 11)
        (successor 11 12)
        (successor 12 13)
        (successor 13 14)
        (successor 14 15)
        (successor 15 16)
        (successor 16 17)
    )

    (:goal
        (exists (?t - time-slot) 
            (meeting_scheduled ?t)
        )
    )
)