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
     (allergic_gluten ?c - child)
     (not_allergic_gluten ?c - child)
     (gluten_free ?s - sandwich)
     (notexist ?s - sandwich)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and (at_kitchen_bread ?b) (no_gluten_bread ?b) 
                       (at_kitchen_content ?c) (no_gluten_content ?c) 
                       (notexist ?s))
    :effect (and (not (at_kitchen_bread ?b)) (not (at_kitchen_content ?c)) 
                 (not (notexist ?s)) (at_kitchen_sandwich ?s) (gluten_free ?s))
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and (at_kitchen_bread ?b) (at_kitchen_content ?c) (notexist ?s))
    :effect (and (not (at_kitchen_bread ?b)) (not (at_kitchen_content ?c)) 
                 (not (notexist ?s)) (at_kitchen_sandwich ?s))
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and (at_kitchen_sandwich ?s) (at ?t kitchen))
    :effect (and (not (at_kitchen_sandwich ?s)) (ontray ?s ?t))
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and (allergic_gluten ?c) (waiting ?c ?p) 
                       (at ?t ?p) (ontray ?s ?t) (gluten_free ?s))
    :effect (and (not (ontray ?s ?t)) (served ?c))
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and (not_allergic_gluten ?c) (waiting ?c ?p) 
                       (at ?t ?p) (ontray ?s ?t))
    :effect (and (not (ontray ?s ?t)) (served ?c))
  )

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and (not (at ?t ?p1)) (at ?t ?p2))
  )
)