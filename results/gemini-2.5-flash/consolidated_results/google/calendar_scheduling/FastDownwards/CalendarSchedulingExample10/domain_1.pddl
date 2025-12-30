(define (domain calendar-scheduling)
    (:requirements :strips :typing :action-costs :negative-preconditions :equality)
    (:types
        time-slot - object
        person - object
    )
    (:predicates
        (person-available ?p - person ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
    )
    (:functions
        (total-cost)
    )

    (:action schedule-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (person-available diana ?t)
            (person-available ethan ?t)
            (person-available janet ?t)
            ; Ensure only one meeting is scheduled (optional, but good practice for unique solutions)
            (not (exists (?t_scheduled - time-slot) (and (meeting-scheduled ?t_scheduled) (not (= ?t_scheduled ?t)))))
        )
        :effect (and
            (meeting-scheduled ?t)
            (increase (total-cost) 1)
        )
    )
)