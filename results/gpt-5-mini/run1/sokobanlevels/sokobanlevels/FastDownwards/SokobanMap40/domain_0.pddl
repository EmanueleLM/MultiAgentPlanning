(define (domain sokoban_corridor_97)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell)
  (:predicates
    (player_at ?c - cell)
    (box_at ?c - cell)
    (goal ?c - cell)
    (right_of ?a ?b - cell)
  )

  (:action move_right
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (right_of ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_left
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (right_of ?to ?from)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_right
    :parameters (?p - cell ?b - cell ?c - cell)
    :precondition (and
      (player_at ?p)
      (right_of ?p ?b)
      (right_of ?b ?c)
      (box_at ?b)
      (not (box_at ?c))
    )
    :effect (and
      (not (box_at ?b))
      (box_at ?c)
      (not (player_at ?p))
      (player_at ?b)
    )
  )

  (:action push_left
    :parameters (?p - cell ?b - cell ?c - cell)
    :precondition (and
      (player_at ?p)
      (right_of ?b ?p)
      (right_of ?c ?b)
      (box_at ?b)
      (not (box_at ?c))
    )
    :effect (and
      (not (box_at ?b))
      (box_at ?c)
      (not (player_at ?p))
      (player_at ?b)
    )
  )
)