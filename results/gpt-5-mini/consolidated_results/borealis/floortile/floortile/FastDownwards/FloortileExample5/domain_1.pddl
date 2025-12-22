(define (domain floor-tile)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types robot tile color)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile)                     ; tile unoccupied and available for a robot to move onto
    (painted ?t - tile ?c - color)        ; tile painted with color
    (unpainted ?t - tile)                 ; tile has not yet been painted
    (available-color ?c - color)          ; color available to switch to
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
  )

  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?t - tile ?cold - color ?cnew - color)
    :precondition (and
                    (robot-at ?r ?t)
                    (robot-has ?r ?cold)
                    (available-color ?cnew)
                  )
    :effect (and
              (not (robot-has ?r ?cold))
              (robot-has ?r ?cnew)
              (increase (total-cost) 5)
            )
  )

  (:action paint-up
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                    (robot-at ?r ?from)
                    (robot-has ?r ?c)
                    (up ?from ?to)
                    (clear ?to)
                    (unpainted ?to)
                  )
    :effect (and
              (painted ?to ?c)
              (not (unpainted ?to))
              (not (clear ?to))
              (increase (total-cost) 2)
            )
  )

  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                    (robot-at ?r ?from)
                    (robot-has ?r ?c)
                    (down ?from ?to)
                    (clear ?to)
                    (unpainted ?to)
                  )
    :effect (and
              (painted ?to ?c)
              (not (unpainted ?to))
              (not (clear ?to))
              (increase (total-cost) 2)
            )
  )

  (:action move-up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (robot-at ?r ?from)
                    (up ?from ?to)
                    (clear ?to)
                    (unpainted ?to)
                  )
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (not (clear ?to))
              (clear ?from)
              (increase (total-cost) 3)
            )
  )

  (:action move-down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (robot-at ?r ?from)
                    (down ?from ?to)
                    (clear ?to)
                    (unpainted ?to)
                  )
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (not (clear ?to))
              (clear ?from)
              (increase (total-cost) 1)
            )
  )

  (:action move-right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (robot-at ?r ?from)
                    (right ?from ?to)
                    (clear ?to)
                    (unpainted ?to)
                  )
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (not (clear ?to))
              (clear ?from)
              (increase (total-cost) 1)
            )
  )

  (:action move-left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (robot-at ?r ?from)
                    (left ?from ?to)
                    (clear ?to)
                    (unpainted ?to)
                  )
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (not (clear ?to))
              (clear ?from)
              (increase (total-cost) 1)
            )
  )
)