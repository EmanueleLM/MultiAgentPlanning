(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    player
    box
    location
  )

  (:predicates
    (at_player ?p - player ?l - location)
    (at_box ?b - box ?l - location)
    (left ?from - location ?to - location)
    (right ?from - location ?to - location)
    (goal_location ?l - location)
  )

  (:action move_left
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (left ?from ?to)
      (not (at_box box_1 ?to))
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
      (right ?from ?to)
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action push_left
    :parameters (?p - player ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_loc)
      (left ?player_loc ?box_loc)
      (left ?box_loc ?dest)
      (not (at_player ?p ?dest))
      (not (at_box ?b ?dest))
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
    )
  )

  (:action push_right
    :parameters (?p - player ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_loc)
      (right ?player_loc ?box_loc)
      (right ?box_loc ?dest)
      (not (at_player ?p ?dest))
      (not (at_box ?b ?dest))
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
    )
  )
)