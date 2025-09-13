(define (problem MeetingScheduling)
    (:domain MeetingScheduler)

    (:objects
        arthur michael samantha - participant
        slot-9-10 slot-10-11 slot-11-12 slot-12-13 slot-13-14 slot-14-15 slot-15-16 slot-16-17 - time-slot
    )

    (:init
        (during-work-hours slot-9-10)
        (during-work-hours slot-10-11)
        (during-work-hours slot-11-12)
        (during-work-hours slot-12-13)
        (during-work-hours slot-13-14)
        (during-work-hours slot-14-15)
        (during-work-hours slot-15-16)
        (during-work-hours slot-16-17)

        (needs_meeting arthur)
        (needs_meeting michael)
        (needs_meeting samantha)

        (available arthur slot-9-10)
        (available arthur slot-12-13)
        (available arthur slot-13-14)
        (available arthur slot-14-15)

        (available michael slot-9-10)
        (available michael slot-10-11)
        (available michael slot-11-12)
        (available michael slot-12-13)
        (available michael slot-15-16)

        (available samantha slot-9-10)
        (available samantha slot-11-12)
    )

    (:goal
        (exists (?t - time-slot) 
            (and 
                (meeting_scheduled ?t)
                (available arthur ?t)
                (available michael ?t)
                (available samantha ?t)
            )
        )
    )
)