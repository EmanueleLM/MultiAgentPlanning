(define (domain sequence_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object)

  ;; Declare the specific agents as domain constants so the domain can refer to them directly.
  (:constants agent1 agent2 - agent)

  (:predicates
    (next ?from - object ?to - object)            ; directed sequence link
    (has-next ?o - object)                       ; object already has a successor
    (has-prev ?o - object)                       ; object already has a predecessor
    (allow-link-for ?a - agent ?from - object ?to - object) ; permission: this agent may create this link
  )

  ;; Action performed by agent1 to create an allowed link.
  ;; Distinct action name preserves agent-origin of the operation (uses the agent1 constant).
  (:action link-by-agent1
    :parameters (?from - object ?to - object)
    :precondition (and
                    (allow-link-for agent1 ?from ?to)
                    (not (has-next ?from))
                    (not (has-prev ?to))
                  )
    :effect (and
              (next ?from ?to)
              (has-next ?from)
              (has-prev ?to)
              (not (allow-link-for agent1 ?from ?to))
            )
  )

  ;; Action performed by agent2 to create an allowed link.
  (:action link-by-agent2
    :parameters (?from - object ?to - object)
    :precondition (and
                    (allow-link-for agent2 ?from ?to)
                    (not (has-next ?from))
                    (not (has-prev ?to))
                  )
    :effect (and
              (next ?from ?to)
              (has-next ?from)
              (has-prev ?to)
              (not (allow-link-for agent2 ?from ?to))
            )
  )
)