(define (domain sokoban_1d)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)
  (:predicates
    (player_at ?a - agent ?c - cell)
    (box_at ?b - box ?c - cell)
    (wall ?c - cell)
    (floor ?c - cell)
    (adjacent_right ?from - cell ?to - cell)
    (empty ?c - cell)
  )

  (:action move_right
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and (player_at ?a ?from) (adjacent_right ?from ?to) (floor ?to) (empty ?to))
    :effect (and
              (not (player_at ?a ?from))
              (player_at ?a ?to)
              (empty ?from)
              (not (empty ?to))
            )
  )

  (:action move_left
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and (player_at ?a ?from) (adjacent_right ?to ?from) (floor ?to) (empty ?to))
    :effect (and
              (not (player_at ?a ?from))
              (player_at ?a ?to)
              (empty ?from)
              (not (empty ?to))
            )
  )

  (:action push_right
    :parameters (?a - agent ?b - box ?from - cell ?mid - cell ?to - cell)
    :precondition (and
                    (player_at ?a ?from)
                    (box_at ?b ?mid)
                    (adjacent_right ?from ?mid)
                    (adjacent_right ?mid ?to)
                    (floor ?to)
                    (empty ?to)
                  )
    :effect (and
              (not (box_at ?b ?mid))
              (box_at ?b ?to)
              (not (player_at ?a ?from))
              (player_at ?a ?mid)
              (empty ?from)
              (not (empty ?to))
              (not (empty ?mid))
            )
  )

  (:action push_left
    :parameters (?a - agent ?b - box ?from - cell ?mid - cell ?to - cell)
    :precondition (and
                    (player_at ?a ?from)
                    (box_at ?b ?mid)
                    (adjacent_right ?mid ?from)
                    (adjacent_right ?to ?mid)
                    (floor ?to)
                    (empty ?to)
                  )
    :effect (and
              (not (box_at ?b ?mid))
              (box_at ?b ?to)
              (not (player_at ?a ?from))
              (player_at ?a ?mid)
              (empty ?from)
              (not (empty ?to))
              (not (empty ?mid))
            )
  )
)