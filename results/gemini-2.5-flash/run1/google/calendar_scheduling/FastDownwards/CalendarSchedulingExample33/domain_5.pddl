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
        (person_busy ?p - person ?t - time_slot)
        (meeting_scheduled ?m - meeting ?t - time_slot)
        (meeting_unscheduled ?m - meeting)
        (person_prefers_to_avoid ?p - person ?t - time_slot)
    )
    (:functions
        (total-cost)
    )

    (:action schedule_meeting_at_preferred_time
        :parameters (?t - time_slot)
        :precondition (and
            (meeting_unscheduled meeting1)
            (not (person_busy lisa ?t))
            (not (person_busy bobby ?t))
            (not (person_busy randy ?t))
            (not (person_prefers_to_avoid bobby ?t))
        )
        :effect (and
            (meeting_scheduled meeting1 ?t)
            (not (meeting_unscheduled meeting1))
            (increase (total-cost) 0)
        )
    )

    (:action schedule_meeting_at_avoided_time
        :parameters (?t - time_slot)
        :precondition (and
            (meeting_unscheduled meeting1)
            (not (person_busy lisa ?t))
            (not (person_busy bobby ?t))
            (not (person_busy randy ?t))
            (person_prefers_to_avoid bobby ?t)
        )
        :effect (and
            (meeting_scheduled meeting1 ?t)
            (not (meeting_unscheduled meeting1))
            (increase (total-cost) 1)
        )
    )