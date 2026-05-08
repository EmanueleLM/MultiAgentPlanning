(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)

  (:predicates
    (at_player ?p - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (goal ?c - cell)
    (adjacent ?from - cell ?to - cell)
    (empty ?c - cell)
    (next ?a - cell ?b - cell)
  )

  (:action move_up
    :parameters (?from - cell ?to - cell ?p - agent)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (not (at_box b1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move_down
    :parameters (?from - cell ?to - cell ?p - agent)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (not (at_box b1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action push_up
    :parameters (?pfrom - cell ?boxcell - cell ?target - cell ?p - agent)
    :precondition (and
      (at_player ?p ?pfrom)
      (adjacent ?pfrom ?boxcell)
      (at_box b1 ?boxcell)
      (adjacent ?boxcell ?target)
      (not (at_box b1 ?target))
    )
    :effect (and
      (not (at_box b1 ?boxcell))
      (at_box b1 ?target)
      (not (at_player ?p ?pfrom))
      (at_player ?p ?boxcell)
    )
  )

  (:action push_down
    :parameters (?pfrom - cell ?boxcell - cell ?target - cell ?p - agent)
    :precondition (and
      (at_player ?p ?pfrom)
      (adjacent ?pfrom ?boxcell)
      (at_box b1 ?boxcell)
      (adjacent ?boxcell ?target)
      (not (at_box b1 ?target))
    )
    :effect (and
      (not (at_box b1 ?boxcell))
      (at_box b1 ?target)
      (not (at_player ?p ?pfrom))
      (at_player ?p ?boxcell)
    )
  )

)