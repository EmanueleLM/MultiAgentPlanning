(define (domain sokoban_corridor)
  (:requirements :typing :negative-preconditions :strips)
  (:types cell agent box goal)

  (:predicates
    (adjacent ?a - cell ?b - cell)
    (at_player ?p - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (walkable ?c - cell)
    (goal_cell ?g - goal ?c - cell)
    (empty ?c - cell)
  )

  (:action move-up
    :parameters (?p - agent ?from - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?to ?from)
      (walkable ?to)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move-down
    :parameters (?p - agent ?from - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (walkable ?to)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action push-up
    :parameters (?p - agent ?bx - box ?pfrom - cell ?boxcell - cell ?boxtarget - cell)
    :precondition (and
      (at_player ?p ?pfrom)
      (at_box ?bx ?boxcell)
      (adjacent ?pfrom ?boxcell)
      (adjacent ?boxtarget ?boxcell)
      (walkable ?boxtarget)
      (empty ?boxtarget)
    )
    :effect (and
      (not (at_box ?bx ?boxcell))
      (at_box ?bx ?boxtarget)
      (not (at_player ?p ?pfrom))
      (at_player ?p ?boxcell)
      (not (empty ?boxtarget))
      (not (empty ?boxcell))
      (empty ?pfrom)
    )
  )

  (:action push-down
    :parameters (?p - agent ?bx - box ?pfrom - cell ?boxcell - cell ?boxtarget - cell)
    :precondition (and
      (at_player ?p ?pfrom)
      (at_box ?bx ?boxcell)
      (adjacent ?boxcell ?pfrom)
      (adjacent ?boxcell ?boxtarget)
      (walkable ?boxtarget)
      (empty ?boxtarget)
    )
    :effect (and
      (not (at_box ?bx ?boxcell))
      (at_box ?bx ?boxtarget)
      (not (at_player ?p ?pfrom))
      (at_player ?p ?boxcell)
      (not (empty ?boxtarget))
      (not (empty ?boxcell))
      (empty ?pfrom)
    )
  )
)