(define (domain blocks-order)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)        ; block ?x is directly on block ?y
    (ontable ?x - block)              ; block ?x is on the table
    (clear ?x - block)                ; nothing is on top of ?x
    (holding ?x - block)              ; the robot arm is holding ?x
    (handempty)                       ; the robot arm is empty
    (red_on_yellow_done)              ; explicit ordering marker: red has been placed on yellow
  )

  ;; Pick up a clear block from the table
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Unstack a clear block from on top of another block
  (:action unstack
    :parameters (?b - block ?below - block)
    :precondition (and (on ?b ?below) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?below)
      (not (on ?b ?below))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Put down (place a held block) onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Stack a held block onto another clear block (generic stack)
  ;; This generic stack can be used for placements except the two special ordered placements.
  ;; To avoid violating the specified ordering, the specialized actions below handle the
  ;; two goal-critical placements. This generic stack is available for other placements.
  (:action stack
    :parameters (?b - block ?target - block)
    :precondition (and (holding ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?target))
    )
  )

  ;; Specialized action: stack red onto yellow.
  ;; This action additionally sets the ordering marker red_on_yellow_done.
  (:action stack-red-on-yellow
    :parameters ()
    :precondition (and (holding red) (clear yellow))
    :effect (and
      (on red yellow)
      (clear red)
      (handempty)
      (red_on_yellow_done)
      (not (holding red))
      (not (clear yellow))
    )
  )

  ;; Specialized action: stack orange onto red.
  ;; This action requires red_on_yellow_done to enforce the mandatory order.
  (:action stack-orange-on-red
    :parameters ()
    :precondition (and (holding orange) (clear red) (red_on_yellow_done))
    :effect (and
      (on orange red)
      (clear orange)
      (handempty)
      (not (holding orange))
      (not (clear red))
    )
  )
)