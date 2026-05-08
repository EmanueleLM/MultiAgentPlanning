(define (domain sokoban-map-45)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location
    box
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?b - box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (connected_left ?l1 ?l2 - location)
    (connected_right ?l1 ?l2 - location)
    (connected_up ?l1 ?l2 - location)
    (connected_down ?l1 ?l2 - location)
    (is_free ?l - location)
  )
  (:functions (total-cost))

  ;; Player Movement Actions
  (action move_left
    :parameters (?from ?to - location)
    :precondition (and
                    (at_player ?from)
                    (connected_left ?from ?to)
                    (is_free ?to)
                    (not (is_wall ?to))
                  )
    :effect (and
              (not (at_player ?from))
              (at_player ?to)
              (is_free ?from)
              (not (is_free ?to))
              (increase (total-cost) 1)
            )
  )

  (action move_right
    :parameters (?from ?to - location)
    :precondition (and
                    (at_player ?from)
                    (connected_right ?from ?to)
                    (is_free ?to)
                    (not (is_wall ?to))
                  )
    :effect (and
              (not (at_player ?from))
              (at_player ?to)
              (is_free ?from)
              (not (is_free ?to))
              (increase (total-cost) 1)
            )
  )

  (action move_up
    :parameters (?from ?to - location)
    :precondition (and
                    (at_player ?from)
                    (connected_up ?from ?to)
                    (is_free ?to)
                    (not (is_wall ?to))
                  )
    :effect (and
              (not (at_player ?from))
              (at_player ?to)
              (is_free ?from)
              (not (is_free ?to))
              (increase (total-cost) 1)
            )
  )

  (action move_down
    :parameters (?from ?to - location)
    :precondition (and
                    (at_player ?from)
                    (connected_down ?from ?to)
                    (is_free ?to)
                    (not (is_wall ?to))
                  )
    :effect (and
              (not (at_player ?from))
              (at_player ?to)
              (is_free ?from)
              (not (is_free ?to))
              (increase (total-cost) 1)
            )
  )

  ;; Box Pushing Actions
  (action push_left
    :parameters (?p_from ?b_from ?b_to - location ?b - box)
    :precondition (and
                    (at_player ?p_from)
                    (at_box ?b ?b_from)
                    (connected_right ?p_from ?b_from) ; Player is right of box, pushing left
                    (connected_left ?b_from ?b_to)   ; Box moves left
                    (is_free ?b_to)
                    (not (is_wall ?b_to))
                  )
    :effect (and
              (not (at_player ?p_from))
              (at_player ?b_from)
              (not (at_box ?b ?b_from))
              (at_box ?b ?b_to)
              (is_free ?p_from)
              (not (is_free ?b_from)) ; Player occupies b_from
              (not (is_free ?b_to))   ; Box occupies b_to
              (increase (total-cost) 1)
            )
  )

  (action push_right
    :parameters (?p_from ?b_from ?b_to - location ?b - box)
    :precondition (and
                    (at_player ?p_from)
                    (at_box ?b ?b_from)
                    (connected_left ?p_from ?b_from) ; Player is left of box, pushing right
                    (connected_right ?b_from ?b_to)   ; Box moves right
                    (is_free ?b_to)
                    (not (is_wall ?b_to))
                  )
    :effect (and
              (not (at_player ?p_from))
              (at_player ?b_from)
              (not (at_box ?b ?b_from))
              (at_box ?b ?b_to)
              (is_free ?p_from)
              (not (is_free ?b_from))
              (not (is_free ?b_to))
              (increase (total-cost) 1)
            )
  )

  (action push_up
    :parameters (?p_from ?b_from ?b_to - location ?b - box)
    :precondition (and
                    (at_player ?p_from)
                    (at_box ?b ?b_from)
                    (connected_down ?p_from ?b_from) ; Player is below box, pushing up
                    (connected_up ?b_from ?b_to)     ; Box moves up
                    (is_free ?b_to)
                    (not (is_wall ?b_to))
                  )
    :effect (and
              (not (at_player ?p_from))
              (at_player ?b_from)
              (not (at_box ?b ?b_from))
              (at_box ?b ?b_to)
              (is_free ?p_from)
              (not (is_free ?b_from))
              (not (is_free ?b_to))
              (increase (total-cost) 1)
            )
  )

  (action push_down
    :parameters (?p_from ?b_from ?b_to - location ?b - box)
    :precondition (and
                    (at_player ?p_from)
                    (at_box ?b ?b_from)
                    (connected_up ?p_from ?b_from)   ; Player is above box, pushing down
                    (connected_down ?b_from ?b_to)   ; Box moves down
                    (is_free ?b_to)
                    (not (is_wall ?b_to))
                  )
    :effect (and
              (not (at_player ?p_from))
              (at_player ?b_from)
              (not (at_box ?b ?b_from))
              (at_box ?b ?b_to)
              (is_free ?p_from)
              (not (is_free ?b_from))
              (not (is_free ?b_to))
              (increase (total-cost) 1)
            )
  )
)