(define (domain blocks_world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block - place place)

  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?b - block ?s - place)
    (clear ?b - block)
  )

  ;; pick-up: take a block from the table into the hand
  (:action pick-up
    :parameters (?b - block)
    :precondition (and
      (handempty)
      (clear ?b)
      (on ?b table)
    )
    :effect (and
      (not (on ?b table))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; unstack: take a block b from on top of block c
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (handempty)
      (on ?b ?c)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
    )
  )

  ;; put-down: place a held block onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; stack: place a held block b onto another block c
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?c))
    )
  )
)