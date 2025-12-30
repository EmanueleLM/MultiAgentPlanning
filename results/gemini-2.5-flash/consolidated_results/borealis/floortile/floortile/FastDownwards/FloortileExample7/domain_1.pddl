(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    
    ; Directional connectivity relations
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
  )
  (:functions (total-cost))

  ; 1. change-color (Cost 5)
  ; ?c is old color, ?c2 is new color
  (:action change-color
    :parameters (?r - robot ?c - color ?c2 - color)
    :precondition (and
        (robot-has ?r ?c)
        (available-color ?c2)
        (not (= ?c ?c2))
    )
    :effect (and
        (not (robot-has ?r ?c))
        (robot-has ?r ?c2)
        (increase (total-cost) 5)
    )
  )

  ; 2. paint-up (Cost 2)
  ; ?x is current tile, ?y is tile above (target)
  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
        (robot-at ?r ?x)
        (robot-has ?r ?c)
        (up ?x ?y)
        (clear ?y) ; Must be clear to be painted
    )
    :effect (and
        (not (clear ?y)) ; Tile is no longer clear (cannot be moved onto later)
        (painted ?y ?c)
        (increase (total-cost) 2)
    )
  )

  ; 3. paint-down (Cost 2)
  ; ?x is current tile, ?y is tile below (target)
  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
        (robot-at ?r ?x)
        (robot-has ?r ?c)
        (down ?x ?y)
        (clear ?y)
    )
    :effect (and
        (not (clear ?y))
        (painted ?y ?c)
        (increase (total-cost) 2)
    )
  )

  ; 4. up (Movement) (Cost 3)
  ; ?x is source, ?y is destination (above)
  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
        (robot-at ?r ?x)
        (up ?x ?y)
        (clear ?y) ; Destination must be clear
    )
    :effect (and
        (not (robot-at ?r ?x))
        (robot-at ?r ?y)
        (clear ?x) ; Source tile becomes clear
        (not (clear ?y)) ; Destination tile becomes occupied
        (increase (total-cost) 3)
    )
  )

  ; 5. down (Movement) (Cost 1)
  ; ?x is source, ?y is destination (below)
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

  ; 6. right (Movement) (Cost 1)
  ; ?x is source, ?y is destination (right)
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

  ; 7. left (Movement) (Cost 1)
  ; ?x is source, ?y is destination (left)
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