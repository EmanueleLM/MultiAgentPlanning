(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)
  (:predicates
    (at ?agent - agent ?pos - position)
    (box_at ?box - box ?pos - position)
    (goal_at ?pos - position)
    (free ?pos - position)
    (adjacent ?pos1 - position ?pos2 - position))

  (:action move
    :parameters (?agent - agent ?from - position ?to - position)
    :precondition (and (at ?agent ?from) (free ?to) (adjacent ?from ?to))
    :effect (and (not (at ?agent ?from)) (at ?agent ?to) (not (free ?to)) (free ?from)))

  (:action push
    :parameters (?agent - agent ?box_pos - position ?box - box ?new_box_pos - position)
    :precondition (and (at ?agent ?box_pos) (box_at ?box ?box_pos) (free ?new_box_pos)
                       (adjacent ?box_pos ?new_box_pos))
    :effect (and (not (box_at ?box ?box_pos)) (box_at ?box ?new_box_pos)
                 (at ?agent ?box_pos) (free ?box_pos) (not (free ?new_box_pos))))
)