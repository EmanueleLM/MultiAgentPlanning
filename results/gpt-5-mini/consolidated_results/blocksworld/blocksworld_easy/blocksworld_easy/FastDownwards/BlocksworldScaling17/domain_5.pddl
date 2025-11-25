(define (domain blocks-order-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (current ?s) (next ?s ?s2))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unstack
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and (on ?b ?below) (clear ?b) (handempty) (current ?s) (next ?s ?s2))
    :effect (and
      (holding ?b)
      (clear ?below)
      (not (on ?b ?below))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?b) (current ?s) (next ?s ?s2))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action stack
    :parameters (?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?b) (clear ?target) (current ?s) (next ?s ?s2))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?target))
      (not (current ?s))
      (current ?s2)
    )
  )
)