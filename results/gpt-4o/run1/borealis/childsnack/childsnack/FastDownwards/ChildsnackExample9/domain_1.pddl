(define (domain child-snack)
  (:requirements :strips :typing)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (allergic_gluten ?ch - child)
    (not_allergic_gluten ?ch - child)
    (waiting ?ch - child ?p - place)
    (notexist ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (served ?ch - child)
    (prepared ?s - sandwich)  ; Added to track prepared sandwiches
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and (at_kitchen_bread ?b) (at_kitchen_content ?c) 
                       (no_gluten_bread ?b) (no_gluten_content ?c) (notexist ?s))
    :effect (and (not (at_kitchen_bread ?b)) (not (at_kitchen_content ?c)) 
                 (not (notexist ?s)) (prepared ?s))
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and (at_kitchen_bread ?b) (at_kitchen_content ?c) 
                       (notexist ?s))
    :effect (and (not (at_kitchen_bread ?b)) (not (at_kitchen_content ?c)) 
                 (not (notexist ?s)) (prepared ?s))
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and (prepared ?s) (at ?t kitchen))
    :effect (and (on_tray ?s ?t) (not (prepared ?s)))
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and (allergic_gluten ?ch) (waiting ?ch ?p) (on_tray ?s ?t) (at ?t ?p))
    :effect (and (not (on_tray ?s ?t)) (served ?ch))
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and (not_allergic_gluten ?ch) (waiting ?ch ?p) (on_tray ?s ?t) (at ?t ?p))
    :effect (and (not (on_tray ?s ?t)) (served ?ch))
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and (not (at ?t ?p1)) (at ?t ?p2))
  )