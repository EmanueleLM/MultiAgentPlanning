(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types robot tile color - object)
  
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile) ; Tile is free to move onto or paint
    (painted ?t - tile ?c - color)
    
    ; Connectivity predicates
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
  )
  
  (:functions (total-cost))

  ; 1. Change Color (Cost 5)
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

  ; 2. Paint Up (Cost 2) - ?x is current tile, ?y is target tile above
  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-at ?r ?x)
      (robot-has ?r ?c)
      (up ?x ?y)
      (clear ?y) ; Must be clear to paint
    )
    :effect (and
      (not (clear ?y)) ; Painted tiles are not clear/unstandable
      (painted ?y ?c)
      (increase (total-cost) 2)
    )
  )

  ; 3. Paint Down (Cost 2) - ?x is current tile, ?y is target tile below
  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-at ?r ?x)
      (robot-has ?r ?c)
      (down ?x ?y)
      (clear ?y) ; Must be clear to paint
    )
    :effect (and
      (not (clear ?y)) ; Painted tiles are not clear/unstandable
      (painted ?y ?c)
      (increase (total-cost) 2)
    )
  )

  ; 4. Move Up (Cost 3)
  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (up ?x ?y)
      (clear ?y) ; Must move to a clear tile
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (clear ?x)        ; Old spot clears up
      (not (clear ?y))  ; New spot is occupied
      (increase (total-cost) 3)
    )
  )

  ; 5. Move Down (Cost 1)
  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
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

  ; 6. Move Right (Cost 1)
  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
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

  ; 7. Move Left (Cost 1)
  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
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