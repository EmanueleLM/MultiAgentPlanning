(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types item)

  (:predicates
    ;; item availability
    (available ?it - item)

    ;; primary relation: subject craves object
    (craves ?subject - item ?object - item)

    ;; authorization predicates encoding which agent is responsible for creating which crave
    (allowed-agent1 ?subject - item ?object - item)
    (allowed-agent2 ?subject - item ?object - item)

    ;; auditor pairing: auditor enforces that these two craves (pairs) must be jointly confirmed
    (auditor-pairs ?s1 - item ?o1 - item ?s2 - item ?o2 - item)

    ;; audit flag (optional terminal predicate if auditor confirmation is required externally)
    (audited)
  )

  ;; Action representing the first agent's responsibility to establish a crave relation.
  ;; This action can only be applied for subject-object pairs explicitly authorized for agent1.
  (:action agent1_create_crave
    :parameters (?s - item ?o - item)
    :precondition (and
      (allowed-agent1 ?s ?o)
      (available ?o)
      (not (craves ?s ?o))
    )
    :effect (and
      (craves ?s ?o)
    )
  )

  ;; Action representing the second agent's responsibility to establish a crave relation.
  ;; This action can only be applied for subject-object pairs explicitly authorized for agent2.
  (:action agent2_create_crave
    :parameters (?s - item ?o - item)
    :precondition (and
      (allowed-agent2 ?s ?o)
      (available ?o)
      (not (craves ?s ?o))
    )
    :effect (and
      (craves ?s ?o)
    )
  )

  ;; Action representing the auditor's confirmation step.
  ;; It can only be executed when the two paired craves are present (as encoded by auditor-pairs).
  ;; This action does not create craves itself; it only confirms that the required pair of craves co-exist.
  (:action auditor_confirm_pairs
    :parameters (?s1 - item ?o1 - item ?s2 - item ?o2 - item)
    :precondition (and
      (auditor-pairs ?s1 ?o1 ?s2 ?o2)
      (craves ?s1 ?o1)
      (craves ?s2 ?o2)
      (not (audited))
    )
    :effect (and
      (audited)
    )
  )
)