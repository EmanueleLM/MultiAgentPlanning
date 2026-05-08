(define (domain calendar_scheduling_domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        meeting
        time_slot
    )
    (:constants
        lisa bobby randy - person
        meeting1 - meeting
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:predicates
        (person_at_time ?p - person ?t - time_slot)
        (meeting_at_time ?m - meeting ?t - time_slot)
        (unassigned_meeting ?m - meeting)
        (prefers_to_avoid ?p - person ?t - time_slot)
    )
    (:functions
        (total_cost)
    )

    (:action schedule_meeting_at_preferred_time
        :parameters (?t - time_slot)
        :precondition (and
            (unassigned_meeting meeting1)
            (not (person_at_time lisa ?t))
            (not (person_at_time bobby ?t))
            (not (person_at_time randy ?t))
            (not (prefers_to_avoid bobby ?t)) ; This time slot is not preferred to be avoided by Bobby
        )
        :effect (and
            (meeting_at_time meeting1 ?t)
            (not (unassigned_meeting meeting1))
            (person_at_time lisa ?t)
            (person_at_time bobby ?t)
            (person_at_time randy ?t)
            (increase (total_cost) 0) ; Cost is 0 for this action
        )
    )

    (:action schedule_meeting_at_avoided_time
        :parameters (?t - time_slot)
        :precondition (and
            (unassigned_meeting meeting1)
            (not (person_at_time lisa ?t))
            (not (person_at_time bobby ?t))
            (not (person_at_time randy ?t))
            (prefers_to_avoid bobby ?t) ; This time slot is preferred to be avoided by Bobby
        )
        :effect (and
            (meeting_at_time meeting1 ?t)
            (not (unassigned_meeting meeting1))
            (person_at_time lisa ?t)
            (person_at_time bobby ?t)
            (person_at_time randy ?t)
            (increase (total_cost) 1) ; Cost is 1 for this action
        )
    )
)