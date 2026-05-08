(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types movable static - object
          player box - movable
          wall goal - static
          position)
  (:predicates
    (at_player ?pos - position)
    (at_box ?pos - position)
    (adjacent ?pos1 ?pos2 - position)
    (clear ?pos - position)
    (goal ?pos - position))

  (:action move_left
    :parameters (?p1 ?p2 - position)
    :precondition (and (at_player ?p1) (adjacent ?p1 ?p2) (clear ?p2))
    :effect (and (not (at_player ?p1)) (at_player ?p2) (clear ?p1) (not (clear ?p2))))

  (:action move_right
    :parameters (?p1 ?p2 - position)
    :precondition (and (at_player ?p1) (adjacent ?p1 ?p2) (clear ?p2))
    :effect (and (not (at_player ?p1)) (at_player ?p2) (clear ?p1) (not (clear ?p2))))

  (:action move_up
    :parameters (?p1 ?p2 - position)
    :precondition (and (at_player ?p1) (adjacent ?p1 ?p2) (clear ?p2))
    :effect (and (not (at_player ?p1)) (at_player ?p2) (clear ?p1) (not (clear ?p2))))

  (:action move_down
    :parameters (?p1 ?p2 - position)
    :precondition (and (at_player ?p1) (adjacent ?p1 ?p2) (clear ?p2))
    :effect (and (not (at_player ?p1)) (at_player ?p2) (clear ?p1) (not (clear ?p2))))

  (:action push_left
    :parameters (?p1 ?p2 ?p3 - position)
    :precondition (and (at_player ?p1) (at_box ?p2) (adjacent ?p1 ?p2) (adjacent ?p2 ?p3) (clear ?p3))
    :effect (and (not (at_player ?p1)) (at_player ?p2) (clear ?p1) (not (at_box ?p2)) (at_box ?p3) (not (clear ?p3))))

  (:action push_right
    :parameters (?p1 ?p2 ?p3 - position)
    :precondition (and (at_player ?p1) (at_box ?p2) (adjacent ?p1 ?p2) (adjacent ?p2 ?p3) (clear ?p3))
    :effect (and (not (at_player ?p1)) (at_player ?p2) (clear ?p1) (not (at_box ?p2)) (at_box ?p3) (not (clear ?p3))))

  (:action push_up
    :parameters (?p1 ?p2 ?p3 - position)
    :precondition (and (at_player ?p1) (at_box ?p2) (adjacent ?p1 ?p2) (adjacent ?p2 ?p3) (clear ?p3))
    :effect (and (not (at_player ?p1)) (at_player ?p2) (clear ?p1) (not (at_box ?p2)) (at_box ?p3) (not (clear ?p3))))

  (:action push_down
    :parameters (?p1 ?p2 ?p3 - position)
    :precondition (and (at_player ?p1) (at_box ?p2) (adjacent ?p1 ?p2) (adjacent ?p2 ?p3) (clear ?p3))
    :effect (and (not (at_player ?p1)) (at_player ?p2) (clear ?p1) (not (at_box ?p2)) (at_box ?p3) (not (clear ?p3))))
)