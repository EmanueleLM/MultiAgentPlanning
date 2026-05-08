(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions :equality)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (not-clear ?t - tile) ; Tile is occupied or painted
    (painted ?t - tile ?c - color)
    
    ; T2 is below T1 (or T1 is above T2)
    (next-down ?t1 - tile ?t2 - tile)
    ; T2 is left of T1 (or T1 is right of T2)
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

  ; Robot at Y, paints X above Y. 
  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-has ?r ?c)
      (robot-at ?r ?y)
      (next-down ?x ?y) ; X is above Y
      (not (not-clear ?x)) ; X must be clear
    )
    :effect (and
      (not-clear ?x)
      (painted ?x ?c)
      (increase (total-cost) 2)
    )
  )

  ; Robot at Y, paints X below Y. 
  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-has ?r ?c)
      (robot-at ?r ?y)
      (next-down ?y ?x) ; X is below Y
      (not (not-clear ?x)) ; X must be clear
    )
    :effect (and
      (not-clear ?x)
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
      (not (not-clear ?y)) ; Y must be clear
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (not (not-clear ?x)) ; X is now clear
      (not-clear ?y) ; Y is now occupied
      (increase (total-cost) 3)
    )
  )

  ; Move X -> Y (Y is below X). Cost 1. 
  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (next-down ?x ?y) ; Y is below X
      (not (not-clear ?y)) ; Y must be clear
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (not (not-clear ?x)) ; X is now clear
      (not-clear ?y) ; Y is now occupied
      (increase (total-cost) 1)
    )
  )

  ; Move X -> Y (Y is right of X). Cost 1. 
  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (next-left ?y ?x) ; Y is right of X
      (not (not-clear ?y)) ; Y must be clear
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (not (not-clear ?x)) ; X is now clear
      (not-clear ?y) ; Y is now occupied
      (increase (total-cost) 1)
    )
  )

  ; Move X -> Y (Y is left of X). Cost 1.
  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (next-left ?x ?y) ; Y is left of X
      (not (not-clear ?y)) ; Y must be clear
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (not (not-clear ?x)) ; X is now clear
      (not-clear ?y) ; Y is now occupied
      (increase (total-cost) 1)
    )
  )
)