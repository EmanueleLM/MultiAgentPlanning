(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color)
  
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    
    ; Tile status
    (clear ?t - tile) ; Tile is unpainted and free to be occupied
    (painted ?t - tile ?c - color)

    ; Connectivity predicates
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
  )
  
  (:functions (total-cost))

  ; 1. change-color (Cost: 5)
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

  ; 2. paint-up (Cost: 2)
  (:action paint-up
    :parameters (?r - robot ?x - tile ?y - tile ?c - color)
    :precondition (and
        (robot-at ?r ?x)
        (robot-has ?r ?c)
        (up ?x ?y) ; Y is above X
        (clear ?y) ; Y must be clear (unpainted)
    )
    :effect (and
        (painted ?y ?c)
        (not (clear ?y)) ; Painted tiles are not clear
        (increase (total-cost) 2)
    )
  )

  ; 3. paint-down (Cost: 2)
  (:action paint-down
    :parameters (?r - robot ?x - tile ?y - tile ?c - color)
    :precondition (and
        (robot-at ?r ?x)
        (robot-has ?r ?c)
        (down ?x ?y) ; Y is below X
        (clear ?y)
    )
    :effect (and
        (painted ?y ?c)
        (not (clear ?y))
        (increase (total-cost) 2)
    )
  )

  ; 4. up (Move) (Cost: 3)
  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
        (robot-at ?r ?x)
        (up ?x ?y)
        (clear ?y)
    )
    :effect (and
        (not (robot-at ?r ?x))
        (robot-at ?r ?y)
        (clear ?x)
        (not (clear ?y))
        (increase (total-cost) 3)
    )
  )

  ; 5. down (Move) (Cost: 1)
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

  ; 6. right (Move) (Cost: 1)
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

  ; 7. left (Move) (Cost: 1)
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