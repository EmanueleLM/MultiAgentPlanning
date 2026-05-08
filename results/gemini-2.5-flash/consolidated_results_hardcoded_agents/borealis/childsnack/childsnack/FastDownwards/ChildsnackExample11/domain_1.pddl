(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (served ?c - child)
    (in_kitchen ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (gluten_free ?s - sandwich)
    (notexist ?s - sandwich)
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
      (in_kitchen ?s)
      (gluten_free ?s)
      (not (notexist ?s))
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and 
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (no_gluten_bread ?b))
      (not (no_gluten_content ?c))
    )
    :effect (and 
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (in_kitchen ?s)
      (not (notexist ?s))
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and 
      (in_kitchen ?s)
      (at ?t kitchen)
    )
    :effect (and 
      (not (in_kitchen ?s))
      (on_tray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and 
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (gluten_free ?s)
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
      (on_tray ?s ?t)
      (at ?t ?p)
      (not (gluten_free ?s))
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