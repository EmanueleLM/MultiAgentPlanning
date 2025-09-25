(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (slot ?s)
    (person ?p)
    (free ?p ?s)
    (preferred-by-benjamin ?s)
    (proposed ?s)
    (hannah-confirmed ?s)
    (meeting-scheduled ?s)
  )

  ;; Benjamin proposes a candidate slot that satisfies his preference and his availability.
  (:action benjamin-propose
    :parameters (?s)
    :precondition (and
      (slot ?s)
      (free ben ?s)
      (preferred-by-benjamin ?s)
      (not (proposed ?s))
    )
    :effect (and
      (proposed ?s)
    )
  )

  ;; Hannah confirms the proposed slot and must be free then.
  (:action hannah-confirm
    :parameters (?s)
    :precondition (and
      (slot ?s)
      (free hann ?s)
      (proposed ?s)
      (not (hannah-confirmed ?s))
    )
    :effect (and
      (hannah-confirmed ?s)
    )
  )

  ;; Brenda gives the final confirmation; meeting is scheduled only once Brenda confirms.
  (:action brenda-confirm
    :parameters (?s)
    :precondition (and
      (slot ?s)
      (free brenda ?s)
      (proposed ?s)
      (hannah-confirmed ?s)
      (not (meeting-scheduled ?s))
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (proposed ?s))
      (not (hannah-confirmed ?s))
    )
  )
)