(define (domain blocks_world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?b - block ?c - block)
    (ontable ?b - block)
    (clear ?b - block)
    (now ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; pick-up: take a block from the table into the hand, advances stage
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (handempty)
      (clear ?b)
      (ontable ?b)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; unstack: take a block b from on top of block c, advances stage
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (handempty)
      (on ?b ?c)
      (clear ?b)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; put-down: place a held block onto the table, advances stage
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; stack: place a held block b onto another block c, advances stage
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?c))
      (not (now ?s))
      (now ?s2)
    )
  )
)