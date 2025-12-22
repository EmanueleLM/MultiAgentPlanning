(define (domain floortile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color)

  (:predicates
    (robot ?r - robot)
    (tile ?t - tile)
    (color ?c - color)

    (adj ?t1 - tile ?t2 - tile)        ; adjacency (directed - include both directions in problem)
    (at ?r - robot ?t - tile)         ; robot location
    (unpainted ?t - tile)             ; tile is currently unpainted (true until painted)
    (painted ?t - tile ?c - color)    ; tile has been painted with a specific color

    (available ?c - color)            ; a color tool/brush is available (not held)
    (holding ?r - robot ?c - color)   ; robot is holding a color tool
    (empty ?r - robot)                ; robot is not holding any color (free hands)
  )

  (:functions
    (total-cost)                      ; accumulated numeric cost to be minimized
  )

  ;; Move robot along adjacency. Robots may NOT move onto a painted tile: target must be unpainted.
  (:action move
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (at ?r ?from)
                    (adj ?from ?to)
                    (unpainted ?to)
                   )
    :effect (and
              (not (at ?r ?from))
              (at ?r ?to)
              (increase (total-cost) 1)
            )
  )

  ;; Pick up a color tool. Requires the robot to have empty hands and the color to be available.
  (:action pick-color
    :parameters (?r - robot ?c - color)
    :precondition (and
                    (empty ?r)
                    (available ?c)
                   )
    :effect (and
              (holding ?r ?c)
              (not (available ?c))
              (not (empty ?r))
              (increase (total-cost) 1)
            )
  )

  ;; Drop a held color tool, making it available again and freeing the robot's hands.
  (:action drop-color
    :parameters (?r - robot ?c - color)
    :precondition (and
                    (holding ?r ?c)
                   )
    :effect (and
              (available ?c)
              (not (holding ?r ?c))
              (empty ?r)
              (increase (total-cost) 1)
            )
  )

  ;; Paint an adjacent tile. Robot stays on its current tile. Target must be adjacent, unpainted, and the robot must hold the required color.
  ;; After painting the tile becomes painted with that color and is no longer unpainted. Robots are never allowed to stand on painted tiles because
  ;; move preconditions require target tiles to be unpainted.
  (:action paint-adjacent
    :parameters (?r - robot ?from - tile ?t - tile ?c - color)
    :precondition (and
                    (at ?r ?from)
                    (adj ?from ?t)
                    (unpainted ?t)
                    (holding ?r ?c)
                   )
    :effect (and
              (painted ?t ?c)
              (not (unpainted ?t))
              (increase (total-cost) 2)
            )
  )
)