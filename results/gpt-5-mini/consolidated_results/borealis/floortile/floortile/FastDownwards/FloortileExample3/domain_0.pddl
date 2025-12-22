(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types robot tile color)

  (:predicates
    (at ?r - robot ?t - tile)
    (hascolor ?r - robot ?c - color)
    (color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
  )

  (:functions
    (available ?t - tile)
    (total-cost)
  )

  ; change-color: robot must be located (ensures At exists), swaps held color, costs 5
  (:action change-color
    :parameters (?r - robot ?loc - tile ?c_old - color ?c_new - color)
    :precondition (and
                    (at ?r ?loc)
                    (hascolor ?r ?c_old)
                    (color ?c_new)
                    (not (= ?c_old ?c_new))
                  )
    :effect (and
              (not (hascolor ?r ?c_old))
              (hascolor ?r ?c_new)
              (increase (total-cost) 5)
            )
  )

  ; paint-up: paint the tile immediately north of robot's current tile
  (:action paint-up
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                    (at ?r ?from)
                    (up ?from ?to)
                    (clear ?to)
                    (hascolor ?r ?c)
                    (color ?c)
                    (>= (available ?to) 1)
                  )
    :effect (and
              (painted ?to ?c)
              (not (clear ?to))
              (decrease (available ?to) 1)
              (increase (total-cost) 2)
            )
  )

  ; paint-down: paint the tile immediately south of robot's current tile
  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                    (at ?r ?from)
                    (down ?from ?to)
                    (clear ?to)
                    (hascolor ?r ?c)
                    (color ?c)
                    (>= (available ?to) 1)
                  )
    :effect (and
              (painted ?to ?c)
              (not (clear ?to))
              (decrease (available ?to) 1)
              (increase (total-cost) 2)
            )
  )

  ; move up (north)
  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (up ?from ?to)
                    (clear ?to)
                    (>= (available ?to) 1)
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 3)
            )
  )

  ; move down (south)
  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (down ?from ?to)
                    (clear ?to)
                    (>= (available ?to) 1)
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 1)
            )
  )

  ; move right (east)
  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (right ?from ?to)
                    (clear ?to)
                    (>= (available ?to) 1)
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 1)
            )
  )

  ; move left (west)
  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (left ?from ?to)
                    (clear ?to)
                    (>= (available ?to) 1)
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