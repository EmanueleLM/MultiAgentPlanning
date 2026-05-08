(define (domain jack_of_all_trades_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person meeting slot)
  (:predicates
    (busy ?p - person ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (meeting_scheduled ?m - meeting)
    (meeting_start ?m - meeting ?s - slot)
    (meeting_occupies ?m - meeting ?s - slot)
    (occupied ?p - person ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot ?s2 - slot
                 ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (next_slot ?s ?s2)
      (not (meeting_scheduled ?m))
      (not (busy ?p1 ?s)) (not (busy ?p1 ?s2))
      (not (busy ?p2 ?s)) (not (busy ?p2 ?s2))
      (not (busy ?p3 ?s)) (not (busy ?p3 ?s2))
    )
    :effect (and
      (meeting_scheduled ?m)
      (meeting_start ?m ?s)
      (meeting_occupies ?m ?s)
      (meeting_occupies ?m ?s2)
      (occupied ?p1 ?s) (occupied ?p1 ?s2)
      (occupied ?p2 ?s) (occupied ?p2 ?s2)
      (occupied ?p3 ?s) (occupied ?p3 ?s2)
    )
  )
)