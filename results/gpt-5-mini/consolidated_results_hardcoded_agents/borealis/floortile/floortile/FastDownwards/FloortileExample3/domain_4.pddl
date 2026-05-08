(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)

  (:predicates
    (at ?r - robot ?t - tile)                   ; robot r stands at tile t
    (hascolor ?r - robot ?c - color)            ; robot r currently holds color c
    (available-color ?c - color)                ; color c is available to switch to
    (clear ?t - tile)                           ; no robot stands on tile t and it is free to occupy
    (painted ?t - tile)                         ; tile t has been painted (any color)
    (painted-with ?t - tile ?c - color)         ; tile t painted with color c
    (up ?from - tile ?to - tile)                ; ?to is directly above ?from
    (right ?from - tile ?to - tile)             ; ?to is directly to the right of ?from
  )

  (:functions (total-cost))

  ;; change-color: switch robot r from ?cold to ?cnew (different colors).
  ;; Preconditions: robot currently has ?cold, ?cnew is available, and robot does not already have ?cnew.
  ;; Effects: robot no longer has ?cold, now has ?cnew, increase total-cost by 5.
  (:action change-color
    :parameters (?r - robot ?cold - color ?cnew - color)
    :precondition (and
      (hascolor ?r ?cold)
      (available-color ?cnew)
      (not (hascolor ?r ?cnew))
    )
    :effect (and
      (not (hascolor ?r ?cold))
      (hascolor ?r ?cnew)
      (increase (total-cost) 5)
    )
  )

  ;; paint-up: paint the tile that is above the robot's current tile.
  ;; Preconditions: robot at ?from, ?to is above ?from, ?to is clear (no robot), ?to not painted yet, robot has color ?c.
  ;; Effects: mark ?to painted and painted-with ?c, make ?to not clear, increase total-cost by 2.
  (:action paint-up
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
      (at ?r ?from)
      (up ?from ?to)
      (clear ?to)
      (not (painted ?to))
      (hascolor ?r ?c)
    )
    :effect (and
      (painted ?to)
      (painted-with ?to ?c)
      (not (clear ?to))
      (increase (total-cost) 2)
    )
  )

  ;; paint-down: paint the tile that is below the robot's current tile.
  ;; Uses up relation inversely: up ?to ?from means ?to is below ?from.
  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
      (at ?r ?from)
      (up ?to ?from)
      (clear ?to)
      (not (painted ?to))
      (hascolor ?r ?c)
    )
    :effect (and
      (painted ?to)
      (painted-with ?to ?c)
      (not (clear ?to))
      (increase (total-cost) 2)
    )
  )

  ;; up: robot moves from ?from to the tile above ?from (?to).
  ;; Preconditions: robot at ?from, up ?from ?to, ?to is clear, ?to not painted (robots cannot stand on painted tiles).
  ;; Effects: robot moves to ?to, ?from becomes clear, ?to becomes not clear, increase total-cost by 3.
  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (at ?r ?from)
      (up ?from ?to)
      (clear ?to)
      (not (painted ?to))
    )
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 3)
    )
  )

  ;; down: robot moves from ?from to the tile below ?from (?to) using up inverse.
  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (at ?r ?from)
      (up ?to ?from)
      (clear ?to)
      (not (painted ?to))
    )
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  ;; right: robot moves from ?from to the tile to the right ?to.
  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (at ?r ?from)
      (right ?from ?to)
      (clear ?to)
      (not (painted ?to))
    )
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  ;; left: robot moves from ?from to the tile to the left ?to using right inverse.
  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (at ?r ?from)
      (right ?to ?from)
      (clear ?to)
      (not (painted ?to))
    )
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )
)