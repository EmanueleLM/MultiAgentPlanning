(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box wall goal - object
          position)
  (:predicates
    (at ?obj - object ?pos - position)
    (adjacent ?pos1 ?pos2 - position)
    (clear ?pos - position)
    (is_goal ?pos - position))

  (:action move
    :parameters (?p1 ?p2 - position)
    :precondition (and (at player ?p1) (adjacent ?p1 ?p2) (clear ?p2))
    :effect (and (not (at player ?p1)) (at player ?p2) (clear ?p1) (not (clear ?p2))))

  (:action push
    :parameters (?p1 ?p2 ?p3 - position)
    :precondition (and (at player ?p1) (at box ?p2) (adjacent ?p1 ?p2) (adjacent ?p2 ?p3) (clear ?p3))
    :effect (and (not (at player ?p1)) (at player ?p2) (clear ?p1)
                 (not (at box ?p2)) (at box ?p3) (not (clear ?p3))))
)