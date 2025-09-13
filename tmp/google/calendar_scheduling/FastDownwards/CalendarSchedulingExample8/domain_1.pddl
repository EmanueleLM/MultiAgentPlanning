(define (domain multi-agent-meeting-scheduling)
    (:requirements :strips :typing)

    (:types person time)

    (:constants
        Adam Jerry Matthew - person
        time09:00 time09:30 time10:00 time10:30 time11:00 time11:30
        time12:00 time12:30 time13:00 time13:30 time14:00 time14:30
        time15:00 time15:30 time16:00 time16:30 time17:00 - time)

    (:predicates
        (available ?p - person ?t - time)
        (meeting-scheduled ?t - time)
        (before ?t1 ?t2 - time))

    (:action schedule-meeting
        :parameters (?t - time)
        :precondition (and
            (available Adam ?t)
            (available Jerry ?t)
            (available Matthew ?t)
            (not (meeting-scheduled ?t)))
        :effect (meeting-scheduled ?t))
)