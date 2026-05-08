(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time day)
  
  (:predicates
    (available ?p - participant ?t - time ?d - day)
    (preferred_start ?p - participant ?t - time ?d - day)
    (meeting_scheduled ?p1 - participant ?p2 - participant ?p3 - participant ?t - time ?d - day)
    (next_time ?t1 - time ?t2 - time)
    (slot ?t - time)
  )
  
  (:action schedule_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?t_start - time ?d - day)
    :precondition (and
      (slot ?t_start)
      (available ?p1 ?t_start ?d)
      (available ?p2 ?t_start ?d)
      (available ?p3 ?t_start ?d)
      (preferred_start ?p1 ?t_start ?d)
    )
    :effect 
    (meeting_scheduled ?p1 ?p2 ?p3 ?t_start ?d)
  )
)