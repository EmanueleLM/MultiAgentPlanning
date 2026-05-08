(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types box cell)

  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (occupied ?c - cell)
    (north_of ?c1 - cell ?c2 - cell)
    (south_of ?c1 - cell ?c2 - cell)
    (east_of ?c1 - cell ?c2 - cell)
    (west_of ?c1 - cell ?c2 - cell)
    (goal_cell ?c - cell)
  )

  (:action move_north
    :parameters (?from - cell ?to - cell)
    :precondition (and (player_at ?from) (north_of ?from ?to) (not (occupied ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action move_south
    :parameters (?from - cell ?to - cell)
    :precondition (and (player_at ?from) (south_of ?from ?to) (not (occupied ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action move_east
    :parameters (?from - cell ?to - cell)
    :precondition (and (player_at ?from) (east_of ?from ?to) (not (occupied ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action move_west
    :parameters (?from - cell ?to - cell)
    :precondition (and (player_at ?from) (west_of ?from ?to) (not (occupied ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action push_north
    :parameters (?p - cell ?boxcell - cell ?dest - cell ?b - box)
    :precondition (and (player_at ?p) (north_of ?p ?boxcell) (north_of ?boxcell ?dest) (box_at ?b ?boxcell) (not (occupied ?dest)))
    :effect (and
      (not (box_at ?b ?boxcell)) (box_at ?b ?dest)
      (not (occupied ?boxcell)) (occupied ?dest)
      (not (player_at ?p)) (player_at ?boxcell)
    )
  )

  (:action push_south
    :parameters (?p - cell ?boxcell - cell ?dest - cell ?b - box)
    :precondition (and (player_at ?p) (south_of ?p ?boxcell) (south_of ?boxcell ?dest) (box_at ?b ?boxcell) (not (occupied ?dest)))
    :effect (and
      (not (box_at ?b ?boxcell)) (box_at ?b ?dest)
      (not (occupied ?boxcell)) (occupied ?dest)
      (not (player_at ?p)) (player_at ?boxcell)
    )
  )

  (:action push_east
    :parameters (?p - cell ?boxcell - cell ?dest - cell ?b - box)
    :precondition (and (player_at ?p) (east_of ?p ?boxcell) (east_of ?boxcell ?dest) (box_at ?b ?boxcell) (not (occupied ?dest)))
    :effect (and
      (not (box_at ?b ?boxcell)) (box_at ?b ?dest)
      (not (occupied ?boxcell)) (occupied ?dest)
      (not (player_at ?p)) (player_at ?boxcell)
    )
  )

  (:action push_west
    :parameters (?p - cell ?boxcell - cell ?dest - cell ?b - box)
    :precondition (and (player_at ?p) (west_of ?p ?boxcell) (west_of ?boxcell ?dest) (box_at ?b ?boxcell) (not (occupied ?dest)))
    :effect (and
      (not (box_at ?b ?boxcell)) (box_at ?b ?dest)
      (not (occupied ?boxcell)) (occupied ?dest)
      (not (player_at ?p)) (player_at ?boxcell)
    )
  )
)