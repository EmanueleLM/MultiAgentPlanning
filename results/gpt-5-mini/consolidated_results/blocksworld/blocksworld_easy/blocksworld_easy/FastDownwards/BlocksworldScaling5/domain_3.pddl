(define (domain blocksworld-manipulator)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    block - place
    place
    stage
  )

  (:predicates
    (on ?b - block ?p - place)
    (clear ?b - block)
    (holding ?b - block)
    (hand-empty)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand-empty)
      (clear ?b)
      (on ?b table)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (holding ?b)
      (not (hand-empty))
      (not (on ?b table))
      (not (clear ?b))
    )
  )

  (:action unstack
    :parameters (?b - block ?support - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand-empty)
      (clear ?b)
      (on ?b ?support)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (holding ?b)
      (not (hand-empty))
      (not (on ?b ?support))
      (not (clear ?b))
      (clear ?support)
    )
  )

  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (on ?b table)
      (clear ?b)
      (hand-empty)
      (not (holding ?b))
    )
  )

  (:action stack
    :parameters (?b - block ?support - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (holding ?b)
      (clear ?support)
      (not (= ?b ?support))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (on ?b ?support)
      (clear ?b)
      (hand-empty)
      (not (holding ?b))
      (not (clear ?support))
    )
  )
)