(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (slot ?s)
    (free ?p ?s)                ; participant ?p is free at slot ?s
    (scheduled ?s)              ; meeting scheduled at slot ?s
    (meeting-scheduled)         ; a meeting has been scheduled
    (earliest ?s)               ; ?s has been determined to be the earliest feasible slot
  )

  ;; Heather's scheduling action
  (:action schedule-by-heather
    :parameters (?s)
    :precondition (and
      (earliest ?s)
      (free heather ?s)
      (free nicholas ?s)
      (free zachary ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )

  ;; Nicholas's scheduling action
  (:action schedule-by-nicholas
    :parameters (?s)
    :precondition (and
      (earliest ?s)
      (free heather ?s)
      (free nicholas ?s)
      (free zachary ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )

  ;; Zachary's scheduling action
  (:action schedule-by-zachary
    :parameters (?s)
    :precondition (and
      (earliest ?s)
      (free heather ?s)
      (free nicholas ?s)
      (free zachary ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)