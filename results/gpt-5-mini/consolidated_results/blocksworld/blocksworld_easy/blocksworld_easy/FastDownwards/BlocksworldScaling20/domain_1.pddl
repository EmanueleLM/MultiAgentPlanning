(define (domain block-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (curr ?s - step)
    (next ?s - step ?s2 - step)
  )

  ;; pick-up: pick a clear block from the table into the single hand, advances stage
  (:action pick-up
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (curr ?s) (next ?s ?s2))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (curr ?s))
      (curr ?s2)
    )
  )

  ;; unstack: pick a clear block from on top of another block into the single hand, advances stage
  (:action unstack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and (on ?b ?c) (clear ?b) (handempty) (curr ?s) (next ?s ?s2))
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (handempty))
      (not (curr ?s))
      (curr ?s2)
    )
  )

  ;; put-down: place a held block onto the table, advances stage
  (:action put-down
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and (holding ?b) (curr ?s) (next ?s ?s2))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (curr ?s))
      (curr ?s2)
    )
  )

  ;; stack: place a held block on top of a clear block, advances stage
  (:action stack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and (holding ?b) (clear ?c) (curr ?s) (next ?s ?s2))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (clear ?c))
      (not (holding ?b))
      (not (curr ?s))
      (curr ?s2)
    )
  )
)