(define (domain switch-door-sync)
  (:requirements :typing :derivedPredicates)

  ;; ------------------------------------------------------------------
  ;; types
  ;; ------------------------------------------------------------------
  (:types
    agent switch position
  )

  ;; ------------------------------------------------------------------
  ;; predicates – these are the facts that the agents know about the
  ;; world.  All three agents can read them; only the `press` action
  ;; will change them.  The door status is a *derived* predicate.
  ;; ------------------------------------------------------------------
  (:predicates
    (at ?a - agent ?p - position) ; where an agent is
    (pressed ?s - switch) ; a switch is pushed
    (switch‑pos ?s - switch ?p - position) ; fixed location of a switch
    (door‑open) ; derived – door is unlocked
  )

  ;; ------------------------------------------------------------------
  ;;  Derived predicate – the door is open iff all three switches are
  ;;  pressed.  This makes it a “concurrent‑check’’: as soon as the
  ;;  third switch is pressed the predicate becomes true.
  ;; ------------------------------------------------------------------
  (:derived
    (door‑open)
    (and (pressed red)
      (pressed green)
      (pressed blue))
  )

  ;; ------------------------------------------------------------------
  ;;  Adjacency relations for a 3×3 grid (the positions that R reported
  ;;  are (1,1) → p1, …, (3,3) → p9).
  ;; ------------------------------------------------------------------
  (:constants
    p1 p2 p3 p4 p5 p6 p7 p8 p9
  )

  (:predicates
    ;; (adjacent ?p1 ?p2) – we simply declare them in the init of
    ;; the problem, not as predicates.
  )

  ;; ------------------------------------------------------------------
  ;;  Actions
  ;; ------------------------------------------------------------------
  (:action move
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at ?a ?from))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to))
  )

  (:action press
    :parameters (?a - agent ?s - switch)
    :precondition (and
      (at ?a
        (switch‑pos ?s ?s)) ; the agent is on the switch
      (not (pressed ?s))) ; it isn’t already pressed
    :effect (pressed ?s)
  )
)