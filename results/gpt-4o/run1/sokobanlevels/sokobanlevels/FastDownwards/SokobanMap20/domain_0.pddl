(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box goal tile wall location)
  (:predicates 
    (at_player ?p - player ?t - tile)
    (at_box ?b - box ?t - tile)
    (is_goal ?t - tile)
    (adjacent ?t1 - location ?t2 - location)
  )
  (:action move_player
    :parameters (?p - player ?from - tile ?to - tile)
    :precondition (and 
        (at_player ?p ?from)
        (adjacent ?from ?to)
        (not (exists (?b - box) (at_box ?b ?to)))
    )
    :effect (and
        (not (at_player ?p ?from))
        (at_player ?p ?to)
    )
  )
  (:action push_box
    :parameters (?p - player ?b - box ?from - tile ?to - tile ?behind - tile)
    :precondition (and
        (at_player ?p ?from)
        (at_box ?b ?to)
        (adjacent ?from ?to)
        (adjacent ?to ?behind)
        (not (exists (?x - box) (at_box ?x ?behind)))
    )
    :effect (and
        (not (at_player ?p ?from))
        (at_player ?p ?to)
        (not (at_box ?b ?to))
        (at_box ?b ?behind)
    )
  )
)