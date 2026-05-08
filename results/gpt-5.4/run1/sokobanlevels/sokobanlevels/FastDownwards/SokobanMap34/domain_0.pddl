(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    actor
    box
    location
  )

  (:predicates
    (at_player ?p - actor ?l - location)
    (at_box ?b - box ?l - location)
    (goal ?l - location)
    (adjacent_left ?from - location ?to - location)
    (adjacent_right ?from - location ?to - location)
    (clear ?l - location)
  )

  (:action move_left
    :parameters (?p - actor ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adjacent_left ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_right
    :parameters (?p - actor ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adjacent_right ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push_left
    :parameters (?p - actor ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_loc)
      (adjacent_left ?player_loc ?box_loc)
      (adjacent_left ?box_loc ?dest)
      (clear ?dest)
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
      (clear ?player_loc)
      (not (clear ?dest))
    )
  )

  (:action push_right
    :parameters (?p - actor ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_loc)
      (adjacent_right ?player_loc ?box_loc)
      (adjacent_right ?box_loc ?dest)
      (clear ?dest)
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
      (clear ?player_loc)
      (not (clear ?dest))
    )
  )
)