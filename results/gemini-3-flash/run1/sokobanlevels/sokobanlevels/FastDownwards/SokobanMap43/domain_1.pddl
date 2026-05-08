(define (domain sokoban_map_43)
  (:requirements :strips :typing)
  (:types thing location direction)
  (:predicates
    (at ?t - thing ?l - location)
    (adj ?l1 ?l2 - location ?d - direction)
    (clear ?l - location)
    (is-player ?t - thing)
    (is-box ?t - thing)
  )

  (:action move
    :parameters (?p - thing ?from - location ?to - location ?d - direction)
    :precondition (and (is-player ?p) (at ?p ?from) (adj ?from ?to ?d) (clear ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (clear ?from) (not (clear ?to)))
  )

  (:action push
    :parameters (?p - thing ?b - thing ?p_pos - location ?b_pos - location ?b_next - location ?d - direction)
    :precondition (and (is-player ?p) (is-box ?b) (at ?p ?p_pos) (at ?b ?b_pos) (adj ?p_pos ?b_pos ?d) (adj ?b_pos ?b_next ?d) (clear ?b_next))
    :effect (and (not (at ?p ?p_pos)) (at ?p ?b_pos) (not (at ?b ?b_pos)) (at ?b ?b_next) (clear ?p_pos) (not (clear ?b_next)))
  )
)