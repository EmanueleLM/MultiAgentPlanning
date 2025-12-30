(define (domain child-snack)
  (:requirements :typing :negative-preconditions :equality)
  (:types 
    child 
    bread-portion 
    content-portion 
    sandwich 
    tray 
    place
  )
  (:constants 
    kitchen - place
  )

  (:predicates
    ; Location predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (in_kitchen ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    
    ; Property predicates
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (is_gluten_free ?s - sandwich)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    
    ; State predicates
    (waiting ?c - child ?p - place)
    (served ?c - child)
    (notexist ?s - sandwich) ; Tracks unused sandwich tokens
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
      (in_kitchen ?s)
      (is_gluten_free ?s)
      (not (notexist ?s))
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and 
      (at_kitchen_bread ?b) 
      (at_kitchen_content ?c)
      (not (no_gluten_bread ?b)) 
      (not (no_gluten_content ?c))
      (notexist ?s)
    )
    :effect (and 
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (in_kitchen ?s)
      (not (is_gluten_free ?s))
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
      (at ?t ?p)
      (on_tray ?s ?t)
      (is_gluten_free ?s)
    )
    :effect (and 
      (served ?c)
      (not (waiting ?c ?p))
      (not (on_tray ?s ?t))
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and 
      (not_allergic_gluten ?c) 
      (waiting ?c ?p)
      (at ?t ?p)
      (on_tray ?s ?t)
      (not (is_gluten_free ?s))
    )
    :effect (and 
      (served ?c)
      (not (waiting ?c ?p))
      (not (on_tray ?s ?t))
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
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