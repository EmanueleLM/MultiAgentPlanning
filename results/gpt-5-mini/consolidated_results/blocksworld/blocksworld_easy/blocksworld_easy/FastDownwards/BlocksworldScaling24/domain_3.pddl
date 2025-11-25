(define (domain one_hand_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)         ; ?x is on top of ?y
    (ontable ?x - block)               ; ?x is on the table
    (clear ?x - block)                 ; nothing on top of ?x and it is not held
    (holding ?x - block)               ; the single hand is holding ?x
    (hand-free)                        ; the single hand is free (token ensuring single-handedness)
    (different ?x - block ?y - block)  ; helper to prevent self-stacking (must be enumerated in problem)
    (at-stage ?s - stage)              ; current discrete stage (exactly one true in reachable states)
    (next ?s - stage ?t - stage)       ; stage ordering relation (successor)
  )

  ;; Pick up a block from the table into the single hand, advancing to the immediate successor stage
  (:action pick-up-from-table
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (hand-free)
      (at-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))   ; picked-up blocks are not clear (spec: clear iff not held and no block on top)
      (holding ?b)
      (not (hand-free))
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )

  ;; Unstack a block from on top of another block into the single hand, advancing to the immediate successor stage
  (:action pick-up-from-block
    :parameters (?b - block ?support - block ?s - stage ?t - stage)
    :precondition (and
      (on ?b ?support)
      (clear ?b)
      (hand-free)
      (at-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?b ?support))
      (clear ?support)   ; support becomes clear once the top block is removed
      (not (clear ?b))   ; picked-up block is not clear while held
      (holding ?b)
      (not (hand-free))
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )

  ;; Put the held block down onto the table, advancing to the immediate successor stage
  (:action put-down-to-table
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (at-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)         ; when put down on table and nothing on top, block is clear
      (not (holding ?b))
      (hand-free)
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )

  ;; Stack the held block onto another block, advancing to the immediate successor stage
  (:action stack-onto-block
    :parameters (?b - block ?target - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (clear ?target)
      (different ?b ?target)
      (at-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)         ; after stacking, the placed block has nothing on top and is not held -> clear
      (not (holding ?b))
      (not (clear ?target)) ; target is no longer clear because something is now on it
      (hand-free)
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )
)