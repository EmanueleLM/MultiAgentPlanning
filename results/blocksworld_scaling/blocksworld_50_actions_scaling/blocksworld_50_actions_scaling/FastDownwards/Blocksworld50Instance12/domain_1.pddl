(define (domain blocks-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (ontable ?b - block)
    (on ?b - block ?x - block)
    (clear ?b - block)
    (handempty)
    (holding ?b - block)
    (current-step ?s - step)
    (allow-pickup ?s - step ?b - block)
    (allow-unstack ?s - step ?b - block ?under - block)
    (allow-putdown ?s - step ?b - block)
    (allow-stack ?s - step ?b - block ?y - block)
  )

  ;; pickup a block from the table at a specific step
  (:action pickup-step
    :parameters (?b - block ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (allow-pickup ?sfrom ?b)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  ;; unstack a block ?b from ?under at a specific step
  (:action unstack-step
    :parameters (?b - block ?under - block ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (allow-unstack ?sfrom ?b ?under)
      (on ?b ?under)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?under))
      (clear ?under)
      (not (handempty))
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  ;; put a held block down on the table at a specific step
  (:action putdown-step
    :parameters (?b - block ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (allow-putdown ?sfrom ?b)
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  ;; stack a held block onto another block at a specific step
  (:action stack-step
    :parameters (?b - block ?y - block ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (allow-stack ?sfrom ?b ?y)
      (holding ?b)
      (clear ?y)
    )
    :effect (and
      (on ?b ?y)
      (clear ?b)
      (not (clear ?y))
      (handempty)
      (not (holding ?b))
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )
)