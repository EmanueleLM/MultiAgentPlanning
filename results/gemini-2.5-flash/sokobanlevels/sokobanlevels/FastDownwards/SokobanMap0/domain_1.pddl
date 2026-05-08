(define (domain sokoban-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    agent
    box
  )

  (:predicates
    (is_wall ?l - location)
    (is_goal ?l - location)
    (at_player ?p - agent ?l - location)
    (at_box ?b - box ?l - location)
    (connected_up ?l1 ?l2 - location)
    (connected_down ?l1 ?l2 - location)
    (connected_left ?l1 ?l2 - location)
    (connected_right ?l1 ?l2 - location)
  )

  ;; Player moves to an empty adjacent location
  (:action move_player_up
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (connected_up ?from ?to)
      (not (is_wall ?to))
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move_player_down
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (connected_down ?from ?to)
      (not (is_wall ?to))
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move_player_left
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (connected_left ?from ?to)
      (not (is_wall ?to))
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move_player_right
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (connected_right ?from ?to)
      (not (is_wall ?to))
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  ;; Player pushes a box to an adjacent location
  (:action push_box_up
    :parameters (?p - agent ?b - box ?player_loc - location ?box_curr - location ?box_next - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_curr)
      (connected_up ?player_loc ?box_curr) ; Player is immediately below the box (relative to direction of push)
      (connected_up ?box_curr ?box_next)   ; Box target is immediately above the box
      (not (is_wall ?box_next))
      (not (at_box box_1 ?box_next)) ; Ensure the box's target is empty
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_curr)           ; Player moves to box's old position
      (not (at_box ?b ?box_curr))
      (at_box ?b ?box_next)              ; Box moves to new position
    )
  )

  (:action push_box_down
    :parameters (?p - agent ?b - box ?player_loc - location ?box_curr - location ?box_next - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_curr)
      (connected_down ?player_loc ?box_curr) ; Player is immediately above the box
      (connected_down ?box_curr ?box_next)   ; Box target is immediately below the box
      (not (is_wall ?box_next))
      (not (at_box box_1 ?box_next))
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_curr)
      (not (at_box ?b ?box_curr))
      (at_box ?b ?box_next)
    )
  )

  (:action push_box_left
    :parameters (?p - agent ?b - box ?player_loc - location ?box_curr - location ?box_next - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_curr)
      (connected_left ?player_loc ?box_curr) ; Player is immediately right of the box
      (connected_left ?box_curr ?box_next)   ; Box target is immediately left of the box
      (not (is_wall ?box_next))
      (not (at_box box_1 ?box_next))
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_curr)
      (not (at_box ?b ?box_curr))
      (at_box ?b ?box_next)
    )
  )

  (:action push_box_right
    :parameters (?p - agent ?b - box ?player_loc - location ?box_curr - location ?box_next - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_curr)
      (connected_right ?player_loc ?box_curr) ; Player is immediately left of the box
      (connected_right ?box_curr ?box_next)   ; Box target is immediately right of the box
      (not (is_wall ?box_next))
      (not (at_box box_1 ?box_next))
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_curr)
      (not (at_box ?b ?box_curr))
      (at_box ?b ?box_next)
    )
  )
)