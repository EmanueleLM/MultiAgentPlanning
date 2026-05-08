(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (allergic_gluten ?c - child)
    (served ?c - child) ; Renamed from 'fed' to match problem goal
    (no_gluten_bread ?b - bread-portion) ; Renamed from 'is_gluten_free_bread' to match problem init
    (no_gluten_content ?ct - content-portion) ; Added to match problem init
    (is_gluten_free_sandwich ?s - sandwich) ; To distinguish sandwich types
    (sandwich_ready ?s - sandwich) ; To track existence/readiness
    (on_tray ?s - sandwich ?t - tray)
    (at_tray ?t - tray ?p - place) ; Specific for trays
    (at_sandwich ?s - sandwich ?p - place) ; Specific for sandwiches
    (waiting ?c - child ?p - place) ; Specific for children, as per problem template
    (at_kitchen_bread ?b - bread-portion) ; Specific for bread location and availability
    (at_kitchen_content ?ct - content-portion) ; Specific for content location and availability
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (sandwich_ready ?s))
    )
    :effect (and
      (sandwich_ready ?s)
      (is_gluten_free_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (at_sandwich ?s kitchen)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (no_gluten_bread ?b)) ; Regular bread
      (not (no_gluten_content ?c)) ; Regular content
      (not (sandwich_ready ?s))
    )
    :effect (and
      (sandwich_ready ?s)
      (not (is_gluten_free_sandwich ?s)) ; Is a regular sandwich
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (at_sandwich ?s kitchen)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich_ready ?s)
      (at_sandwich ?s ?p)
      (at_tray ?t ?p)
      (not (on_tray ?s ?t)) ; A sandwich can only be put on a tray once.
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at_sandwich ?s ?p))
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (is_gluten_free_sandwich ?s)
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (sandwich_ready ?s) ; Must be an existing sandwich
      (not (served ?c)) ; Child not yet served
    )
    :effect (and
      (served ?c)
      (not (on_tray ?s ?t))
      (not (sandwich_ready ?s)) ; Sandwich is consumed
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not (allergic_gluten ?c))
      (waiting ?c ?p)
      (not (is_gluten_free_sandwich ?s)) ; Must be a regular sandwich
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (sandwich_ready ?s)
      (not (served ?c))
    )
    :effect (and
      (served ?c)
      (not (on_tray ?s ?t))
      (not (sandwich_ready ?s))
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (and
      (at_tray ?t ?p1)
      (not (= ?p1 ?p2))
    )
    :effect (and
      (not (at_tray ?t ?p1))
      (at_tray ?t ?p2)
    )
  )
)