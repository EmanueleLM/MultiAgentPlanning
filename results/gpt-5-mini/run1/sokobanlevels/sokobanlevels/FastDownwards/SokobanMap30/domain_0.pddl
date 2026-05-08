(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell agent box)

  (:predicates
    (player_at ?p - agent ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?c - cell)
    (left_of ?from - cell ?to - cell)
    (right_of ?from - cell ?to - cell)
    (up_of ?from - cell ?to - cell)
    (down_of ?from - cell ?to - cell)
  )

  ;; move left: player moves into an adjacent left cell if no box occupies it
  (:action move_left
    :parameters (?p - agent ?b - box ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (left_of ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  ;; push left: player is immediately right of box and pushes it left into an empty cell
  (:action push_left
    :parameters (?p - agent ?b - box ?pfrom - cell ?boxfrom - cell ?boxto - cell)
    :precondition (and
      (player_at ?p ?pfrom)
      (left_of ?pfrom ?boxfrom)
      (left_of ?boxfrom ?boxto)
      (box_at ?b ?boxfrom)
      (not (box_at ?b ?boxto))
    )
    :effect (and
      (not (box_at ?b ?boxfrom))
      (box_at ?b ?boxto)
      (not (player_at ?p ?pfrom))
      (player_at ?p ?boxfrom)
    )
  )

  ;; move right: player moves into an adjacent right cell if no box occupies it
  (:action move_right
    :parameters (?p - agent ?b - box ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (right_of ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  ;; push right: player is immediately left of box and pushes it right into an empty cell
  (:action push_right
    :parameters (?p - agent ?b - box ?pfrom - cell ?boxfrom - cell ?boxto - cell)
    :precondition (and
      (player_at ?p ?pfrom)
      (right_of ?pfrom ?boxfrom)
      (right_of ?boxfrom ?boxto)
      (box_at ?b ?boxfrom)
      (not (box_at ?b ?boxto))
    )
    :effect (and
      (not (box_at ?b ?boxfrom))
      (box_at ?b ?boxto)
      (not (player_at ?p ?pfrom))
      (player_at ?p ?boxfrom)
    )
  )

  ;; move up (syntactically present but there are no up_of facts in this instance)
  (:action move_up
    :parameters (?p - agent ?b - box ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (up_of ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  ;; push up (syntactically present but there are no up_of facts in this instance)
  (:action push_up
    :parameters (?p - agent ?b - box ?pfrom - cell ?boxfrom - cell ?boxto - cell)
    :precondition (and
      (player_at ?p ?pfrom)
      (up_of ?pfrom ?boxfrom)
      (up_of ?boxfrom ?boxto)
      (box_at ?b ?boxfrom)
      (not (box_at ?b ?boxto))
    )
    :effect (and
      (not (box_at ?b ?boxfrom))
      (box_at ?b ?boxto)
      (not (player_at ?p ?pfrom))
      (player_at ?p ?boxfrom)
    )
  )

  ;; move down (syntactically present but there are no down_of facts in this instance)
  (:action move_down
    :parameters (?p - agent ?b - box ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (down_of ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  ;; push down (syntactically present but there are no down_of facts in this instance)
  (:action push_down
    :parameters (?p - agent ?b - box ?pfrom - cell ?boxfrom - cell ?boxto - cell)
    :precondition (and
      (player_at ?p ?pfrom)
      (down_of ?pfrom ?boxfrom)
      (down_of ?boxfrom ?boxto)
      (box_at ?b ?boxfrom)
      (not (box_at ?b ?boxto))
    )
    :effect (and
      (not (box_at ?b ?boxfrom))
      (box_at ?b ?boxto)
      (not (player_at ?p ?pfrom))
      (player_at ?p ?boxfrom)
    )
  )

)