(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color)

  (:predicates
    (at ?r - robot ?t - tile)
    (hascolor ?r - robot ?c - color)
    (clear ?t - tile)
    (painted ?t - tile)
    (painted-with ?t - tile ?c - color)
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
  )

  (:functions
    (total-cost)
  )

  (:action change-color
    :parameters (?r - robot ?loc - tile ?cold - color ?cnew - color)
    :precondition (and
                    (at ?r ?loc)
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
                    (clear ?to)
                    (hascolor ?r ?c)
                  )
    :effect (and
              (painted ?to)
              (painted-with ?to ?c)
              (not (clear ?to))
              (increase (total-cost) 2)
            )
  )

  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                    (at ?r ?from)
                    (down ?from ?to)
                    (clear ?to)
                    (hascolor ?r ?c)
                  )
    :effect (and
              (painted ?to)
              (painted-with ?to ?c)
              (not (clear ?to))
              (increase (total-cost) 2)
            )
  )

  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (up ?from ?to)
                    (clear ?to)
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 3)
            )
  )

  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (down ?from ?to)
                    (clear ?to)
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 1)
            )
  )

  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (right ?from ?to)
                    (clear ?to)
                  )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 1)
            )
  )

  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (left ?from ?to)
                    (clear ?to)
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