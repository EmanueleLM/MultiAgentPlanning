(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place) ; Tray location
    (at_kitchen_bread ?b - bread-portion) ; Bread available in kitchen
    (at_kitchen_content ?c - content-portion) ; Content available in kitchen
    (no_gluten_bread ?b - bread-portion) ; Property: bread is gluten-free
    (no_gluten_content ?c - content-portion) ; Property: content is gluten-free
    (notexist ?s - sandwich) ; Sandwich has not been made yet
    (at_kitchen_sandwich ?s - sandwich) ; Sandwich has been made and is in the kitchen
    (is_gluten_free_sandwich ?s - sandwich) ; Property: sandwich is gluten-free
    (on_tray ?s - sandwich ?t - tray) ; Sandwich is on a tray
    (allergic_gluten ?c - child) ; Property: child is allergic to gluten
    (not_allergic_gluten ?c - child) ; Property: child is not allergic to gluten
    (waiting ?c - child ?p - place) ; Child is waiting at a specific place
    (served ?c - child) ; Child has been served
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (no_gluten_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_content ?c)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      (is_gluten_free_sandwich ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (no_gluten_bread ?b)) ; Ensure it's not gluten-free bread
      (not (no_gluten_content ?c)) ; Ensure it's not gluten-free content
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      ; (not (is_gluten_free_sandwich ?s)) ; Implicit, as it's not added
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (at ?t kitchen)
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
      (on_tray ?s ?t)
      (at ?t ?p)
      (is_gluten_free_sandwich ?s)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (not (is_gluten_free_sandwich ?s)) ; Crucial: ensure not serving GF sandwich to non-allergic child (or rather, ensure it's a regular sandwich)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (and
      (at ?t ?p1)
      (not (= ?p1 ?p2)) ; Tray must move to a different place
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)