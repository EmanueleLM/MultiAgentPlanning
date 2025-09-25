(define (domain multi-agent-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    (free ?p - person ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )

  ;; Action offered by agent "diane"
  (:action schedule-by-diane
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (scheduled))
      (free dianekelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (not (free dianekelly ?s))
      (not (free deborah ?s))
    )
  )

  ;; Action offered by agent "kelly" (kept distinct from diane)
  (:action schedule-by-kelly
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (scheduled))
      (free dianekelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (not (free dianekelly ?s))
      (not (free deborah ?s))
    )
  )

  ;; Action offered by agent "deborah"
  (:action schedule-by-deborah
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (scheduled))
      (free dianekelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (not (free dianekelly ?s))
      (not (free deborah ?s))
    )
  )
)