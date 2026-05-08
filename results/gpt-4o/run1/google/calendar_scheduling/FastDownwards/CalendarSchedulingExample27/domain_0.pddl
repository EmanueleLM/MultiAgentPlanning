(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates 
    (busy ?p - participant ?t_start - time_slot ?t_end - time_slot)
    (connected ?t1 - time_slot ?t2 - time_slot)
    (try_slot ?p - participant ?t_start - time_slot ?t_end - time_slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant 
                  ?t_start - time_slot ?t_30 - time_slot ?t_end - time_slot)
    :precondition (and 
                   (connected ?t_start ?t_30)
                   (connected ?t_30 ?t_end)
                   (try_slot ?p1 ?t_start ?t_end)
                   (try_slot ?p2 ?t_start ?t_end)
                   (try_slot ?p3 ?t_start ?t_end)
                   (not (meeting_scheduled)))
    :effect (and 
             (forall (?p - participant) (not (try_slot ?p ?t_start ?t_end)))
             (meeting_scheduled)
    )
  )
)