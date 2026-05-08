(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (notexist ?s - sandwich)
    (waiting ?c - child ?p - place)
    (served ?c - child)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (on_tray ?s - sandwich ?t - tray)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (no_gluten_sandwich ?s - sandwich)
    (sandwich_served ?s - sandwich)
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
      (not (notexist ?s))
      (no_gluten_sandwich ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (notexist ?s)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and 
      (at ?t kitchen)
      (not (sandwich_served ?s))
    )
    :effect (and
      (not (notexist ?s))
      (on_tray ?s ?t)
      (at ?t ?p)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (and 
      (at ?t ?p1)
      (forall (?s - sandwich) (or (not (on_tray ?s ?t)) (not (sandwich_served ?s))))
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (at ?t ?p)
      (no_gluten_sandwich ?s)
      (not (sandwich_served ?s))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
      (sandwich_served ?s)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (at ?t ?p)
      (not (sandwich_served ?s))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
      (sandwich_served ?s)
    )
  )
)