(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)

  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (north_of ?c1 - cell ?c2 - cell)
    (south_of ?c1 - cell ?c2 - cell)
    (goal_cell ?c - cell)
  )

  (:action move_north
    :parameters (?from - cell ?to - cell)
    :precondition (and (player_at ?from) (north_of ?from ?to) (not (box_at box1 ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action move_south
    :parameters (?from - cell ?to - cell)
    :precondition (and (player_at ?from) (south_of ?from ?to) (not (box_at box1 ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action push_north
    :parameters (?p - cell ?b - cell ?t - cell)
    :precondition (and (player_at ?p) (north_of ?p ?b) (north_of ?b ?t) (box_at box1 ?b) (not (box_at box1 ?t)))
    :effect (and (not (box_at box1 ?b)) (box_at box1 ?t) (not (player_at ?p)) (player_at ?b))
  )

  (:action push_south
    :parameters (?p - cell ?b - cell ?t - cell)
    :precondition (and (player_at ?p) (south_of ?p ?b) (south_of ?b ?t) (box_at box1 ?b) (not (box_at box1 ?t)))
    :effect (and (not (box_at box1 ?b)) (box_at box1 ?t) (not (player_at ?p)) (player_at ?b))
  )
)