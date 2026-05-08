(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    ; Location tracking
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (at_kitchen_sandwich ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)

    ; Ingredient properties
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (no_gluten_sandwich ?s - sandwich) ; Specific type of sandwich

    ; Sandwich status
    (notexist ?s - sandwich) ; Used only for initialization/creation
    (is_sandwich ?s - sandwich) ; General existence

    ; Child properties and state
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (no_gluten_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_content ?c)
      (notexist ?s)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      (no_gluten_sandwich ?s)
      (is_sandwich ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (notexist ?s)
      ; Must use non-GF ingredients to preserve GF resources for dedicated action
      (not (no_gluten_bread ?b))
      (not (no_gluten_content ?c))
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      (is_sandwich ?s)
      ; Does NOT assert (no_gluten_sandwich ?s)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (at ?t kitchen)
      (is_sandwich ?s)
    )
    :effect (and
      (not (at_kitchen_sandwich ?s))
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
      (no_gluten_sandwich ?s)
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
      ; Must be a regular (non-GF) sandwich
      (not (no_gluten_sandwich ?s)) 
    )
    :effect (and
      (served ?c)
      (not (waiting ?c ?p))
      (not (on_tray ?s ?t))
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