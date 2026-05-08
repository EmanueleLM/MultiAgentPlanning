(define (domain sokoban-map17)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location
    box
    agent
  )
  (:predicates
    (player-at ?l - location)
    (box-at ?b - box ?l - location)
    (is-goal ?l - location)
    (is-wall ?l - location)
    (up ?l1 ?l2 - location)
    (down ?l1 ?l2 - location)
    (left ?l1 ?l2 - location)
    (right ?l1 ?l2 - location)
  )
  (:functions (total-cost))

  (:actions
    ; Player movement actions
    (define (action move-player-up)
      :parameters (?from ?to - location)
      :precondition (and (player-at ?from)
                       (up ?from ?to)
                       (not (is-wall ?to))
                       (not (exists (?b - box) (box-at ?b ?to))))
      :effect (and (not (player-at ?from))
                  (player-at ?to)
                  (increase (total-cost) 1)))

    (define (action move-player-down)
      :parameters (?from ?to - location)
      :precondition (and (player-at ?from)
                       (down ?from ?to)
                       (not (is-wall ?to))
                       (not (exists (?b - box) (box-at ?b ?to))))
      :effect (and (not (player-at ?from))
                  (player-at ?to)
                  (increase (total-cost) 1)))

    (define (action move-player-left)
      :parameters (?from ?to - location)
      :precondition (and (player-at ?from)
                       (left ?from ?to)
                       (not (is-wall ?to))
                       (not (exists (?b - box) (box-at ?b ?to))))
      :effect (and (not (player-at ?from))
                  (player-at ?to)
                  (increase (total-cost) 1)))

    (define (action move-player-right)
      :parameters (?from ?to - location)
      :precondition (and (player-at ?from)
                       (right ?from ?to)
                       (not (is-wall ?to))
                       (not (exists (?b - box) (box-at ?b ?to))))
      :effect (and (not (player-at ?from))
                  (player-at ?to)
                  (increase (total-cost) 1)))

    ; Box pushing actions
    ; Player pushes up (player moves from below to box's old spot, box moves up)
    (define (action push-box-up)
      :parameters (?player_from ?box_at ?box_to - location ?b - box)
      :precondition (and (player-at ?player_from)
                       (up ?player_from ?box_at)  ; Player is immediately below the box
                       (box-at ?b ?box_at)
                       (up ?box_at ?box_to)       ; Box's target is immediately above the box
                       (not (is-wall ?box_to))
                       (not (exists (?other_b - box) (box-at ?other_b ?box_to)))) ; Box's target must be empty
      :effect (and (not (player-at ?player_from))
                  (player-at ?box_at)             ; Player moves to box's old position
                  (not (box-at ?b ?box_at))
                  (box-at ?b ?box_to)             ; Box moves to new position
                  (increase (total-cost) 1)))

    ; Player pushes down (player moves from above to box's old spot, box moves down)
    (define (action push-box-down)
      :parameters (?player_from ?box_at ?box_to - location ?b - box)
      :precondition (and (player-at ?player_from)
                       (down ?player_from ?box_at) ; Player is immediately above the box
                       (box-at ?b ?box_at)
                       (down ?box_at ?box_to)      ; Box's target is immediately below the box
                       (not (is-wall ?box_to))
                       (not (exists (?other_b - box) (box-at ?other_b ?box_to))))
      :effect (and (not (player-at ?player_from))
                  (player-at ?box_at)
                  (not (box-at ?b ?box_at))
                  (box-at ?b ?box_to)
                  (increase (total-cost) 1)))

    ; Player pushes left (player moves from right to box's old spot, box moves left)
    (define (action push-box-left)
      :parameters (?player_from ?box_at ?box_to - location ?b - box)
      :precondition (and (player-at ?player_from)
                       (left ?player_from ?box_at) ; Player is immediately to the right of the box
                       (box-at ?b ?box_at)
                       (left ?box_at ?box_to)      ; Box's target is immediately to the left of the box
                       (not (is-wall ?box_to))
                       (not (exists (?other_b - box) (box-at ?other_b ?box_to))))
      :effect (and (not (player-at ?player_from))
                  (player-at ?box_at)
                  (not (box-at ?b ?box_at))
                  (box-at ?b ?box_to)
                  (increase (total-cost) 1)))

    ; Player pushes right (player moves from left to box's old spot, box moves right)
    (define (action push-box-right)
      :parameters (?player_from ?box_at ?box_to - location ?b - box)
      :precondition (and (player-at ?player_from)
                       (right ?player_from ?box_at) ; Player is immediately to the left of the box
                       (box-at ?b ?box_at)
                       (right ?box_at ?box_to)     ; Box's target is immediately to the right of the box
                       (not (is-wall ?box_to))
                       (not (exists (?other_b - box) (box-at ?other_b ?box_to))))
      :effect (and (not (player-at ?player_from))
                  (player-at ?box_at)
                  (not (box-at ?b ?box_at))
                  (box-at ?b ?box_to)
                  (increase (total-cost) 1)))
  )
)