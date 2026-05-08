(define (domain calendar_scheduling)
    (:requirements :strips :typing)
    (:types person time)
    (:predicates
        (free ?p - person ?t1 - time ?t2 - time)
        (next ?t1 - time ?t2 - time)
        (meeting_scheduled)
    )

    (:action schedule_1hr_meeting
        :parameters (?t1 - time ?t2 - time ?t3 - time)
        :precondition (and
            (next ?t1 ?t2)
            (next ?t2 ?t3)
            (free bobby ?t1 ?t2)
            (free bobby ?t2 ?t3)
            (free scott ?t1 ?t2)
            (free scott ?t2 ?t3)
            (free kimberly ?t1 ?t2)
            (free kimberly ?t2 ?t3)
        )
        :effect (and
            (meeting_scheduled)
        )
    )
)