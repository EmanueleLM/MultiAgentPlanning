(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (available_in_kitchen ?b - bread-portion ?c - content-portion)
    (gluten_free ?b - bread-portion ?c - content-portion)
    (allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (notexist ?s - sandwich)
    (exist_gluten_free ?s - sandwich)
    (exist ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and 
      (available_in_kitchen ?b ?c)
      (gluten_free ?b ?c)
      (notexist ?s)
    )
    :effect (and 
      (exist_gluten_free ?s)
      (not (available_in_kitchen ?b ?c))
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and 
      (available_in_kitchen ?b ?c)
      (notexist ?s)
    )
    :effect (and 
      (exist ?s)
      (not (available_in_kitchen ?b ?c))
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and 
      (or (exist ?s) (exist_gluten_free ?s))
      (at ?t kitchen)
    )
    :effect (and 
      (on_tray ?s ?t)
      (not (exist ?s))
      (not (exist_gluten_free ?s))
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and 
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (at ?t ?p)
      (on_tray ?s ?t)
      (not (exist ?s))  ; gluten-free sandwiches do not have an 'exist' predicate in this state
    )
    :effect (and 
      (served ?c)
      (not (on_tray ?s ?t))
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and 
      (not (allergic_gluten ?c))
      (waiting ?c ?p)
      (at ?t ?p)
      (on_tray ?s ?t)
      (not (exist_gluten_free ?s))  ; regular sandwiches do not have an 'exist_gluten_free' predicate in this state
    )
    :effect (and 
      (served ?c)
      (not (on_tray ?s ?t))
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and 
      (at ?t ?p2)
      (not (at ?t ?p1))
    )
  )
)