(define (domain meeting_scheduling)
  (:requirements :strips :typing)
  (:types participant time_slot)
  (:predicates 
    (busy ?p - participant ?t_start - time_slot ?t_end - time_slot)
    (available ?p - participant ?t_start - time_slot ?t_end - time_slot)
    (meeting_possible)
    (meeting_scheduled)
  )
  (:action check_availability
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant 
                  ?t_start - time_slot ?t_30 - time_slot)
    :precondition (and 
                   (available ?p1 ?t_start ?t_30)
                   (available ?p2 ?t_start ?t_30)
                   (available ?p3 ?t_start ?t_30)
                   (not (busy ?p1 ?t_start ?t_30))
                   (not (busy ?p2 ?t_start ?t_30))
                   (not (busy ?p3 ?t_start ?t_30)))
    :effect (meeting_possible)
  )
  (:action schedule_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant 
                  ?t_start - time_slot ?t_30 - time_slot)
    :precondition (meeting_possible)
    :effect (and
             (not (meeting_possible))
             (not (available ?p1 ?t_start ?t_30))
             (not (available ?p2 ?t_start ?t_30))
             (not (available ?p3 ?t_start ?t_30))
             (meeting_scheduled))
  )
)