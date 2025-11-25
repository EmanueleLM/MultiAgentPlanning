(define (domain block-stacking-collab)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?c - block)        ; block b is on block c
    (ontable ?b - block)              ; block is on the table
    (clear ?b - block)                ; no block on top of b and b is not held
    (holding ?b - block)              ; the agent is holding block b
    (handempty)                       ; the agent's hand is empty
    (current ?s - stage)              ; current time/stage marker
    (next ?s1 - stage ?s2 - stage)    ; stage ordering relation
  )

  ;; PICKUP: pick a clear block that is on the table into the hand
  (:action picker-pickup
    :parameters (?b - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (handempty)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))
      (not (current ?s1)) (current ?s2)
    )
  )

  ;; UNSTACK: remove a clear block from on top of another block into the hand
  (:action picker-unstack
    :parameters (?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (handempty)
      (on ?b ?c)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))
      (clear ?c)            ; underlying block becomes clear after removing top block
      (not (current ?s1)) (current ?s2)
    )
  )

  ;; PUTDOWN: place a held block onto the table
  (:action stacker-putdown
    :parameters (?b - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)            ; block on table with nothing on top is clear
      (not (holding ?b))
      (handempty)
      (not (current ?s1)) (current ?s2)
    )
  )

  ;; STACK: place a held block onto a clear target block
  (:action stacker-stack
    :parameters (?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (not (ontable ?b))
      (clear ?b)            ; newly placed top block has nothing on top
      (not (clear ?c))      ; target block is no longer clear
      (not (holding ?b))
      (handempty)
      (not (current ?s1)) (current ?s2)
    )
  )
)