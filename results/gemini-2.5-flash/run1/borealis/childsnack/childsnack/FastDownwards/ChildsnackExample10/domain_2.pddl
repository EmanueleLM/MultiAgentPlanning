(define (domain child-snack)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (is_regular_bread ?b - bread-portion) ; Added for explicit regular bread
    (no_gluten_content ?c - content-portion)
    (is_regular_content ?c - content-portion) ; Added for explicit regular content
    (at_kitchen_sandwich ?s - sandwich)
    (is_no_gluten ?s - sandwich) ; True if sandwich is gluten-free
    (is_regular_sandwich ?s - sandwich) ; Added for explicit regular sandwich
    (on_tray ?s - sandwich ?t - tray)
    (at ?t - tray ?p - place) ; Location of a tray
    (waiting ?c - child ?p - place) ; Child waiting at a place
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (served ?c - child)
    (notexist ?s - sandwich) ; Sandwich not yet made
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
      (notexist ?s)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (at_kitchen_sandwich ?s)
      (is_no_gluten ?s)
      (not (is_regular_sandwich ?s)) ; Ensure mutual exclusivity
      (not (notexist ?s))
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (is_regular_bread ?b)   ; Changed from (not (no_gluten_bread ?b))
      (is_regular_content ?c) ; Changed from (not (no_gluten_content ?c))
      (notexist ?s)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (at_kitchen_sandwich ?s)
      (not (is_no_gluten ?s)) ; Mark as not gluten-free
      (is_regular_sandwich ?s) ; Mark as regular sandwich
      (not (notexist ?s))
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (at ?t kitchen) ; Tray must be in the kitchen to put sandwiches on it
    )
    :effect (and
      (not (at_kitchen_sandwich ?s))
      (on_tray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (is_no_gluten ?s)
      (on_tray ?s ?t)
      (at ?t ?p) ; Tray must be at the same place as the child
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (waiting ?c ?p))
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (is_regular_sandwich ?s) ; Changed from (not (is_no_gluten ?s))
      (on_tray ?s ?t)
      (at ?t ?p) ; Tray must be at the same place as the child
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (waiting ?c ?p))
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (and
      (at ?t ?p1)
      (not (= ?p1 ?p2)) ; Must move to a different place
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)