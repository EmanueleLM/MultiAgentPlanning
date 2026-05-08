(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile)                          ; tile is not occupied by a robot
    (painted ?t - tile ?c - color)             ; tile painted with color
    (unpainted ?t - tile)                      ; tile has not yet been painted
    (color-available ?c - color ?t - tile)     ; paint pot of color c at tile t (reusable)
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
  )

  (:functions (total-cost))

  ;; Move actions (directional). Each move costs 1.
  (:action move-up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and (robot-at ?r ?from) (up ?from ?to) (clear ?to))
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (not (clear ?to))
              (clear ?from)
              (increase (total-cost) 1)
            )
  )

  (:action move-down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and (robot-at ?r ?from) (down ?from ?to) (clear ?to))
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
    :precondition (and (robot-at ?r ?from) (left ?from ?to) (clear ?to))
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
    :precondition (and (robot-at ?r ?from) (right ?from ?to) (clear ?to))
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (not (clear ?to))
              (clear ?from)
              (increase (total-cost) 1)
            )
  )

  ;; Load a paint color from a pot at the robot's current tile.
  ;; This transitions the robot from its current held color (?cold) to a new one (?cnew).
  ;; Each load costs 1.
  (:action load-color
    :parameters (?r - robot ?t - tile ?cold - color ?cnew - color)
    :precondition (and
                    (robot-at ?r ?t)
                    (robot-has ?r ?cold)
                    (color-available ?cnew ?t)
                  )
    :effect (and
              (not (robot-has ?r ?cold))
              (robot-has ?r ?cnew)
              (increase (total-cost) 1)
            )
  )

  ;; Paint the tile the robot is standing on with the robot's current color.
  ;; Can only paint unpainted tiles. Painting costs 2.
  (:action paint-tile
    :parameters (?r - robot ?t - tile ?c - color)
    :precondition (and
                    (robot-at ?r ?t)
                    (robot-has ?r ?c)
                    (unpainted ?t)
                  )
    :effect (and
              (painted ?t ?c)
              (not (unpainted ?t))
              (increase (total-cost) 2)
            )
  )
)