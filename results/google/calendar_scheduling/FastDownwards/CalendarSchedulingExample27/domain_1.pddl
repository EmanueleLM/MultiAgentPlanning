(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time-slot
    )
    (:predicates
        (available ?t - time-slot)
        (current-slot ?t - time-slot)
        (succeeds ?t1 ?t2 - time-slot)
        (meeting-scheduled)
    )

    ;; Action 1: Schedule the meeting
    ;; This action is only possible if the current slot is available.
    ;; Since the solver minimizes steps, it will choose this action as soon as possible, ensuring optimality (earliest time).
    (define (action schedule-meeting)
        :parameters (?t - time-slot)
        :precondition (and
            (current-slot ?t)
            (available ?t)
            (not (meeting-scheduled))
        )
        :effect (meeting-scheduled)
    )

    ;; Action 2: Advance time (Skip)
    ;; This action is only permitted if the current slot is UNAVAILABLE, forcing progression to the next time window.
    (define (action advance-time)
        :parameters (?t_current ?t_next - time-slot)
        :precondition (and
            (current-slot ?t_current)
            (succeeds ?t_current ?t_next)
            (not (available ?t_current))
            (not (meeting-scheduled))
        )
        :effect (and
            (not (current-slot ?t_current))
            (current-slot ?t_next)
        )
    )
)