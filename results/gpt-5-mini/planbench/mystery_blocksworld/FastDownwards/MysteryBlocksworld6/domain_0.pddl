(define (domain cravings-domain)
  :requirements :strips :typing :negative-preconditions
  :types agent item

  :predicates
    (agent ?ag - agent)
    (craves ?x - item ?y - item)

  ;; Actions are namespaced/prefixed by the performing agent identifier (ag1-)
  ;; to keep agent-specific actions distinct and avoid name collisions.
  ;; Each action explicitly creates the causal link (craves X Y).
  (:action ag1-induce-crave
    :parameters (?ag - agent ?from - item ?to - item)
    :precondition (and
                    (agent ?ag)
                    (not (craves ?from ?to))
                  )
    :effect (craves ?from ?to)
  )
)