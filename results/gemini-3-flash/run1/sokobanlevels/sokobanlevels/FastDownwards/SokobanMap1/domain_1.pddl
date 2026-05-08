(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location thing)
  (:predicates
    (at ?t - thing ?l - location)
    (clear ?l - location)
    (adj ?l1 ?l2 - location)
  )
  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at player ?from) (adj ?from ?to) (clear ?to))
    :effect (and (not (at player ?from)) (at player ?to) (clear ?from) (not (clear ?to)))
  )
  (:action push
    :parameters (?p_from ?b_from ?b_to - location)
    :precondition (and (at player ?p_from) (at box ?b_from) (adj ?p_from ?b_from) (adj ?b_from ?b_to) (clear ?b_to))
    :effect (and (not (at player ?p_from)) (at player ?b_from) (not (at box ?b_from)) (at box ?b_to) (clear ?p_from) (not (clear ?b_to)))
  )
)