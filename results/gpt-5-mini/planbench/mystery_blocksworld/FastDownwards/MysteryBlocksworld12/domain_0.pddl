(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types phase)

  (:predicates
    (ready ?p - phase)              ; phase is ready to be executed now
    (phase-done ?p - phase)         ; phase has been completed
    (phase-next ?p ?n - phase)      ; n is the immediate successor of p
    (phase-first ?p - phase)        ; p is the designated first phase
    (phase-last ?p - phase)         ; p is the designated last phase
  )

  ; Execute a non-final phase: requires the phase is ready, not already done,
  ; and a known successor. Effects mark the phase done, clear its ready flag,
  ; and make its successor ready.
  (:action orchestrator-execute-phase
    :parameters (?p ?n - phase)
    :precondition (and
                    (ready ?p)
                    (phase-next ?p ?n)
                    (not (phase-done ?p))
                  )
    :effect (and
              (phase-done ?p)
              (not (ready ?p))
              (ready ?n)
            )
  )

  ; Execute a final phase: requires the phase is ready, last, and not already done.
  ; Effects mark it done and clear its ready flag; no successor is made ready.
  (:action orchestrator-execute-last-phase
    :parameters (?p - phase)
    :precondition (and
                    (ready ?p)
                    (phase-last ?p)
                    (not (phase-done ?p))
                  )
    :effect (and
              (phase-done ?p)
              (not (ready ?p))
            )
  )
)