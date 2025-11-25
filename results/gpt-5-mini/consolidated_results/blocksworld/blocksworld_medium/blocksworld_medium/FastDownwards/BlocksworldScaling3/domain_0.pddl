(define (domain blocks-world)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; block x is on block y
    (ontable ?x - block)              ; block x is on the table
    (clear ?x - block)                ; there is nothing on block x
    (holding ?x - block)              ; robot-arm is holding block x
    (handempty)                       ; robot-arm is empty
  )

  ;; Action: pick-up a block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; Action: put-down a held block onto the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Action: unstack a block from another block (take top block)
  (:action unstack
    :parameters (?b - block ?under - block)
    :precondition (and (on ?b ?under) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Action: stack a held block onto another block
  (:action stack
    :parameters (?b - block ?under - block)
    :precondition (and (holding ?b) (clear ?under))
    :effect (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?under))
    )
  )
)