(define (domain sokoban)
  (:requirements :typing)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (adj ?l1 ?l2 - location ?d - direction)
    (is_free ?l - location)
  )

  (:action move
    :parameters (?from - location ?to - location ?dir - direction)
    :precondition (and
      (at_player ?from)
      (adj ?from ?to ?dir)
      (is_free ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push
    :parameters (?p_loc - location ?b_loc - location ?t_loc - location ?dir - direction)
    :precondition (and
      (at_player ?p_loc)
      (at_box ?b_loc)
      (adj ?p_loc ?b_loc ?dir)
      (adj ?b_loc ?t_loc ?dir)
      (is_free ?t_loc)
    )
    :effect (and
      (not (at_player ?p_loc))
      (at_player ?b_loc)
      (not (at_box ?b_loc))
      (at_box ?t_loc)
      (is_free ?b_loc)
      (not (is_free ?t_loc))
    )
  )
)