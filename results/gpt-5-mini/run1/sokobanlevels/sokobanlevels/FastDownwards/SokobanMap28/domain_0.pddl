(define (domain sokoban_linear_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (right_of ?p1 - position ?p2 - position)
  )

  (:action move_right
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (right_of ?from ?to)
      (not (box_at box0 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_left
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (right_of ?to ?from)
      (not (box_at box0 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_right
    :parameters (?p - position ?q - position ?r - position)
    :precondition (and
      (player_at ?p)
      (box_at box0 ?q)
      (right_of ?p ?q)
      (right_of ?q ?r)
      (not (box_at box0 ?r))
    )
    :effect (and
      (not (box_at box0 ?q))
      (box_at box0 ?r)
      (not (player_at ?p))
      (player_at ?q)
    )
  )

  (:action push_left
    :parameters (?p - position ?q - position ?r - position)
    :precondition (and
      (player_at ?p)
      (box_at box0 ?q)
      (right_of ?q ?p)  ; player is immediately to the right of the box
      (right_of ?r ?q)  ; r is immediately to the left of q
      (not (box_at box0 ?r))
    )
    :effect (and
      (not (box_at box0 ?q))
      (box_at box0 ?r)
      (not (player_at ?p))
      (player_at ?q)
    )
  )
)