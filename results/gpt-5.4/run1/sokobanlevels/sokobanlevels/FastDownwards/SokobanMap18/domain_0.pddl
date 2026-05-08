(define (domain sokoban_single_column_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    player
    box
  )

  (:predicates
    (player_at ?p - player ?l - location)
    (box_at ?b - box ?l - location)
    (up ?from - location ?to - location)
    (down ?from - location ?to - location)
    (goal_cell ?l - location)
  )

  (:action move_up
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (player_at ?p ?from)
      (up ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  (:action move_down
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (player_at ?p ?from)
      (down ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  (:action push_up
    :parameters (?p - player ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (player_at ?p ?player_loc)
      (box_at ?b ?box_loc)
      (up ?player_loc ?box_loc)
      (up ?box_loc ?dest)
      (not (box_at ?b ?dest))
    )
    :effect (and
      (not (player_at ?p ?player_loc))
      (player_at ?p ?box_loc)
      (not (box_at ?b ?box_loc))
      (box_at ?b ?dest)
    )
  )

  (:action push_down
    :parameters (?p - player ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (player_at ?p ?player_loc)
      (box_at ?b ?box_loc)
      (down ?player_loc ?box_loc)
      (down ?box_loc ?dest)
      (not (box_at ?b ?dest))
    )
    :effect (and
      (not (player_at ?p ?player_loc))
      (player_at ?p ?box_loc)
      (not (box_at ?b ?box_loc))
      (box_at ?b ?dest)
    )
  )
)