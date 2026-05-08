(define (domain sokoban-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    agent
    box
    direction
  )

  (:predicates
    (is_wall ?l - location)
    (is_goal ?l - location)
    (at_player ?p - agent ?l - location)
    (at_box ?b - box ?l - location)
    (adjacent ?l1 ?l2 - location ?d - direction)
  )

  ;; Player moves to an empty adjacent location
  (:action move_player_up
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to dir_up)
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
      (adjacent ?from ?to dir_down)
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
      (adjacent ?from ?to dir_left)
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
      (adjacent ?from ?to dir_right)
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
      (adjacent ?player_loc ?box_curr dir_up) ; Player is below the box
      (adjacent ?box_curr ?box_next dir_up)   ; Box target is above the box
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
      (adjacent ?player_loc ?box_curr dir_down) ; Player is above the box
      (adjacent ?box_curr ?box_next dir_down)   ; Box target is below the box
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
      (adjacent ?player_loc ?box_curr dir_left) ; Player is right of the box
      (adjacent ?box_curr ?box_next dir_left)   ; Box target is left of the box
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
      (adjacent ?player_loc ?box_curr dir_right) ; Player is left of the box
      (adjacent ?box_curr ?box_next dir_right)   ; Box target is right of the box
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