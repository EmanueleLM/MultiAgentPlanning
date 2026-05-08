(define (domain pddl_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (available ?o - obj)
    (proposed ?a - obj ?b - obj)
    (confirmed ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
  )

  ;; Actions coming from the player.analysis capability
  (:action player-propose-next
    :parameters (?a - obj ?b - obj)
    :precondition (and
      (available ?a)
      (available ?b)
      (not (proposed ?a ?b))
      (not (next ?a ?b))
    )
    :effect (and
      (proposed ?a ?b)
    )
  )

  ;; Actions coming from the collector.analysis capability
  (:action collector-confirm-next
    :parameters (?a - obj ?b - obj)
    :precondition (and
      (proposed ?a ?b)
      (not (confirmed ?a ?b))
      (not (next ?a ?b))
    )
    :effect (and
      (confirmed ?a ?b)
    )
  )

  ;; Actions coming from the auditor.report capability
  ;; Auditor-enforced repair: canonicalize the final predicate to "next" and
  ;; require confirmation before finalization. Finalization creates the authoritative next relation
  ;; and removes transient bookkeeping facts.
  (:action auditor-finalize-next
    :parameters (?a - obj ?b - obj)
    :precondition (and
      (confirmed ?a ?b)
      (not (next ?a ?b))
    )
    :effect (and
      (next ?a ?b)
      (not (proposed ?a ?b))
      (not (confirmed ?a ?b))
    )
  )
)