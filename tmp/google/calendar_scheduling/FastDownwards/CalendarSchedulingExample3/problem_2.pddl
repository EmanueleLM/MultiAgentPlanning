(define (problem CombinedMeetingScheduling)
    (:domain CombinedMeetingScheduler)

    (:objects
        Arthur - participant
        slot-9-10 slot-10-11 slot-11-12 slot-12-13 slot-13-14 slot-14-15 slot-15-16 - time-slot
        9 10 11 12 13 14 15 16 17 - hour
    )

    (:init
        ;; Participant 1's information
        (during-work-hours slot-9-10)
        (during-work-hours slot-10-11)
        (during-work-hours slot-11-12)
        (during-work-hours slot-12-13)
        (during-work-hours slot-13-14)
        (during-work-hours slot-14-15)
        (during-work-hours slot-15-16)
        (available Arthur slot-9-10)
        (available Arthur slot-12-13)
        (available Arthur slot-13-14)
        (available Arthur slot-14-15)
        (available Arthur slot-15-16)

        ;; Participant 2's free slots
        (available_slot slot-9-10)
        (available_slot slot-10-11)
        (available_slot slot-11-12)
        (available_slot slot-15-16)

        ;; Participant 3's blocked times
        (blocked 10)
        (blocked 11)
        (blocked 12)
        (blocked 13)
        (blocked 14)
        (blocked 15)
        (blocked 16)

        ;; Participant 3's available times
        (available_time 9)
        (available_time 17)

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
        (exists (?t - time-slot) (meeting_scheduled ?t))
    )
)