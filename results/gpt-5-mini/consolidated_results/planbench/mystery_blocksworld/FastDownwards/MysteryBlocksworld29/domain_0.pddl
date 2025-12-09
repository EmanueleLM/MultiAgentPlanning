; Domain: craving-domain
; Orchestrator notes / assumptions:
; - There are two agents named a and b (objects of type agent) and one item c (object of type item).
; - The goal predicates requested are (craves a c) and (craves b a).
; - We treat both agents and items as entities: agent and item are subtypes of entity so agents can be the target of a "crave".
; - Actions that create cravings are explicitly provided for each agent and are named with agent prefixes to keep provenance distinct.
; - No resources, availability, or other capabilities beyond the ability to perform the specified "crave" actions are invented.
; - All natural-language preferences are treated as hard constraints; none are introduced here beyond the requested goals.
; - No bookkeeping shortcuts (tokens/penalty actions) are present; once an action adds a craving it is not retractable by any action in the domain.
(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item - entity)

  (:predicates
    (craves ?who - agent ?what - entity)
  )

  ; Action: agent a establishes a craving toward a target entity
  (:action a-crave
    :parameters (?target - entity)
    :precondition (not (craves a ?target))
    :effect (craves a ?target)
  )

  ; Action: agent b establishes a craving toward a target entity
  (:action b-crave
    :parameters (?target - entity)
    :precondition (not (craves b ?target))
    :effect (craves b ?target)
  )
)