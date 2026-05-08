(define (domain sokoban_linear_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)
  (:predicates
    (player_at ?pl - player ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (right_of ?p1 - position ?p2 - position)
  )

  (:action move_right
    :parameters (?pl - player ?b - box ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (right_of ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  (:action move_left
    :parameters (?pl - player ?b - box ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (right_of ?to ?from)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  (:action push_right
    :parameters (?pl - player ?b - box ?p - position ?q - position ?r - position)
    :precondition (and
      (player_at ?pl ?p)
      (box_at ?b ?q)
      (right_of ?p ?q)
      (right_of ?q ?r)
      (not (box_at ?b ?r))
    )
    :effect (and
      (not (box_at ?b ?q))
      (box_at ?b ?r)
      (not (player_at ?pl ?p))
      (player_at ?pl ?q)
    )
  )

  (:action push_left
    :parameters (?pl - player ?b - box ?p - position ?q - position ?r - position)
    :precondition (and
      (player_at ?pl ?p)
      (box_at ?b ?q)
      (right_of ?q ?p)
      (right_of ?r ?q)
      (not (box_at ?b ?r))
    )
    :effect (and
      (not (box_at ?b ?q))
      (box_at ?b ?r)
      (not (player_at ?pl ?p))
      (player_at ?pl ?q)
    )
  )
)