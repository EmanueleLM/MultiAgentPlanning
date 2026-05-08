(define (domain sokoban)
  (:requirements :strips :typing)
  (:types
    location direction
  )
  (:predicates
    (player_at ?l - location)
    (box_at ?l - location)
    (is_free ?l - location)
    (adj ?l1 ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?f ?t - location ?d - direction)
    :precondition (and (player_at ?f) (adj ?f ?t ?d) (is_free ?t))
    :effect (and (not (player_at ?f)) (player_at ?t))
  )

  (:action push
    :parameters (?pf ?bf ?bt - location ?d - direction)
    :precondition (and (player_at ?pf) (adj ?pf ?bf ?d) (box_at ?bf) (adj ?bf ?bt ?d) (is_free ?bt))
    :effect (and (not (player_at ?pf)) (player_at ?bf) (not (box_at ?bf)) (box_at ?bt) (is_free ?bf) (not (is_free ?bt)))
  )
)