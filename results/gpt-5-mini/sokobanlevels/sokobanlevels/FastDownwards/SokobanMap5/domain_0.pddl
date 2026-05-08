(define (domain sokoban_vertical_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box location)
  (:predicates
    (player_at ?pa - agent ?l - location)
    (box_at ?b - box ?l - location)
    (goal ?l - location)
    (adjacent_up ?from - location ?to - location)
    (free ?l - location)
  )

  (:action move_up
    :parameters (?pa - agent ?from - location ?to - location)
    :precondition (and
      (player_at ?pa ?from)
      (adjacent_up ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?pa ?from))
      (player_at ?pa ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action move_down
    :parameters (?pa - agent ?from - location ?to - location)
    :precondition (and
      (player_at ?pa ?from)
      (adjacent_up ?to ?from)
      (free ?to)
    )
    :effect (and
      (not (player_at ?pa ?from))
      (player_at ?pa ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action push_up
    :parameters (?pa - agent ?b - box ?pa_from - location ?box_loc - location ?box_to - location)
    :precondition (and
      (player_at ?pa ?pa_from)
      (box_at ?b ?box_loc)
      (adjacent_up ?pa_from ?box_loc)
      (adjacent_up ?box_loc ?box_to)
      (free ?box_to)
    )
    :effect (and
      (not (box_at ?b ?box_loc))
      (box_at ?b ?box_to)
      (not (player_at ?pa ?pa_from))
      (player_at ?pa ?box_loc)
      (free ?pa_from)
      (not (free ?box_loc))
      (not (free ?box_to))
    )
  )

  (:action push_down
    :parameters (?pa - agent ?b - box ?pa_from - location ?box_loc - location ?box_to - location)
    :precondition (and
      (player_at ?pa ?pa_from)
      (box_at ?b ?box_loc)
      (adjacent_up ?box_loc ?pa_from)
      (adjacent_up ?box_to ?box_loc)
      (free ?box_to)
    )
    :effect (and
      (not (box_at ?b ?box_loc))
      (box_at ?b ?box_to)
      (not (player_at ?pa ?pa_from))
      (player_at ?pa ?box_loc)
      (free ?pa_from)
      (not (free ?box_loc))
      (not (free ?box_to))
    )
  )
)