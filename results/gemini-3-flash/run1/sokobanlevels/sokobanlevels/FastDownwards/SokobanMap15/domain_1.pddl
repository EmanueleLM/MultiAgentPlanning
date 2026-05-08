(define (domain sokoban_map15)
  (:requirements :strips :typing)
  (:types loc)
  (:predicates
    (at_p ?l - loc)
    (at_b ?l - loc)
    (clear ?l - loc)
    (adj_d ?l1 ?l2 - loc)
    (adj_u ?l1 ?l2 - loc)
  )

  (:action move_d
    :parameters (?f ?t - loc)
    :precondition (and (at_p ?f) (adj_d ?f ?t) (clear ?t))
    :effect (and (not (at_p ?f)) (at_p ?t) (clear ?f) (not (clear ?t)))
  )

  (:action move_u
    :parameters (?f ?t - loc)
    :precondition (and (at_p ?f) (adj_u ?f ?t) (clear ?t))
    :effect (and (not (at_p ?f)) (at_p ?t) (clear ?f) (not (clear ?t)))
  )

  (:action push_d
    :parameters (?pf ?bf ?bt - loc)
    :precondition (and (at_p ?pf) (adj_d ?pf ?bf) (at_b ?bf) (adj_d ?bf ?bt) (clear ?bt))
    :effect (and (not (at_p ?pf)) (at_p ?bf) (not (at_b ?bf)) (at_b ?bt) (clear ?pf) (not (clear ?bt)))
  )

  (:action push_u
    :parameters (?pf ?bf ?bt - loc)
    :precondition (and (at_p ?pf) (adj_u ?pf ?bf) (at_b ?bf) (adj_u ?bf ?bt) (clear ?bt))
    :effect (and (not (at_p ?pf)) (at_p ?bf) (not (at_b ?bf)) (at_b ?bt) (clear ?pf) (not (clear ?bt)))
  )
)