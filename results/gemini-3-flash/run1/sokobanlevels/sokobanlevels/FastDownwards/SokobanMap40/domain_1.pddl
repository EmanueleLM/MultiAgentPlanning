(define (domain sokoban_map_40)
  (:requirements :strips :typing)
  (:types loc)
  (:predicates
    (at_player ?l - loc)
    (at_box ?l - loc)
    (is_clear ?l - loc)
    (next ?l1 ?l2 - loc) ;; l1 is immediately left of l2
  )

  (:action move_left
    :parameters (?from - loc ?to - loc)
    :precondition (and (at_player ?from) (next ?to ?from) (is_clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (not (is_clear ?to)) (is_clear ?from))
  )

  (:action move_right
    :parameters (?from - loc ?to - loc)
    :precondition (and (at_player ?from) (next ?from ?to) (is_clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (not (is_clear ?to)) (is_clear ?from))
  )

  (:action push_left
    :parameters (?p_from - loc ?b_from - loc ?b_to - loc)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (next ?b_from ?p_from) (next ?b_to ?b_from) (is_clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (not (is_clear ?b_to)) (is_clear ?p_from))
  )

  (:action push_right
    :parameters (?p_from - loc ?b_from - loc ?b_to - loc)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (next ?p_from ?b_from) (next ?b_from ?b_to) (is_clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (not (is_clear ?b_to)) (is_clear ?p_from))
  )
)