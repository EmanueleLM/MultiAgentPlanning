(define (domain pddl_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ;; Canonicalized core relation (auditor-recommended canonical name)
    (next ?from - obj ?to - obj)
    ;; Provenance predicates kept distinct per original agent
    (provenance-player ?from - obj ?to - obj)
    (provenance-collector ?from - obj ?to - obj)
    (provenance-auditor ?from - obj ?to - obj)
  )

  ;; Action schema originating from player.analysis
  (:action player-set-next
    :parameters (?a - obj ?b - obj)
    :precondition (not (next ?a ?b))
    :effect (and
      (next ?a ?b)
      (provenance-player ?a ?b)
    )
  )

  ;; Action schema originating from collector.analysis
  (:action collector-set-next
    :parameters (?a - obj ?b - obj)
    :precondition (not (next ?a ?b))
    :effect (and
      (next ?a ?b)
      (provenance-collector ?a ?b)
    )
  )

  ;; Action schema originating from auditor.report (also allowed to assert next)
  (:action auditor-set-next
    :parameters (?a - obj ?b - obj)
    :precondition (not (next ?a ?b))
    :effect (and
      (next ?a ?b)
      (provenance-auditor ?a ?b)
    )
  )
)