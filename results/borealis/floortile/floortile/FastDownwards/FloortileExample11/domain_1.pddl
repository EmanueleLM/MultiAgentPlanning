(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions :equality)
  (:types robot tile color)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile) ; Clear means unpainted and unoccupied
    (painted ?t - tile ?c - color)
    ; Directional connectivity predicates: (Direction T_from T_to)
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?c_old - color ?c_new - color)
    :precondition (and
      (robot-has ?r ?c_old)
      (available-color ?c_new)
      (not (= ?c_old ?c_new))
    )
    :effect (and
      (not (robot-has ?r ?c_old))
      (robot-has ?r ?c_new)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color) ; ?y=robot position, ?x=target (up)
    :precondition (and
      (robot-has ?r ?c)
      (robot-at ?r ?y)
      (up ?y ?x)
      (clear ?x)
    )
    :effect (and
      (not (clear ?x)) ; Painted tiles are not clear
      (painted ?x ?c)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color) ; ?y=robot position, ?x=target (down)
    :precondition (and
      (robot-has ?r ?c)
      (robot-at ?r ?y)
      (down ?y ?x)
      (clear ?x)
    )
    :effect (and
      (not (clear ?x))
      (painted ?x ?c)
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?x - tile ?y - tile) ; ?x=current, ?y=up
    :precondition (and
      (robot-at ?r ?x)
      (up ?x ?y)
      (clear ?y)
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (clear ?x)     ; Old tile becomes clear
      (not (clear ?y)) ; New tile becomes occupied/unclear
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile) ; ?x=current, ?y=down
    :precondition (and
      (robot-at ?r ?x)
      (down ?x ?y)
      (clear ?y)
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?x - tile ?y - tile) ; ?x=current, ?y=right
    :precondition (and
      (robot-at ?r ?x)
      (right ?x ?y)
      (clear ?y)
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?x - tile ?y - tile) ; ?x=current, ?y=left
    :precondition (and
      (robot-at ?r ?x)
      (left ?x ?y)
      (clear ?y)
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )
)