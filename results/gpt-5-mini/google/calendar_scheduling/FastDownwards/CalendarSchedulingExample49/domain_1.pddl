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
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (not (meeting_confirmed ?m))
      (early_slot ?s)
      (not (busy ?p1 ?s))
      (not (busy ?p2 ?s))
      (not (busy ?p3 ?s))
    )
    :effect (and
      (meeting_confirmed ?m)
      (meeting_at ?m ?s)
    )
  )
)