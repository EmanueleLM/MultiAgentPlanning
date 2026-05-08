(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    player box location
  )

  (:predicates
    (at_player ?p - player ?l - location)
    (at_box ?b - box ?l - location)
    (adjacent ?from - location ?to - location)
    (goal_location ?l - location)
  )

  (:action move
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_loc)
      (adjacent ?player_loc ?box_loc)
      (adjacent ?box_loc ?dest)
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