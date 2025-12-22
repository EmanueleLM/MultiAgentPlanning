(define (domain floor-tile)
  (:requirements :typing :negative-preconditions :action-costs :strips)
  (:types robot tile color)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile)                     ; tile unoccupied and available for a robot to move onto / paint
    (painted ?t - tile ?c - color)        ; tile painted with color
    (available-color ?c - color)          ; color available to switch to
    (up ?from - tile ?to - tile)          ; ?to is the tile above ?from
    (right ?from - tile ?to - tile)       ; ?to is the tile to the right of ?from
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
                  )
    :effect (and
              (painted ?to ?c)
              (not (clear ?to))
              (increase (total-cost) 2)
            )
  )

  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                    (robot-at ?r ?from)
                    (robot-has ?r ?c)
                    (up ?to ?from)      ; use up reversed instead of a separate down predicate
                    (clear ?to)
                  )
    :effect (and
              (painted ?to ?c)
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
                    (up ?to ?from)       ; use up reversed instead of a separate down predicate
                    (clear ?to)
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
                    (right ?to ?from)    ; use right reversed instead of a separate left predicate
                    (clear ?to)
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