(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile item step)

  (:predicates
    (at ?r - robot ?t - tile)
    (adjacent ?t1 - tile ?t2 - tile)
    (painted ?t - tile)
    (has ?r - robot ?i - item)
    (item-at ?i - item ?t - tile)
    (delivered ?i - item ?t - tile)
    (delivery-target ?i - item ?t - tile)
    (step-target ?s - step ?t - tile)
    (step-successor ?s1 - step ?s2 - step)
    (step-initial ?s - step)
    (step-done ?s - step)
  )

  (:functions
    (total-cost)
  )

  ; Move between adjacent tiles. Cannot move into painted tiles.
  (:action move
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (at ?r ?from)
      (adjacent ?from ?to)
      (not (painted ?to))
    )
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
      (increase (total-cost) 1)
    )
  )

  ; Pick up an item that is at the current tile.
  (:action pick
    :parameters (?r - robot ?i - item ?t - tile)
    :precondition (and
      (at ?r ?t)
      (item-at ?i ?t)
      (not (has ?r ?i))
    )
    :effect (and
      (has ?r ?i)
      (not (item-at ?i ?t))
      (increase (total-cost) 1)
    )
  )

  ; Deliver an item at its delivery target tile. This is the only permitted drop action;
  ; dropping at non-target tiles is not allowed by design (hard constraint).
  (:action deliver
    :parameters (?r - robot ?i - item ?t - tile)
    :precondition (and
      (at ?r ?t)
      (has ?r ?i)
      (delivery-target ?i ?t)
      (not (delivered ?i ?t))
    )
    :effect (and
      (not (has ?r ?i))
      (delivered ?i ?t)
      (increase (total-cost) 1)
    )
  )

  ; Paint an adjacent tile to make it non-occupiable. Painting is only allowed from an adjacent tile
  ; to avoid the robot painting and remaining on the same tile (which would violate the painted-tiles rule).
  (:action paint-adjacent
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (at ?r ?from)
      (adjacent ?from ?to)
      (not (painted ?to))
    )
    :effect (and
      (painted ?to)
      (increase (total-cost) 2)
    )
  )

  ; Mark an initial step as done when the robot is at the step's target tile.
  (:action visit-step-initial
    :parameters (?r - robot ?t - tile ?s - step)
    :precondition (and
      (at ?r ?t)
      (step-target ?s ?t)
      (step-initial ?s)
      (not (step-done ?s))
    )
    :effect (and
      (step-done ?s)
      (increase (total-cost) 0)
    )
  )

  ; Mark a step as done when its predecessor step has been completed and the robot is at the step's tile.
  (:action visit-step-after
    :parameters (?r - robot ?t - tile ?s - step ?pred - step)
    :precondition (and
      (at ?r ?t)
      (step-target ?s ?t)
      (step-successor ?pred ?s)
      (step-done ?pred)
      (not (step-done ?s))
    )
    :effect (and
      (step-done ?s)
      (increase (total-cost) 0)
    )
  )

)