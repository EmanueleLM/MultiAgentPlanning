(define (domain blocksworld-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table step)

  (:predicates
    (on-block ?b - block ?p - block)   ; block ?b is on top of block ?p
    (on-table ?b - block)              ; block ?b is on the table
    (clear ?b - block)                 ; nothing on top of ?b (and it is not being held)
    (handempty)                        ; the hand is empty
    (holding ?b - block)               ; the hand holds block ?b
    (allowed ?s - step)                ; current active stage
    (next ?s - step ?t - step)         ; ordering of stages
  )

  ;; Pick up a block from the table (must be clear and hand empty), advance stage
  (:action pickup-from-table
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on-table ?b)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Unstack a block from on top of another block (must be clear and hand empty), advance stage
  (:action unstack
    :parameters (?b - block ?under - block ?s - step ?s2 - step)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on-block ?b ?under)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (on-block ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Put the held block down on the table, advance stage
  (:action putdown-on-table
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Stack the held block onto another clear block, advance stage
  (:action stack-onto-block
    :parameters (?b - block ?target - block ?s - step ?s2 - step)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?target)
    )
    :effect (and
      (on-block ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty)
      (not (holding ?b))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )
)