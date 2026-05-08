(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)

  (:predicates
    (at_player ?p - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (goal ?c - cell)
    (adjacent ?from - cell ?to - cell)
    (empty ?c - cell)
  )

  (:action move
    :parameters (?p - agent ?from - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action push
    :parameters (?p - agent ?pfrom - cell ?boxcell - cell ?target - cell ?b - box)
    :precondition (and
      (at_player ?p ?pfrom)
      (adjacent ?pfrom ?boxcell)
      (at_box ?b ?boxcell)
      (adjacent ?boxcell ?target)
      (empty ?target)
    )
    :effect (and
      (not (at_box ?b ?boxcell))
      (at_box ?b ?target)
      (not (at_player ?p ?pfrom))
      (at_player ?p ?boxcell)
      (empty ?pfrom)
      (not (empty ?target))
    )
  )
)