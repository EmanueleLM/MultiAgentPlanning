(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time)
  (:predicates
    (is_busy ?p - participant ?t - time)
    (meeting_scheduled)
    (next_time ?t1 - time ?t2 - time)
  )

  (:action schedule_meeting
    :parameters (?t - time ?t_next - time)
    :precondition (and
      (not (meeting_scheduled))
      (next_time ?t ?t_next)
      (not (is_busy scott ?t))
      (not (is_busy scott ?t_next))
      (not (is_busy gabriel ?t))
      (not (is_busy gabriel ?t_next))
      (not (is_busy christine ?t))
      (not (is_busy christine ?t_next))
    )
    :effect (meeting_scheduled)
  )
)