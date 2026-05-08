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
      (is_available scott ?t)
      (is_available gabriel ?t)
      (is_available christine ?t)
    )
    :effect (meeting_scheduled ?t)
  )
)