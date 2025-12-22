(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)                 ; tile is unpainted
    (painted ?t - tile ?c - color)    ; tile painted with color
    (occupied ?t - tile)              ; some robot occupies this tile
    (can-move-up ?from - tile ?to - tile)
    (can-move-down ?from - tile ?to - tile)
    (can-move-right ?from - tile ?to - tile)
    (can-move-left ?from - tile ?to - tile)
  )

  (:functions (total-cost))

  ;; change color action (generic, deletes any prior robot-has facts and sets new color)
  (:action change-color
    :parameters (?r - robot ?c - color)
    :precondition (and
                   (available-color ?c)
                   (not (robot-has ?r ?c)))
    :effect (and
             (not (robot-has ?r white))
             (not (robot-has ?r black))
             (robot-has ?r ?c)
             (increase (total-cost) 5))
  )

  ;; paint up: paint the tile immediately north of robot
  (:action paint-up
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                   (robot-at ?r ?from)
                   (can-move-up ?from ?to)
                   (clear ?to)
                   (not (occupied ?to))
                   (robot-has ?r ?c))
    :effect (and
             (painted ?to ?c)
             (not (clear ?to))
             (increase (total-cost) 2))
  )

  ;; paint down: paint the tile immediately south of robot
  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
                   (robot-at ?r ?from)
                   (can-move-down ?from ?to)
                   (clear ?to)
                   (not (occupied ?to))
                   (robot-has ?r ?c))
    :effect (and
             (painted ?to ?c)
             (not (clear ?to))
             (increase (total-cost) 2))
  )

  ;; move up (robot steps north)
  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                   (robot-at ?r ?from)
                   (can-move-up ?from ?to)
                   (clear ?to)
                   (not (occupied ?to)))
    :effect (and
             (not (robot-at ?r ?from))
             (robot-at ?r ?to)
             (occupied ?to)
             (not (occupied ?from))
             (increase (total-cost) 3))
  )

  ;; move down (robot steps south)
  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                   (robot-at ?r ?from)
                   (can-move-down ?from ?to)
                   (clear ?to)
                   (not (occupied ?to)))
    :effect (and
             (not (robot-at ?r ?from))
             (robot-at ?r ?to)
             (occupied ?to)
             (not (occupied ?from))
             (increase (total-cost) 1))
  )

  ;; move right (robot steps east)
  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                   (robot-at ?r ?from)
                   (can-move-right ?from ?to)
                   (clear ?to)
                   (not (occupied ?to)))
    :effect (and
             (not (robot-at ?r ?from))
             (robot-at ?r ?to)
             (occupied ?to)
             (not (occupied ?from))
             (increase (total-cost) 1))
  )

  ;; move left (robot steps west)
  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                   (robot-at ?r ?from)
                   (can-move-left ?from ?to)
                   (clear ?to)
                   (not (occupied ?to)))
    :effect (and
             (not (robot-at ?r ?from))
             (robot-at ?r ?to)
             (occupied ?to)
             (not (occupied ?from))
             (increase (total-cost) 1))
  )

)