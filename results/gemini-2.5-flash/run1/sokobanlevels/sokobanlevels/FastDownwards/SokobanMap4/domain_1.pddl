(define (domain sokoban_single_column)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types player box location)
  (:predicates
    (at_player ?l - location)
    (at_box ?b - box ?l - location)
    (is_goal ?l - location)
    (successor ?l1 ?l2 - location) ; l2 is below l1 (higher row index)
    (predecessor ?l1 ?l2 - location) ; l2 is above l1 (lower row index)
  )

  (:functions (total-cost))

  ; Player moves UP to an empty cell
  (:action move_up)
    :parameters (?p - player ?from ?to - location)
    :precondition (and (at_player ?p ?from)
                        (predecessor ?from ?to)
                        (not (at_box b1 ?to)))
    :effect (and (not (at_player ?p ?from))
                  (at_player ?p ?to)
                  (increase (total-cost) 1))

  ; Player moves DOWN to an empty cell
  (:action move_down)
    :parameters (?p - player ?from ?to - location)
    :precondition (and (at_player ?p ?from)
                        (successor ?from ?to)
                        (not (at_box b1 ?to)))
    :effect (and (not (at_player ?p ?from))
                  (at_player ?p ?to)
                  (increase (total-cost) 1))

  ; Player pushes box UP
  ; Player at ?player_from, box at ?box_from, box moves to ?box_to.
  ; Player moves to ?box_from.
  (:action push_up)
    :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
    :precondition (and (at_player ?p ?player_from)
                        (at_box ?b ?box_from)
                        (predecessor ?player_from ?box_from) ; Player is below box_from
                        (predecessor ?box_from ?box_to)     ; Box can move to a cell above it
                        (not (at_box ?b ?box_to)))
    :effect (and (not (at_player ?p ?player_from))
                  (at_player ?p ?box_from)
                  (not (at_box ?b ?box_from))
                  (at_box ?b ?box_to)
                  (increase (total-cost) 1))

  ; Player pushes box DOWN
  ; Player at ?player_from, box at ?box_from, box moves to ?box_to.
  ; Player moves to ?box_from.
  (:action push_down)
    :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
    :precondition (and (at_player ?p ?player_from)
                        (at_box ?b ?box_from)
                        (successor ?player_from ?box_from) ; Player is above box_from
                        (successor ?box_from ?box_to)     ; Box can move to a cell below it
                        (not (at_box ?b ?box_to)))
    :effect (and (not (at_player ?p ?player_from))
                  (at_player ?p ?box_from)
                  (not (at_box ?b ?box_from))
                  (at_box ?b ?box_to)
                  (increase (total-cost) 1))
)