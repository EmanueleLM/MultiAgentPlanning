(define (domain sokoban)
  (:requirements :strips :typing)
  (:types loc dir)
  (:predicates
    (at_player ?l - loc)
    (at_box ?l - loc)
    (adj ?l1 ?l2 - loc ?d - dir)
    (is_clear ?l - loc)
  )

  (:action move
    :parameters (?f ?t - loc ?d - dir)
    :precondition (and (at_player ?f) (adj ?f ?t ?d) (is_clear ?t))
    :effect (and (not (at_player ?f)) (at_player ?t))
  )

  (:action push
    :parameters (?pf ?bf ?bt - loc ?d - dir)
    :precondition (and (at_player ?pf) (adj ?pf ?bf ?d) (at_box ?bf) (adj ?bf ?bt ?d) (is_clear ?bt))
    :effect (and (not (at_player ?pf)) (at_player ?bf) (not (at_box ?bf)) (at_box ?bt) (is_clear ?bf) (not (is_clear ?bt)))
  )
)