(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (hand-empty ?a - agent)
    (holding ?a - agent ?x - block)
    (current-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action pick-up
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (hand-empty ?ag)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action unstack
    :parameters (?ag - agent ?b - block ?b_from - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?b_from)
      (clear ?b)
      (hand-empty ?ag)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?b ?b_from))
      (clear ?b_from)
      (not (clear ?b))
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action put-down
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (hand-empty ?ag)
      (not (holding ?ag ?b))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action stack
    :parameters (?ag - agent ?b - block ?b_target - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (clear ?b_target)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (holding ?ag ?b))
      (not (clear ?b_target))
      (hand-empty ?ag)
      (on ?b ?b_target)
      (clear ?b)
      (not (ontable ?b))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)