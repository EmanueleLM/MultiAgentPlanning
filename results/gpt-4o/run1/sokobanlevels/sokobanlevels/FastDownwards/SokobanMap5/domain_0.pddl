(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location movable)
  (:predicates
    (at ?m - movable ?l - location)
    (adjacent ?l1 - location ?l2 - location)
    (goal-at ?l - location)
    (clear ?l - location)
  )
  
  (:action move_player
    :parameters (?from - location ?to - location)
    :precondition (and
      (at player ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at player ?from))
      (at player ?to)
    )
  )

  (:action push_box
    :parameters (?player_loc - location ?box_loc - location ?dest_loc - location)
    :precondition (and
      (at player ?player_loc)
      (at box ?box_loc)
      (adjacent ?player_loc ?box_loc)
      (adjacent ?box_loc ?dest_loc)
      (clear ?dest_loc)
    )
    :effect (and
      (not (at player ?player_loc))
      (not (at box ?box_loc))
      (at player ?box_loc)
      (at box ?dest_loc)
    )
  )
)