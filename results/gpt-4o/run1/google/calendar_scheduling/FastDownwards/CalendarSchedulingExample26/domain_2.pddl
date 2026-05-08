(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time)

  (:predicates
    (is_free ?p - participant ?t_start - time ?t_end - time)
    (meeting_possible ?t_start - time ?t_end - time)
    (meeting_scheduled ?p - participant ?t_start - time ?t_end - time)
    (adjacent ?t1 - time ?t2 - time)
  )
  
  (:action schedule_meeting
    :parameters (?t_start - time ?t_end - time)
    :precondition
      (and
         (meeting_possible ?t_start ?t_end)
         (is_free katherine ?t_start ?t_end)
         (is_free nicole ?t_start ?t_end)
         (is_free kevin ?t_start ?t_end)
         (adjacent ?t_start ?t_end)
      )
    :effect
      (and
         (meeting_scheduled katherine ?t_start ?t_end)
         (meeting_scheduled nicole ?t_start ?t_end)
         (meeting_scheduled kevin ?t_start ?t_end)
      )
  )
)