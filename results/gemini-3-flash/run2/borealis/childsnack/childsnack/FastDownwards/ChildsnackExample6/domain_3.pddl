(define (domain child-snack)
  (:requirements :typing :equality)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (at_kitchen_sandwich ?s - sandwich)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (no_gluten_sandwich ?s - sandwich)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (served ?c - child)
    (notexist ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and 
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and 
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (at_kitchen_sandwich ?s)
      (no_gluten_sandwich ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and 
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
    )
    :effect (and 
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (at_kitchen_sandwich ?s)
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
      (at ?t ?p)
      (on_tray ?s ?t)
      (waiting ?c ?p)
      (no_gluten_sandwich ?s)
      (allergic_gluten ?c)
    )
    :effect (and 
      (not (on_tray ?s ?t))
      (served ?c)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and 
      (at ?t ?p)
      (on_tray ?s ?t)
      (waiting ?c ?p)
      (not_allergic_gluten ?c)
    )
    :effect (and 
      (not (on_tray ?s ?t))
      (served ?c)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and 
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)