(define (domain meeting-scheduling)
  (:requirements :strips)
  (:predicates
    (slot ?s)
    (next ?s ?s2)
    (free ?p ?s)
    (scheduled ?s ?s2)
  )

  (:action schedule-meeting
    :parameters (?s ?s2)
    :precondition (and
      (slot ?s) (slot ?s2) (next ?s ?s2)
      ;; hard constraints: every participant must be free for both consecutive slots
      (free thomas ?s) (free thomas ?s2)
      (free dylan ?s)  (free dylan ?s2)
      (free jerry ?s)  (free jerry ?s2)
    )
    :effect (and (scheduled ?s ?s2))
  )
)