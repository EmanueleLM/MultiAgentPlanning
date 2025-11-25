(define (domain blocks-world-fast-downward)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (handempty)
    (holding ?x - block)
    (clear ?x - block)
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (different ?x - block ?y - block)
  )

  ;; Actions originating from agent: block_picker
  (:action block_picker-pickup
    :parameters (?x - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (handempty)
      (clear ?x)
      (ontable ?x)
    )
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (clear ?x))
      (not (ontable ?x))
      (not (current ?s1))
      (current ?s2)
    )
  )

  (:action block_picker-unstack
    :parameters (?x - block ?y - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (handempty)
      (clear ?x)
      (on ?x ?y)
    )
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (clear ?x))
      (not (on ?x ?y))
      (clear ?y)
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Actions originating from agent: stack_manager
  (:action stack_manager-putdown
    :parameters (?x - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (holding ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (current ?s1))
      (current ?s2)
    )
  )

  (:action stack_manager-stack
    :parameters (?x - block ?y - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (holding ?x)
      (clear ?y)
      (different ?x ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (ontable ?x))
      (not (current ?s1))
      (current ?s2)
    )
  )
)