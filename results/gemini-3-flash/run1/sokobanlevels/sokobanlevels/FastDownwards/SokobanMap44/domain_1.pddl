(define (domain sokoban_map_44)
  (:requirements :strips :typing :negative-preconditions)
  (:types location)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_left_of ?l1 ?l2 - location)
  )

  (:action move_left
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (is_left_of ?to ?from)
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_right
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (is_left_of ?from ?to)
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push_left
    :parameters (?p_from ?b_from ?b_to - location)
    :precondition (and
      (at_player ?p_from)
      (at_box ?b_from)
      (is_left_of ?b_from ?p_from)
      (is_left_of ?b_to ?b_from)
      (not (at_box ?b_to))
    )
    :effect (and
      (not (at_player ?p_from))
      (at_player ?b_from)
      (not (at_box ?b_from))
      (at_box ?b_to)
    )
  )

  (:action push_right
    :parameters (?p_from ?b_from ?b_to - location)
    :precondition (and
      (at_player ?p_from)
      (at_box ?b_from)
      (is_left_of ?p_from ?b_from)
      (is_left_of ?b_from ?b_to)
      (not (at_box ?b_to))
    )
    :effect (and
      (not (at_player ?p_from))
      (at_player ?b_from)
      (not (at_box ?b_from))
      (at_box ?b_to)
    )
  )
)