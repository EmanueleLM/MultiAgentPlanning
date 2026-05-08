(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell entity)
  (:predicates 
    (at ?e - entity ?c - cell)
    (adjacent ?c1 ?c2 - cell)
    (is_goal ?c - cell)
    (is_empty ?c - cell)
  )
  (:action move_player
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at player ?from)
      (adjacent ?from ?to)
      (is_empty ?to))
    :effect (and
      (not (at player ?from))
      (at player ?to)
      (is_empty ?from)
      (not (is_empty ?to)))
  )
  (:action push_box
    :parameters (?box_at - cell ?player_adj - cell ?box_to - cell)
    :precondition (and
      (at player ?player_adj)
      (at box ?box_at)
      (adjacent ?player_adj ?box_at)
      (adjacent ?box_at ?box_to)
      (is_empty ?box_to))
    :effect (and
      (not (at box ?box_at))
      (at box ?box_to)
      (not (is_empty ?box_to))
      (is_empty ?box_at)
      (not (at player ?player_adj))
      (at player ?box_at))
  )
)