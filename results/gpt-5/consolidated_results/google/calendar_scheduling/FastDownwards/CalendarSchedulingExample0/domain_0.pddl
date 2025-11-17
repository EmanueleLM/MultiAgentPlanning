(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s - slot ?t - slot)
    (start-slot ?s - slot)
    (committed-michelle ?s - slot ?t - slot)
    (committed-steven ?s - slot ?t - slot)
    (committed-jerry ?s - slot ?t - slot)
    (scheduled ?s - slot)
  )

  (:action commit-michelle
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (start-slot ?s)
      (free michelle ?s)
      (free michelle ?t)
    )
    :effect (and
      (committed-michelle ?s ?t)
    )
  )

  (:action commit-steven
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (start-slot ?s)
      (free steven ?s)
      (free steven ?t)
    )
    :effect (and
      (committed-steven ?s ?t)
    )
  )

  (:action commit-jerry
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (start-slot ?s)
      (free jerry ?s)
      (free jerry ?t)
    )
    :effect (and
      (committed-jerry ?s ?t)
    )
  )

  (:action finalize
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (start-slot ?s)
      (committed-michelle ?s ?t)
      (committed-steven ?s ?t)
      (committed-jerry ?s ?t)
    )
    :effect (and
      (scheduled ?s)
    )
  )
)