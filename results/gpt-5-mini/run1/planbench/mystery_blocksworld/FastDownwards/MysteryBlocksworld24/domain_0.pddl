(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent thing)

  (:predicates
    ;; role predicates enforce which agent may execute which agent-prefixed actions
    (role-attacker ?ag - agent)
    (role-feaster ?ag - agent)

    ;; main world predicate: one thing craves another thing
    (craves ?x - thing ?y - thing)
  )

  ;-----------------------------------------------------------------
  ; attacker actions: create a craving relation from a subject to a target
  ; Action name is prefixed with "attacker-" to preserve agent distinction
  ;-----------------------------------------------------------------
  (:action attacker-attack
    :parameters (?ag - agent ?subject - thing ?target - thing)
    :precondition (and
                    (role-attacker ?ag)
                    ;; cannot create duplicate craving; enforced as a hard constraint
                    (not (craves ?subject ?target))
                  )
    :effect (and
              (craves ?subject ?target)
            )
  )

  ;-----------------------------------------------------------------
  ; feaster actions: create a craving relation from a guest to a meal
  ; Action name is prefixed with "feaster-" to preserve agent distinction
  ;-----------------------------------------------------------------
  (:action feaster-feast
    :parameters (?ag - agent ?guest - thing ?meal - thing)
    :precondition (and
                    (role-feaster ?ag)
                    ;; cannot create duplicate craving; enforced as a hard constraint
                    (not (craves ?guest ?meal))
                  )
    :effect (and
              (craves ?guest ?meal)
            )
  )
)