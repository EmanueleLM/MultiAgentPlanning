(define (domain meeting_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types participant timeslot)
    (:predicates 
        (scheduled ?p - participant ?t - timeslot)
        (available ?p - participant ?t - timeslot)
        (adjacent ?t1 ?t2 - timeslot)
        (slot_selected ?t - timeslot)
    )
    
    (:action select_slot
        :parameters (?t1 ?t2 - timeslot)
        :precondition (and 
            (adjacent ?t1 ?t2)
            (available jacob ?t1) (available jacob ?t2)
            (available gabriel ?t1) (available gabriel ?t2)
            (available matthew ?t1) (available matthew ?t2)
        )
        :effect (and (slot_selected ?t1) (slot_selected ?t2))
    )
    
    (:action mark_available
        :parameters (?p - participant ?t - timeslot)
        :precondition (not (scheduled ?p ?t))
        :effect (available ?p ?t)
    )
)