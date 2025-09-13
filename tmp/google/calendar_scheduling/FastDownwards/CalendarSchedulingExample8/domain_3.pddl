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
        (meeting-scheduled-start ?t - time)
        (meeting-scheduled-mid ?t - time)
        (meeting-scheduled-end ?t - time)
        (before ?t1 ?t2 - time))

    (:action schedule-meeting-part1
        :parameters (?t - time)
        :precondition (and
            (available Adam ?t)
            (available Jerry ?t)
            (available Matthew ?t)
            (not (meeting-scheduled-start ?t)))
        :effect (meeting-scheduled-start ?t))

    (:action schedule-meeting-part2
        :parameters (?t - time ?t-next - time)
        :precondition (and
            (meeting-scheduled-start ?t)
            (before ?t ?t-next)
            (not (meeting-scheduled-mid ?t-next)))
        :effect (meeting-scheduled-mid ?t-next))

    (:action schedule-meeting-part3
        :parameters (?t - time ?t-next - time ?t-next2 - time)
        :precondition (and
            (meeting-scheduled-mid ?t)
            (before ?t ?t-next)
            (before ?t-next ?t-next2)
            (not (meeting-scheduled-end ?t-next2)))
        :effect (meeting-scheduled-end ?t-next2))
)