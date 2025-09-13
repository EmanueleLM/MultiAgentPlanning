(define (domain multi-agent-meeting-scheduling)
    (:requirements :strips :typing)

    (:types person time)

    (:constants
        Adam Jerry Matthew - person
        time09h00 time09h30 time10h00 time10h30 time11h00 time11h30
        time12h00 time12h30 time13h00 time13h30 time14h00 time14h30
        time15h00 time15h30 time16h00 time16h30 time17h00 - time)

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