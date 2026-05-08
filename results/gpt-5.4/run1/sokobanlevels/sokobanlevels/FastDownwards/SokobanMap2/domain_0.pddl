(define (domain sokoban_vertical_corridor)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    box
  )

  (:predicates
    (player_at ?l - location)
    (box_at ?b - box ?l - location)
    (adjacent_up ?from - location ?to - location)
    (adjacent_down ?from - location ?to - location)
    (goal_cell ?l - location)
  )

  (:action move_up
    :parameters (?from - location ?to - location)
    :precondition (and
      (player_at ?from)
      (adjacent_up ?from ?to)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_down
    :parameters (?from - location ?to - location)
    :precondition (and
      (player_at ?from)
      (adjacent_down ?from ?to)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_up
    :parameters (?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (player_at ?player_loc)
      (box_at b1 ?box_loc)
      (adjacent_up ?player_loc ?box_loc)
      (adjacent_up ?box_loc ?dest)
      (not (box_at b1 ?dest))
    )
    :effect (and
      (not (player_at ?player_loc))
      (player_at ?box_loc)
      (not (box_at b1 ?box_loc))
      (box_at b1 ?dest)
    )
  )

  (:action push_down
    :parameters (?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (player_at ?player_loc)
      (box_at b1 ?box_loc)
      (adjacent_down ?player_loc ?box_loc)
      (adjacent_down ?box_loc ?dest)
      (not (box_at b1 ?dest))
    )
    :effect (and
      (not (player_at ?player_loc))
      (player_at ?box_loc)
      (not (box_at b1 ?box_loc))
      (box_at b1 ?dest)
    )
  )
)