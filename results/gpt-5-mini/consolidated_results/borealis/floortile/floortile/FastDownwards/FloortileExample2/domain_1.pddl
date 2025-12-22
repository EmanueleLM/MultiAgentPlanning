(define (domain floor-tile)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types robot tile color)

  (:predicates
    (robot-at ?r - robot ?t - tile)        ; robot r is at tile t
    (robot-has ?r - robot ?c - color)     ; robot r currently carries color c
    (available-color ?c - color)          ; color c is available to change to
    (clear ?t - tile)                     ; tile t is clear (unoccupied and unpainted)
    (up ?from - tile ?to - tile)          ; moving up from -> to
    (down ?from - tile ?to - tile)        ; moving down from -> to
    (left ?from - tile ?to - tile)        ; moving left from -> to
    (right ?from - tile ?to - tile)       ; moving right from -> to
    (painted ?t - tile ?c - color)        ; tile t has been painted with color c
  )

  (:functions
    (total-cost)                          ; accumulated numeric cost
  )

  ;; change-color: robot changes the color it holds to another available color
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

  ;; paint-up: paint the tile above the robot's current tile
  ;; Only allowed when the target tile is clear (no robot and not painted).
  ;; After painting the target becomes painted with the robot's color and is no longer clear.
  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-at ?r ?y)
      (robot-has ?r ?c)
      (up ?y ?x)
      (clear ?x)
    )
    :effect (and
      (painted ?x ?c)
      (not (clear ?x))
      (increase (total-cost) 2)
    )
  )

  ;; paint-down: paint the tile below the robot's current tile
  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-at ?r ?y)
      (robot-has ?r ?c)
      (down ?y ?x)
      (clear ?x)
    )
    :effect (and
      (painted ?x ?c)
      (not (clear ?x))
      (increase (total-cost) 2)
    )
  )

  ;; move up: move robot from ?from to ?to where up ?from ?to holds
  ;; Cannot move into a non-clear (occupied or painted) tile.
  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (up ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 3)
    )
  )

  ;; move down
  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (down ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  ;; move right
  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (right ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  ;; move left
  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (left ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )
)