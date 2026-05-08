(define (domain sokoban_map_47)
  (:requirements :strips :typing)
  (:types location box)
  (:predicates
    (at_player ?l - location)
    (at_box ?b - box ?l - location)
    (is_right ?l1 ?l2 - location)
    (is_left ?l1 ?l2 - location)
    (clear ?l - location)
  )

  (:action move_right
    :parameters (?from ?to - location)
    :precondition (and (at_player ?from) (is_right ?from ?to) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action move_left
    :parameters (?from ?to - location)
    :precondition (and (at_player ?from) (is_left ?from ?to) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action push_right
    :parameters (?p_from ?b_loc ?b_to - location ?b - box)
    :precondition (and (at_player ?p_from) (at_box ?b ?b_loc) (is_right ?p_from ?b_loc) (is_right ?b_loc ?b_to) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_loc) (not (at_box ?b ?b_loc)) (at_box ?b ?b_to) (clear ?p_from) (not (clear ?b_to)))
  )

  (:action push_left
    :parameters (?p_from ?b_loc ?b_to - location ?b - box)
    :precondition (and (at_player ?p_from) (at_box ?b ?b_loc) (is_left ?p_from ?b_loc) (is_left ?b_loc ?b_to) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_loc) (not (at_box ?b ?b_loc)) (at_box ?b ?b_to) (clear ?p_from) (not (clear ?b_to)))
  )
)