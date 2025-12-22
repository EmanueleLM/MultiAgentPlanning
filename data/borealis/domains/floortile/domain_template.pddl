(define (domain floor-tile)
  (:requirements :typing :action-costs)
  (:types robot tile color - object)
  (:predicates)
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?c - color ?c2 - color)
    :precondition ()
    :effect ()
  )

  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition ()
    :effect ()
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition ()
    :effect ()
  )

  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition ()
    :effect ()
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition ()
    :effect ()
  )

  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition ()
    :effect ()
  )

  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition ()
    :effect ()
  )
)