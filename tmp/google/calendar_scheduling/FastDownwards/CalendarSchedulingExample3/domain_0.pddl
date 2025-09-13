(define (domain CombinedMeetingScheduler)
    (:requirements :strips :typing)
    (:types participant time-slot hour)
    
    (:predicates
        (available ?p - participant ?t - time-slot)
        (during-work-hours ?t - time-slot)
        (blocked ?h - hour)
        (meeting_scheduled ?t - time-slot)
    )

    (:action participant1_schedule_meeting
        :parameters (?t - time-slot)
        :precondition (and
            (during-work-hours ?t)
            (available Arthur ?t)
            (not (meeting_scheduled ?t))
        )
        :effect (meeting_scheduled ?t)
    )

    (:action participant2_schedule_meeting
        :parameters (?s - time-slot)
        :precondition (and
            (available_slot ?s)
            (not (meeting_scheduled ?s))
        )
        :effect (meeting_scheduled ?s)
    )

    (:action participant3_schedule_meeting
        :parameters (?start - hour)
        :precondition (and
            (not (blocked ?start))
            (not (blocked (+ ?start 1)))
        )
        :effect (meeting_scheduled ?start)
    )
)