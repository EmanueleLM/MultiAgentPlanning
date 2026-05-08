(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types person meeting slot)

  (:predicates
    (busy ?p - person ?s - slot)
    (early_slot ?s - slot)
    (meeting_confirmed ?m - meeting)
    (meeting_at ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting_confirmed ?m))
      (early_slot ?s)
      (not (busy teresa ?s))
      (not (busy kathleen ?s))
      (not (busy patricia ?s))
    )
    :effect (and
      (meeting_confirmed ?m)
      (meeting_at ?m ?s)
    )
  )
)