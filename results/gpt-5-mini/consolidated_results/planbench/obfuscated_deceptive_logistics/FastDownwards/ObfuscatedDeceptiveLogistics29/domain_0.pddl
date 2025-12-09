(define (domain link-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types node)
  (:predicates
    ; Primary ordering relation: next A B means A is immediately before B in an explicit ordering/chain.
    (next ?a - node ?b - node)
    ; Bookkeeping predicate introduced to prevent a source node from having more than one outgoing "next".
    ; This replaces ad-hoc/penalty bookkeeping and enforces the constraint at the modelling level.
    (has-next ?a - node)
  )

  ; Action schemas representing distinct agents' capabilities to establish an ordering link.
  ; They are kept distinct by name (player-, analyst-, auditor-). They have identical semantics:
  ; they create a (next ?a ?b) link if the source ?a does not yet have a next.
  ; Note: targets may have multiple predecessors (multiple incoming next), because the required goal
  ; contains multiple links to the same target object_10; therefore we do NOT prohibit multiple incoming links.
  (:action player-link
    :parameters (?a - node ?b - node)
    :precondition (and (not (has-next ?a)))
    :effect (and (next ?a ?b) (has-next ?a))
  )

  (:action analyst-link
    :parameters (?a - node ?b - node)
    :precondition (and (not (has-next ?a)))
    :effect (and (next ?a ?b) (has-next ?a))
  )

  (:action auditor-link
    :parameters (?a - node ?b - node)
    :precondition (and (not (has-next ?a)))
    :effect (and (next ?a ?b) (has-next ?a))
  )
)