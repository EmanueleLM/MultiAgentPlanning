(define (domain sokoban-map11)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_goal ?l - location)
    (connected ?l1 ?l2 - location)
  )
  (:functions (total-cost))

  ;; Action: Player moves up
  ;; Preconditions: Player at ?from, ?to is above ?from, ?to is empty (no box)
  ;; Effects: Player moves from ?from to ?to, cost increases
  (:action move_up
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected ?to ?from) ; ?to is directly above ?from
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Player moves down
  ;; Preconditions: Player at ?from, ?to is below ?from, ?to is empty (no box)
  ;; Effects: Player moves from ?from to ?to, cost increases
  (:action move_down
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected ?from ?to) ; ?to is directly below ?from
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Player pushes box up
  ;; Preconditions: Player at ?player_current, box at ?box_current,
  ;;                Player is below box, box_target is above box_current,
  ;;                box_target is empty (no other box)
  ;; Effects: Player moves to ?box_current, box moves to ?box_target, cost increases
  (:action push_up
    :parameters (?player_current - location ?box_current - location ?box_target - location)
    :precondition (and
      (at_player ?player_current)
      (at_box ?box_current)
      (connected ?box_current ?player_current) ; Player is directly below the box
      (connected ?box_target ?box_current) ; The box_target is directly above the box_current
      (not (at_box ?box_target))
    )
    :effect (and
      (not (at_player ?player_current))
      (at_player ?box_current) ; Player moves into the box's old spot
      (not (at_box ?box_current))
      (at_box ?box_target)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Player pushes box down
  ;; Preconditions: Player at ?player_current, box at ?box_current,
  ;;                Player is above box, box_target is below box_current,
  ;;                box_target is empty (no other box)
  ;; Effects: Player moves to ?box_current, box moves to ?box_target, cost increases
  (:action push_down
    :parameters (?player_current - location ?box_current - location ?box_target - location)
    :precondition (and
      (at_player ?player_current)
      (at_box ?box_current)
      (connected ?player_current ?box_current) ; Player is directly above the box
      (connected ?box_current ?box_target) ; The box_target is directly below the box_current
      (not (at_box ?box_target))
    )
    :effect (and
      (not (at_player ?player_current))
      (at_player ?box_current) ; Player moves into the box's old spot
      (not (at_box ?box_current))
      (at_box ?box_target)
      (increase (total-cost) 1)
    )
  )
)