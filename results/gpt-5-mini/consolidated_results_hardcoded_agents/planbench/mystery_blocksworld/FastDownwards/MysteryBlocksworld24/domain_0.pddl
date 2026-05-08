(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent thing)

  (:predicates
    ;; Existence marker for things (explicit existence required by preconditions)
    (exists ?t - thing)

    ;; Craving relation between things (goal concerns these)
    (craves ?x - thing ?y - thing)

    ;; Phase/order markers recommended by auditor: enforce attacker action before feaster action
    (attacker-attack-done)
    (feaster-feast-done)

    ;; Agent roles (typing via predicates to preserve roles as hard constraints)
    (is-attacker ?ag - agent)
    (is-feaster ?ag - agent)
  )

  ;; Agent: attacker
  ;; This action can cause any thing ?x to crave any thing ?y, but only if invoked by an agent
  ;; whose role is attacker. It cannot be applied if the craving already holds.
  (:action attacker-attack
    :parameters (?ag - agent ?x - thing ?y - thing)
    :precondition (and
      (is-attacker ?ag)
      (exists ?x)
      (exists ?y)
      (not (craves ?x ?y))
    )
    :effect (and
      (craves ?x ?y)
      (attacker-attack-done)
    )
  )

  ;; Agent: feaster
  ;; Feaster actions are allowed only after at least one attacker-attack has completed (ordering enforced).
  ;; It cannot create a craving that already exists.
  (:action feaster-feast
    :parameters (?ag - agent ?x - thing ?y - thing)
    :precondition (and
      (is-feaster ?ag)
      (exists ?x)
      (exists ?y)
      (attacker-attack-done)     ;; auditor-recommended ordering: attacker must have acted first
      (not (craves ?x ?y))
    )
    :effect (and
      (craves ?x ?y)
      (feaster-feast-done)
    )
  )
)