(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s - slot ?t - slot)
    (start-slot ?s - slot)
    (is-michelle ?p - person)
    (is-steven ?p - person)
    (is-jerry ?p - person)
    (committed-michelle ?s - slot ?t - slot)
    (committed-steven ?s - slot ?t - slot)
    (committed-jerry ?s - slot ?t - slot)
    (scheduled ?s - slot)
    (some-scheduled)
  )

  (:action commit-michelle
    :parameters (?p - person ?s - slot ?t - slot)
    :precondition (and
      (is-michelle ?p)
      (next ?s ?t)
      (start-slot ?s)
      (free ?p ?s)
      (free ?p ?t)
    )
    :effect (and
      (committed-michelle ?s ?t)
    )
  )

  (:action commit-steven
    :parameters (?p - person ?s - slot ?t - slot)
    :precondition (and
      (is-steven ?p)
      (next ?s ?t)
      (start-slot ?s)
      (free ?p ?s)
      (free ?p ?t)
    )
    :effect (and
      (committed-steven ?s ?t)
    )
  )

  (:action commit-jerry
    :parameters (?p - person ?s - slot ?t - slot)
    :precondition (and
      (is-jerry ?p)
      (next ?s ?t)
      (start-slot ?s)
      (free ?p ?s)
      (free ?p ?t)
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
      (some-scheduled)
    )
  )
)