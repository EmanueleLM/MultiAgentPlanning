(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action picker-pick-from-table
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (handempty))
      (not (clear ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action picker-unstack
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?below))
      (clear ?below)
      (not (handempty))
      (not (clear ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action stacker-put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action stacker-stack
    :parameters (?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?target)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?target)
      (not (clear ?target))
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (ontable ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)