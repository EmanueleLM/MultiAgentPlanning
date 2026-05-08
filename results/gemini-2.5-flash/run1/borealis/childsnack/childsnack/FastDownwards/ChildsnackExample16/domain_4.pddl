(define (domain child-snack)
  (:requirements :typing :strips :negative-preconditions :equality)
  (:types 
    child 
    bread_portion 
    content_portion 
    sandwich 
    tray 
    place
  )
  (:constants 
    kitchen - place
  )

  (:predicates
    (at_kitchen_bread ?b - bread_portion)
    (at_kitchen_content ?c - content_portion)
    (no_gluten_bread ?b - bread_portion)
    (no_gluten_content ?c - content_portion)
    (exists_sandwich ?s - sandwich)
    (is_gluten_free_sandwich ?s - sandwich)
    (is_regular_sandwich ?s - sandwich)
    (sandwich_available_in_kitchen ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (at_tray ?t - tray ?p - place)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
      (not (exists_sandwich ?s))
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (exists_sandwich ?s)
      (is_gluten_free_sandwich ?s)
      (sandwich_available_in_kitchen ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (no_gluten_bread ?b))
      (not (no_gluten_content ?c))
      (not (exists_sandwich ?s))
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (exists_sandwich ?s)
      (is_regular_sandwich ?s)
      (sandwich_available_in_kitchen ?s)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (sandwich_available_in_kitchen ?s)
      (at_tray ?t kitchen)
    )
    :effect (and
      (not (sandwich_available_in_kitchen ?s))
      (on_tray ?s ?t)
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
      (not (served ?c))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (exists_sandwich ?s))
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (is_regular_sandwich ?s)
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (not (served ?c))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (exists_sandwich ?s))
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
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