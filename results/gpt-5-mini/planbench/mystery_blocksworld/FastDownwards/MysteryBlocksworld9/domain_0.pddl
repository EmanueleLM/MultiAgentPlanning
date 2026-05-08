(define (domain crave-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj agent)

  (:predicates
    (exists ?o - obj)
    (verified ?o - obj)
    (craves ?from - obj ?to - obj)
    (is-auditor ?ag - agent)
    (is-orchestrator ?ag - agent)
    (audited-by ?o - obj ?ag - agent)
  )

  ;; Auditor must verify objects before any craving may be declared.
  (:action verify-object
    :parameters (?ag - agent ?o - obj)
    :precondition (and
                    (is-auditor ?ag)
                    (exists ?o)
                    (not (verified ?o))
                  )
    :effect (and
              (verified ?o)
              (audited-by ?o ?ag)
            )
  )

  ;; Orchestrator declares a craving only after both involved objects are verified.
  (:action declare-crave
    :parameters (?ag - agent ?from - obj ?to - obj)
    :precondition (and
                    (is-orchestrator ?ag)
                    (exists ?from)
                    (exists ?to)
                    (verified ?from)
                    (verified ?to)
                    (not (craves ?from ?to))
                  )
    :effect (craves ?from ?to)
  )
)