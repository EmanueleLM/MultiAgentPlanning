(define (domain floor-tiles)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot pos color)

  (:predicates
    (at ?r - robot ?p - pos)
    (right ?p1 - pos ?p2 - pos)
    (left ?p1 - pos ?p2 - pos)
    (up ?p1 - pos ?p2 - pos)
    (down ?p1 - pos ?p2 - pos)
    (carrying ?r - robot ?c - color)
    (clear ?p - pos)
    (painted ?p - pos ?c - color)
    (supply ?p - pos ?c - color)
  )

  (:functions (total-cost))

  ;; Movement actions: distinct semantics for each direction
  (:action move-right
    :parameters (?r - robot ?from - pos ?to - pos)
    :precondition (and (at ?r ?from) (right ?from ?to))
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (increase (total-cost) 1)
            )
  )

  (:action move-left
    :parameters (?r - robot ?from - pos ?to - pos)
    :precondition (and (at ?r ?from) (left ?from ?to))
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (increase (total-cost) 1)
            )
  )

  (:action move-up
    :parameters (?r - robot ?from - pos ?to - pos)
    :precondition (and (at ?r ?from) (up ?from ?to))
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (increase (total-cost) 1)
            )
  )

  (:action move-down
    :parameters (?r - robot ?from - pos ?to - pos)
    :precondition (and (at ?r ?from) (down ?from ?to))
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (increase (total-cost) 1)
            )
  )

  ;; Change the color the robot is carrying. Must be at a supply that provides the target color.
  ;; The action requires the robot currently carrying some color (?from) and that it is not already carrying the target (?to).
  (:action change-color
    :parameters (?r - robot ?from - color ?to - color ?p - pos)
    :precondition (and
                    (at ?r ?p)
                    (carrying ?r ?from)
                    (supply ?p ?to)
                    (not (carrying ?r ?to))
                  )
    :effect (and
              (not (carrying ?r ?from))
              (carrying ?r ?to)
              (increase (total-cost) 3)
            )
  )

  ;; Paint the tile located above the robot's current position. Requires the above-tile to be clear.
  (:action paint-up
    :parameters (?r - robot ?p - pos ?above - pos ?c - color)
    :precondition (and
                    (at ?r ?p)
                    (up ?p ?above)
                    (carrying ?r ?c)
                    (clear ?above)
                  )
    :effect (and
              (not (clear ?above))
              (painted ?above ?c)
              (increase (total-cost) 2)
            )
  )

  ;; Paint the tile located below the robot's current position. Requires the below-tile to be clear.
  (:action paint-down
    :parameters (?r - robot ?p - pos ?below - pos ?c - color)
    :precondition (and
                    (at ?r ?p)
                    (down ?p ?below)
                    (carrying ?r ?c)
                    (clear ?below)
                  )
    :effect (and
              (not (clear ?below))
              (painted ?below ?c)
              (increase (total-cost) 2)
            )
  )
)