(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile) ; Tile is free of robots and unpainted
    (painted ?t - tile ?c - color)
    (available-color ?c - color)
    
    ; Connectivity predicates
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
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
    :parameters (?r - robot ?y - tile ?x - tile ?c - color) ; R is at Y, paints X (above Y)
    :precondition (and
        (robot-has ?r ?c)
        (robot-at ?r ?y)
        (up ?y ?x)
        (clear ?x) ; Must be unpainted and unoccupied
    )
    :effect (and
        (painted ?x ?c)
        (not (clear ?x)) ; Tile is no longer clear once painted
        (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color) ; R is at Y, paints X (below Y)
    :precondition (and
        (robot-has ?r ?c)
        (robot-at ?r ?y)
        (down ?y ?x)
        (clear ?x)
    )
    :effect (and
        (painted ?x ?c)
        (not (clear ?x))
        (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?x - tile ?y - tile) ; R moves from X to Y (Y is above X)
    :precondition (and
        (robot-at ?r ?x)
        (up ?x ?y)
        (clear ?y) ; Target must be clear
    )
    :effect (and
        (not (robot-at ?r ?x))
        (robot-at ?r ?y)
        (clear ?x) ; Old tile becomes clear (assuming it was unpainted)
        (not (clear ?y)) ; New tile is occupied
        (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile) ; R moves from X to Y (Y is below X)
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
    :parameters (?r - robot ?x - tile ?y - tile) ; R moves from X to Y (Y is right of X)
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
    :parameters (?r - robot ?x - tile ?y - tile) ; R moves from X to Y (Y is left of X)
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