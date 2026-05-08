(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person
    time_slot
  )
  (:predicates
    (is_available ?p - person ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
  )
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
      (is_available SCOTT ?t)
      (is_available GABRIEL ?t)
      (is_available CHRISTINE ?t)
    )
    :effect (meeting_scheduled ?t)
  )