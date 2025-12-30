(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        time-point - object
        agent - object
    )
    (:constants
        thomas - agent
        dylan - agent
        jerry - agent
    )

    (:predicates
        (next-time ?t1 - time-point ?t2 - time-point)
        (is-available ?a - agent ?t_start - time-point ?t_end - time-point)
        (meeting-scheduled ?t_start - time-point ?t_end - time-point)
        (meeting-found) ; Used to mark goal achievement
    )

    (:functions
        (total-cost)
        (time-value ?t - time-point) ; Used to assign numerical value (index) to time points
    )

    ; Action to schedule a 1-hour meeting (spanning ?t_start, ?t_mid, ?t_end)
    (:action schedule-meeting
        :parameters (?t_start - time-point ?t_mid - time-point ?t_end - time-point)
        :precondition (and
            ; Ensure only one meeting is scheduled (for optimality)
            (not (meeting-found))
            
            ; Duration constraint: 1 hour (2 steps)
            (next-time ?t_start ?t_mid)
            (next-time ?t_mid ?t_end)
            
            ; Availability constraints for all participants
            (is-available thomas ?t_start ?t_end)
            (is-available dylan ?t_start ?t_end)
            (is-available jerry ?t_start ?t_end)
        )
        :effect (and
            (meeting-scheduled ?t_start ?t_end)
            (meeting-found) ; Achieve the goal
            ; Cost: Increase cost by the index of the start time (earlier is cheaper)
            (increase (total-cost) (time-value ?t_start))
        )
    )
)