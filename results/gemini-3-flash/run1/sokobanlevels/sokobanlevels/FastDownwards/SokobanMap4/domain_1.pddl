(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_clear ?l - location)
    (next ?l_above ?l_below - location)
  )

  (:action move_up
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (next ?to ?from)
      (is_clear ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_down
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (next ?from ?to)
      (is_clear ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push_up
    :parameters (?p_from - location ?b_from - location ?b_to - location)
    :precondition (and
      (at_player ?p_from)
      (at_box ?b_from)
      (next ?b_from ?p_from)
      (next ?b_to ?b_from)
      (is_clear ?b_to)
    )
    :effect (and
      (not (at_player ?p_from))
      (at_player ?b_from)
      (not (at_box ?b_from))
      (at_box ?b_to)
      (is_clear ?b_from)
      (not (is_clear ?b_to))
    )
  )

  (:action push_down
    :parameters (?p_from - location ?b_from - location ?b_to - location)
    :precondition (and
      (at_player ?p_from)
      (at_box ?b_from)
      (next ?p_from ?b_from)
      (next ?b_from ?b_to)
      (is_clear ?b_to)
    )
    :effect (and
      (not (at_player ?p_from))
      (at_player ?b_from)
      (not (at_box ?b_from))
      (at_box ?b_to)
      (is_clear ?b_from)
      (not (is_clear ?b_to))
    )
  )
)