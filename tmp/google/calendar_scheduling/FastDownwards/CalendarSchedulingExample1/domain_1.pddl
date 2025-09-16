(define (domain calendar-scheduling)
  (:requirements :typing)
  (:types
    person time
  )
  (:predicates
    (blocked ?p - person ?t - time)
    (meeting_at ?t - time)
    (attends ?p - person ?t - time)
  )
  (:action schedule_meeting
    :parameters (?r - person ?b - person ?d - person ?t - time)
    :precondition (and
      (not (blocked ?r ?t))
      (not (blocked ?b ?t))
      (not (blocked ?d ?t))
      (not (meeting_at ?t)))
    :effect (and
      (meeting_at ?t)
      (attends ?r ?t)
      (attends ?b ?t)
      (attends ?d ?t))
  )
)