(define (domain floor-tile)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types robot tile color)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
  )

  (:functions
    (total-cost)
  )

  ;; change the robot's held color (switch spray). New color must be available.
  (:action change-color
    :parameters (?r - robot ?c - color ?c2 - color)
    :precondition (and
                    (robot-has ?r ?c)
                    (available-color ?c2)
                   )
    :effect (and
              (not (robot-has ?r ?c))
              (robot-has ?r ?c2)
              (increase (total-cost) 5)
            )
  )

  ;; paint the tile above the robot's current tile
  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
                    (robot-at ?r ?y)
                    (up ?y ?x)
                    (clear ?x)
                    (robot-has ?r ?c)
                   )
    :effect (and
              (painted ?x ?c)
              (not (clear ?x))
              (increase (total-cost) 2)
            )
  )

  ;; paint the tile below the robot's current tile
  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
                    (robot-at ?r ?y)
                    (down ?y ?x)
                    (clear ?x)
                    (robot-has ?r ?c)
                   )
    :effect (and
              (painted ?x ?c)
              (not (clear ?x))
              (increase (total-cost) 2)
            )
  )

  ;; move up (from ?x to ?y when up ?x ?y holds). Cannot move onto non-clear (i.e., painted or occupied) tiles.
  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
                    (robot-at ?r ?x)
                    (up ?x ?y)
                    (clear ?y)
                   )
    :effect (and
              (not (robot-at ?r ?x))
              (robot-at ?r ?y)
              (clear ?x)
              (not (clear ?y))
              (increase (total-cost) 3)
            )
  )

  ;; move down
  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
                    (robot-at ?r ?x)
                    (down ?x ?y)
                    (clear ?y)
                   )
    :effect (and
              (not (robot-at ?r ?x))
              (robot-at ?r ?y)
              (clear ?x)
              (not (clear ?y))
              (increase (total-cost) 1)
            )
  )

  ;; move right
  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
                    (robot-at ?r ?x)
                    (right ?x ?y)
                    (clear ?y)
                   )
    :effect (and
              (not (robot-at ?r ?x))
              (robot-at ?r ?y)
              (clear ?x)
              (not (clear ?y))
              (increase (total-cost) 1)
            )
  )

  ;; move left
  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
                    (robot-at ?r ?x)
                    (left ?x ?y)
                    (clear ?y)
                   )
    :effect (and
              (not (robot-at ?r ?x))
              (robot-at ?r ?y)
              (clear ?x)
              (not (clear ?y))
              (increase (total-cost) 1)
            )
  )
)