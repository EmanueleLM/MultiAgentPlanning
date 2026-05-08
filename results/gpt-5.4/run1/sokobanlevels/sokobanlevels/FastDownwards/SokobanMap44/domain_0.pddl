(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    entity
    player box - entity
    location
  )

  (:predicates
    (at_player ?p - player ?l - location)
    (at_box ?b - box ?l - location)
    (goal_loc ?l - location)
    (adj_left ?from - location ?to - location)
    (adj_right ?from - location ?to - location)
    (clear ?l - location)
  )

  (:action move_left
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adj_left ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move_right
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adj_right ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action push_left
    :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?p ?player_from)
      (at_box ?b ?box_from)
      (adj_left ?player_from ?box_from)
      (adj_left ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (at_player ?p ?player_from))
      (at_player ?p ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
      (clear ?box_from)
      (not (clear ?box_to))
    )
  )

  (:action push_right
    :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?p ?player_from)
      (at_box ?b ?box_from)
      (adj_right ?player_from ?box_from)
      (adj_right ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (at_player ?p ?player_from))
      (at_player ?p ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
      (clear ?box_from)
      (not (clear ?box_to))
    )
  )
)