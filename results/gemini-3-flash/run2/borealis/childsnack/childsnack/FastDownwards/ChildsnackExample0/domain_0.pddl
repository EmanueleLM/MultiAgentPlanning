(define (domain child-snack)
  (:requirements :typing :equality)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (at_kitchen_sandwich ?s - sandwich)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (ontray ?s - sandwich ?t - tray)
    (at ?t - tray ?p - place)
    (waiting ?c - child ?p - place)
    (served ?c - child)
    (notexist ?s - sandwich)
    (is_no_gluten ?s - sandwich)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
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
        (is_no_gluten ?s)
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
        (ontray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and 
        (allergic_gluten ?c) 
        (waiting ?c ?p) 
        (ontray ?s ?t) 
        (at ?t ?p) 
        (is_no_gluten ?s)
    )
    :effect (and 
        (not (ontray ?s ?t)) 
        (served ?c)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and 
        (not_allergic_gluten ?c) 
        (waiting ?c ?p) 
        (ontray ?s ?t) 
        (at ?t ?p)
    )
    :effect (and 
        (not (ontray ?s ?t)) 
        (served ?c)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and 
        (not (at ?t ?p1)) 
        (at ?t ?p2)
    )
  )
)