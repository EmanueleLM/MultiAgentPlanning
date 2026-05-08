(define (domain sokoban-map36)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    player box location - object
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (left_of ?l1 ?l2 - location)
    (right_of ?l1 ?l2 - location)
    (above ?l1 ?l2 - location)
    (below ?l1 ?l2 - location)
  )
  (:functions
    (total-cost) - number
  )

  (:action move_player_left
    :parameters (?p - player ?l_from ?l_to - location)
    :precondition (and
      (at_player ?l_from)
      (left_of ?l_to ?l_from)
      (not (is_wall ?l_to))
      (not (at_box ?l_to))
    )
    :effect (and
      (not (at_player ?l_from))
      (at_player ?l_to)
      (increase (total-cost) 1)
    )
  )

  (:action move_player_right
    :parameters (?p - player ?l_from ?l_to - location)
    :precondition (and
      (at_player ?l_from)
      (right_of ?l_to ?l_from)
      (not (is_wall ?l_to))
      (not (at_box ?l_to))
    )
    :effect (and
      (not (at_player ?l_from))
      (at_player ?l_to)
      (increase (total-cost) 1)
    )
  )

  (:action move_player_up
    :parameters (?p - player ?l_from ?l_to - location)
    :precondition (and
      (at_player ?l_from)
      (above ?l_to ?l_from)
      (not (is_wall ?l_to))
      (not (at_box ?l_to))
    )
    :effect (and
      (not (at_player ?l_from))
      (at_player ?l_to)
      (increase (total-cost) 1)
    )
  )

  (:action move_player_down
    :parameters (?p - player ?l_from ?l_to - location)
    :precondition (and
      (at_player ?l_from)
      (below ?l_to ?l_from)
      (not (is_wall ?l_to))
      (not (at_box ?l_to))
    )
    :effect (and
      (not (at_player ?l_from))
      (at_player ?l_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_box_left
    :parameters (?p - player ?b - box ?l_player_from ?l_box_from ?l_box_to - location)
    :precondition (and
      (at_player ?l_player_from)
      (at_box ?l_box_from)
      (left_of ?l_box_to ?l_box_from)
      (right_of ?l_player_from ?l_box_from)
      (not (is_wall ?l_box_to))
      (not (at_box ?l_box_to))
    )
    :effect (and
      (not (at_player ?l_player_from))
      (at_player ?l_box_from) ; Player moves to the box's previous spot
      (not (at_box ?l_box_from))
      (at_box ?l_box_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_box_right
    :parameters (?p - player ?b - box ?l_player_from ?l_box_from ?l_box_to - location)
    :precondition (and
      (at_player ?l_player_from)
      (at_box ?l_box_from)
      (right_of ?l_box_to ?l_box_from)
      (left_of ?l_player_from ?l_box_from)
      (not (is_wall ?l_box_to))
      (not (at_box ?l_box_to))
    )
    :effect (and
      (not (at_player ?l_player_from))
      (at_player ?l_box_from) ; Player moves to the box's previous spot
      (not (at_box ?l_box_from))
      (at_box ?l_box_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_box_up
    :parameters (?p - player ?b - box ?l_player_from ?l_box_from ?l_box_to - location)
    :precondition (and
      (at_player ?l_player_from)
      (at_box ?l_box_from)
      (above ?l_box_to ?l_box_from)
      (below ?l_player_from ?l_box_from)
      (not (is_wall ?l_box_to))
      (not (at_box ?l_box_to))
    )
    :effect (and
      (not (at_player ?l_player_from))
      (at_player ?l_box_from) ; Player moves to the box's previous spot
      (not (at_box ?l_box_from))
      (at_box ?l_box_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_box_down
    :parameters (?p - player ?b - box ?l_player_from ?l_box_from ?l_box_to - location)
    :precondition (and
      (at_player ?l_player_from)
      (at_box ?l_box_from)
      (below ?l_box_to ?l_box_from)
      (above ?l_player_from ?l_box_from)
      (not (is_wall ?l_box_to))
      (not (at_box ?l_box_to))
    )
    :effect (and
      (not (at_player ?l_player_from))
      (at_player ?l_box_from) ; Player moves to the box's previous spot
      (not (at_box ?l_box_from))
      (at_box ?l_box_to)
      (increase (total-cost) 1)
    )
  )
)