(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (exists ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (served ?c - child)
    (gluten_free_sandwich ?s - sandwich)
    (regular_sandwich ?s - sandwich)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and 
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
      (not (exists ?s)))
    :effect (and 
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (gluten_free_sandwich ?s)
      (exists ?s))
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and 
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (exists ?s)))
    :effect (and 
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (regular_sandwich ?s)
      (exists ?s))
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and 
      (at ?t kitchen)
      (or (gluten_free_sandwich ?s) (regular_sandwich ?s)))
    :effect (and 
      (not (gluten_free_sandwich ?s)) 
      (not (regular_sandwich ?s)) 
      (on_tray ?s ?t))
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and 
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (gluten_free_sandwich ?s)
      (at ?t ?p))
    :effect (and 
      (not (on_tray ?s ?t))
      (served ?c))
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and 
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (regular_sandwich ?s)
      (at ?t ?p))
    :effect (and 
      (not (on_tray ?s ?t))
      (served ?c))
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and 
      (not (at ?t ?p1))
      (at ?t ?p2))
  )
)