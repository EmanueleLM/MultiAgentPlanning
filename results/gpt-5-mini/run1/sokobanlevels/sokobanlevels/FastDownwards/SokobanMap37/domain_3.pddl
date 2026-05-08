(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell)
  (:predicates
    (player_at ?c - cell)
    (box_at ?c - cell)
    (adj ?c1 - cell ?c2 - cell) 
    (goal ?c - cell)
  )

  (:action move_right
    :parameters (?x - cell ?y - cell)
    :precondition (and
      (player_at ?x)
      (adj ?x ?y)
      (not (box_at ?y))
    )
    :effect (and
      (not (player_at ?x))
      (player_at ?y)
    )
  )

  (:action move_left
    :parameters (?x - cell ?y - cell)
    :precondition (and
      (player_at ?y)
      (adj ?x ?y)
      (not (box_at ?x))
    )
    :effect (and
      (not (player_at ?y))
      (player_at ?x)
    )
  )

  (:action push_right
    :parameters (?x - cell ?y - cell ?z - cell)
    :precondition (and
      (player_at ?x)
      (box_at ?y)
      (adj ?x ?y)
      (adj ?y ?z)
      (not (box_at ?z))
    )
    :effect (and
      (not (player_at ?x))
      (player_at ?y)
      (not (box_at ?y))
      (box_at ?z)
    )
  )

  (:action push_left
    :parameters (?x - cell ?y - cell ?z - cell)
    :precondition (and
      (player_at ?z)
      (box_at ?y)
      (adj ?x ?y)
      (adj ?y ?z)
      (not (box_at ?x))
    )
    :effect (and
      (not (player_at ?z))
      (player_at ?y)
      (not (box_at ?y))
      (box_at ?x)
    )
  )
)