(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_free ?l - location)
    (adj ?l1 ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?from ?to - location ?dir - direction)
    :precondition (and
      (at_player ?from)
      (adj ?from ?to ?dir)
      (is_free ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (is_free ?from)
      (not (is_free ?to))
    )
  )

  (:action push
    :parameters (?p_loc ?b_loc ?b_new_loc - location ?dir - direction)
    :precondition (and
      (at_player ?p_loc)
      (at_box ?b_loc)
      (adj ?p_loc ?b_loc ?dir)
      (adj ?b_loc ?b_new_loc ?dir)
      (is_free ?b_new_loc)
    )
    :effect (and
      (not (at_player ?p_loc))
      (at_player ?b_loc)
      (not (at_box ?b_loc))
      (at_box ?b_new_loc)
      (is_free ?p_loc)
      (not (is_free ?b_new_loc))
    )
  )
)