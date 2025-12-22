(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color)

  (:predicates
    (at ?r - robot ?t - tile)
    (hascolor ?r - robot ?c - color)
    (occupied ?t - tile)               ; a robot stands here
    (painted ?t - tile)                ; tile has been painted (any color)
    (painted-with ?t - tile ?c - color)
    (up ?from - tile ?to - tile)       ; ?to is above ?from
    (right ?from - tile ?to - tile)    ; ?to is right of ?from
  )

  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?cold - color ?cnew - color)
    :precondition (and
                    (hascolor ?r ?cold)
                    (not (hascolor ?r ?cnew))
                  )
    :effect (and
              (not (hascolor ?r ?cold))
              (hascolor ?r ?cnew)
              (increase (total-cost) 5)
            )
  )

  (:action paint-up
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                    (at ?r ?from)
                    (up ?from ?to)
                    (not (occupied ?to))
                    (not (painted ?to))
                    (hascolor ?r ?c)
                  )
    :effect (and
              (painted ?to)
              (painted-with ?to ?c)
              (increase (total-cost) 2)
            )
  )

  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                    (at ?r ?from)
                    (up ?to ?from)                ; ?to is below ?from
                    (not (occupied ?to))
                    (not (painted ?to))
                    (hascolor ?r ?c)
                  )
    :effect (and
              (painted ?to)
              (painted-with ?to ?c)
              (increase (total-cost) 2)
            )
  )

  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (up ?from ?to)
                    (not (occupied ?to))
                    (not (painted ?to))
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (not (occupied ?from))
              (occupied ?to)
              (increase (total-cost) 3)
            )
  )

  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (up ?to ?from)                ; move down by using up inverse
                    (not (occupied ?to))
                    (not (painted ?to))
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (not (occupied ?from))
              (occupied ?to)
              (increase (total-cost) 1)
            )
  )

  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (right ?from ?to)
                    (not (occupied ?to))
                    (not (painted ?to))
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (not (occupied ?from))
              (occupied ?to)
              (increase (total-cost) 1)
            )
  )

  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (right ?to ?from)             ; move left by using right inverse
                    (not (occupied ?to))
                    (not (painted ?to))
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (not (occupied ?from))
              (occupied ?to)
              (increase (total-cost) 1)
            )
  )
)