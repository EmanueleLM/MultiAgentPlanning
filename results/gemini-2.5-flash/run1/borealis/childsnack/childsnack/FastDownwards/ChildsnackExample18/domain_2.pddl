(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types
    child
    bread_portion
    content_portion
    sandwich
    tray
    place
  )
  (:constants kitchen - place)

  (:predicates
    (at_kitchen_bread ?b - bread_portion)
    (at_kitchen_content ?c - content_portion)
    (no_gluten_bread ?b - bread_portion)
    (no_gluten_content ?c - content_portion)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (served ?c - child)
    (not_exist ?s - sandwich)
    (is_gluten_free ?s - sandwich)
    (is_regular_sandwich ?s - sandwich)
    (at_kitchen_sandwich ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (at ?t - tray ?p - place)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not_exist ?s)
      (at_kitchen_bread ?b)
      (no_gluten_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_content ?c)
    )
    :effect (and
      (not (not_exist ?s))
      (is_gluten_free ?s)
      (at_kitchen_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not_exist ?s)
      (at_kitchen_bread ?b)
      (not (no_gluten_bread ?b))
      (at_kitchen_content ?c)
      (not (no_gluten_content ?c))
    )
    :effect (and
      (not (not_exist ?s))
      (is_regular_sandwich ?s)
      (at_kitchen_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
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
      (is_gluten_free ?s)
      (on_tray ?s ?t)
      (at ?t ?p)
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
      (is_regular_sandwich ?s)
      (on_tray ?s ?t)
      (at ?t ?p)
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
      (not (= ?p1 ?p2))
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)