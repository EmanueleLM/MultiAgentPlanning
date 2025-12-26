(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions :equality)
  (:types robot tile color)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile) ; Tile is unpainted and unoccupied
    (painted ?t - tile ?c - color)
    ; T2 is below T1 (R2 > R1)
    (next-down ?t1 - tile ?t2 - tile)
    ; T2 is left of T1 (C2 > C1, due to grid indexing convention)
    (next-left ?t1 - tile ?t2 - tile) 
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?c_old - color ?c_new - color)
    :precondition (and
      (robot-has ?r ?c_old)
      (available-color ?c_new)
      (not (= ?c_old ?c_new))
    )
    :effect (and
      (not (robot-has ?r ?c_old))
      (robot-has ?r ?c_new)
      (increase (total-cost) 5)
    )
  )

  ; Robot at Y, paints X above Y. X is the target, Y is the robot location.
  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-has ?r ?c)
      (robot-at ?r ?y)
      (next-down ?x ?y) ; X is above Y
      (clear ?x)
    )
    :effect (and
      (not (clear ?x))
      (painted ?x ?c)
      (increase (total-cost) 2)
    )
  )

  ; Robot at Y, paints X below Y. X is the target, Y is the robot location.
  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-has ?r ?c)
      (robot-at ?r ?y)
      (next-down ?y ?x) ; X is below Y
      (clear ?x)
    )
    :effect (and
      (not (clear ?x))
      (painted ?x ?c)
      (increase (total-cost) 2)
    )
  )

  ; Move X -> Y (Y is above X). Cost 3.
  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (next-down ?y ?x) ; Y is above X
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

  ; Move X -> Y (Y is below X). Cost 1.
  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (next-down ?x ?y) ; Y is below X
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

  ; Move X -> Y (Y is right of X, C(Y) < C(X)). Cost 1.
  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (next-left ?y ?x) ; X is left of Y, so Y is right of X
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

  ; Move X -> Y (Y is left of X, C(Y) > C(X)). Cost 1.
  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (next-left ?x ?y) ; X is right of Y, so Y is left of X
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