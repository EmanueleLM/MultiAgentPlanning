(define (domain sokoban_single_box_corridor)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    player box location
  )

  (:predicates
    (player_at ?p - player ?l - location)
    (box_at ?b - box ?l - location)
    (goal ?l - location)
    (adj_up ?from - location ?to - location)
    (adj_down ?from - location ?to - location)
    (adj_left ?from - location ?to - location)
    (adj_right ?from - location ?to - location)
    (clear ?l - location)
  )

  (:action move_up
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (player_at ?p ?from)
      (adj_up ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_down
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (player_at ?p ?from)
      (adj_down ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_left
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (player_at ?p ?from)
      (adj_left ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_right
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (player_at ?p ?from)
      (adj_right ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push_up
    :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (player_at ?p ?player_from)
      (box_at ?b ?box_from)
      (adj_up ?player_from ?box_from)
      (adj_up ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (player_at ?p ?player_from))
      (player_at ?p ?box_from)
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (clear ?player_from)
      (not (clear ?box_from))
      (not (clear ?box_to))
    )
  )

  (:action push_down
    :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (player_at ?p ?player_from)
      (box_at ?b ?box_from)
      (adj_down ?player_from ?box_from)
      (adj_down ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (player_at ?p ?player_from))
      (player_at ?p ?box_from)
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (clear ?player_from)
      (not (clear ?box_from))
      (not (clear ?box_to))
    )
  )

  (:action push_left
    :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (player_at ?p ?player_from)
      (box_at ?b ?box_from)
      (adj_left ?player_from ?box_from)
      (adj_left ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (player_at ?p ?player_from))
      (player_at ?p ?box_from)
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (clear ?player_from)
      (not (clear ?box_from))
      (not (clear ?box_to))
    )
  )

  (:action push_right
    :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (player_at ?p ?player_from)
      (box_at ?b ?box_from)
      (adj_right ?player_from ?box_from)
      (adj_right ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (player_at ?p ?player_from))
      (player_at ?p ?box_from)
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (clear ?player_from)
      (not (clear ?box_from))
      (not (clear ?box_to))
    )
  )
)