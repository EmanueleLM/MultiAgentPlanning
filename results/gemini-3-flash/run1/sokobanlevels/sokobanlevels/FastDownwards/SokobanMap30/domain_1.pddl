(define (domain sokoban_map_30)
  (:requirements :strips :typing)
  (:types loc)
  (:predicates
    (at_player ?l - loc)
    (at_box ?l - loc)
    (clear ?l - loc)
    (left_of ?l1 - loc ?l2 - loc)
    (right_of ?l1 - loc ?l2 - loc)
    (up_of ?l1 - loc ?l2 - loc)
    (down_of ?l1 - loc ?l2 - loc)
  )

  (:action move_left
    :parameters (?from - loc ?to - loc)
    :precondition (and (at_player ?from) (left_of ?to ?from) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action move_right
    :parameters (?from - loc ?to - loc)
    :precondition (and (at_player ?from) (right_of ?to ?from) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action move_up
    :parameters (?from - loc ?to - loc)
    :precondition (and (at_player ?from) (up_of ?to ?from) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action move_down
    :parameters (?from - loc ?to - loc)
    :precondition (and (at_player ?from) (down_of ?to ?from) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action push_left
    :parameters (?p - loc ?b - loc ?t - loc)
    :precondition (and (at_player ?p) (at_box ?b) (left_of ?b ?p) (left_of ?t ?b) (clear ?t))
    :effect (and (not (at_player ?p)) (at_player ?b) (not (at_box ?b)) (at_box ?t) (clear ?p) (not (clear ?t)))
  )

  (:action push_right
    :parameters (?p - loc ?b - loc ?t - loc)
    :precondition (and (at_player ?p) (at_box ?b) (right_of ?b ?p) (right_of ?t ?b) (clear ?t))
    :effect (and (not (at_player ?p)) (at_player ?b) (not (at_box ?b)) (at_box ?t) (clear ?p) (not (clear ?t)))
  )

  (:action push_up
    :parameters (?p - loc ?b - loc ?t - loc)
    :precondition (and (at_player ?p) (at_box ?b) (up_of ?b ?p) (up_of ?t ?b) (clear ?t))
    :effect (and (not (at_player ?p)) (at_player ?b) (not (at_box ?b)) (at_box ?t) (clear ?p) (not (clear ?t)))
  )

  (:action push_down
    :parameters (?p - loc ?b - loc ?t - loc)
    :precondition (and (at_player ?p) (at_box ?b) (down_of ?b ?p) (down_of ?t ?b) (clear ?t))
    :effect (and (not (at_player ?p)) (at_player ?b) (not (at_box ?b)) (at_box ?t) (clear ?p) (not (clear ?t)))
  )
)