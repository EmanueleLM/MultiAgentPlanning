(define (domain meeting_scheduling)
  (:requirements :strips :typing)
  (:types participant time_slot)
  (:predicates 
    (free ?p - participant ?t_start - time_slot ?t_end - time_slot)
    (occupied ?p - participant ?t_start - time_slot ?t_end - time_slot)
    (meeting_scheduled)
  )
  (:action find_free_time
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant 
                  ?t_start - time_slot ?t_30 - time_slot)
    :precondition (and 
                   (free ?p1 ?t_start ?t_30)
                   (free ?p2 ?t_start ?t_30)
                   (free ?p3 ?t_start ?t_30)
                   (not (occupied ?p1 ?t_start ?t_30))
                   (not (occupied ?p2 ?t_start ?t_30))
                   (not (occupied ?p3 ?t_start ?t_30)))
    :effect (meeting_scheduled)
  )
)