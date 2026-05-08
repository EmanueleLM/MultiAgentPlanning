(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
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
    (notexist ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (served ?c - child)
    (available ?s - sandwich)
    (in_kitchen ?s - sandwich)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and (at_kitchen_bread ?b) (at_kitchen_content ?c) 
                       (no_gluten_bread ?b) (no_gluten_content ?c) (notexist ?s))
    :effect (and (not (at_kitchen_bread ?b)) 
                 (not (at_kitchen_content ?c)) 
                 (not (notexist ?s))
                 (available ?s)
                 (in_kitchen ?s))
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and (at_kitchen_bread ?b) (at_kitchen_content ?c) (notexist ?s))
    :effect (and (not (at_kitchen_bread ?b)) 
                 (not (at_kitchen_content ?c)) 
                 (not (notexist ?s))
                 (available ?s)
                 (in_kitchen ?s))
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and (in_kitchen ?s) (at ?t kitchen))
    :effect (and (not (in_kitchen ?s)) (on_tray ?s ?t))
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and (allergic_gluten ?c) (waiting ?c ?p) (on_tray ?s ?t) 
                       (at ?t ?p) (no_gluten_bread ?b) (no_gluten_content ?c))
    :effect (and (not (on_tray ?s ?t)) (served ?c))
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and (not_allergic_gluten ?c) (waiting ?c ?p) (on_tray ?s ?t) 
                       (at ?t ?p))
    :effect (and (not (on_tray ?s ?t)) (served ?c))
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and (not (at ?t ?p1)) (at ?t ?p2))
  )
)