(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types act phase)

  (:predicates
    (current ?p - phase)             ; which phase is currently active (exactly one true at a time)
    (next ?p1 - phase ?p2 - phase)   ; immediate successor relation for phases (enforces order)
    (assigned ?a - act ?p - phase)   ; which action is assigned to which phase
    (done ?a - act)                  ; action has been executed/completed
  )

  ;; paltry must be executed in its assigned phase, only if that phase is current,
  ;; and only once. Executing paltry marks it done, deactivates the current phase,
  ;; and advances to the successor phase.
  (:action paltry
    :parameters (?p - phase ?p2 - phase)
    :precondition (and
      (current ?p)
      (next ?p ?p2)
      (assigned paltry ?p)
      (not (done paltry))
    )
    :effect (and
      (done paltry)
      (not (current ?p))
      (current ?p2)
    )
  )

  (:action sip
    :parameters (?p - phase ?p2 - phase)
    :precondition (and
      (current ?p)
      (next ?p ?p2)
      (assigned sip ?p)
      (not (done sip))
    )
    :effect (and
      (done sip)
      (not (current ?p))
      (current ?p2)
    )
  )

  (:action clip
    :parameters (?p - phase ?p2 - phase)
    :precondition (and
      (current ?p)
      (next ?p ?p2)
      (assigned clip ?p)
      (not (done clip))
    )
    :effect (and
      (done clip)
      (not (current ?p))
      (current ?p2)
    )
  )

  (:action wretched
    :parameters (?p - phase ?p2 - phase)
    :precondition (and
      (current ?p)
      (next ?p ?p2)
      (assigned wretched ?p)
      (not (done wretched))
    )
    :effect (and
      (done wretched)
      (not (current ?p))
      (current ?p2)
    )
  )

  (:action memory
    :parameters (?p - phase ?p2 - phase)
    :precondition (and
      (current ?p)
      (next ?p ?p2)
      (assigned memory ?p)
      (not (done memory))
    )
    :effect (and
      (done memory)
      (not (current ?p))
      (current ?p2)
    )
  )

  (:action tightfisted
    :parameters (?p - phase ?p2 - phase)
    :precondition (and
      (current ?p)
      (next ?p ?p2)
      (assigned tightfisted ?p)
      (not (done tightfisted))
    )
    :effect (and
      (done tightfisted)
      (not (current ?p))
      (current ?p2)
    )
  )
)