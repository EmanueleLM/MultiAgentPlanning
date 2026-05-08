(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c_portion - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c_portion - content-portion)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (notexist ?s - sandwich)
    (sandwich_available_in_kitchen ?s - sandwich)
    (sandwich_on_tray ?s - sandwich ?t - tray)
    (is_gluten_free ?s - sandwich)
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c_portion - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (no_gluten_bread ?b)
      (at_kitchen_content ?c_portion)
      (no_gluten_content ?c_portion)
    )
    :effect (and
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c_portion))
      (sandwich_available_in_kitchen ?s)
      (is_gluten_free ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c_portion - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c_portion)
    )
    :effect (and
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c_portion))
      (sandwich_available_in_kitchen ?s)
      (not (is_gluten_free ?s)) ; Explicitly mark as not gluten-free
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (sandwich_available_in_kitchen ?s)
      (at ?t kitchen)
    )
    :effect (and
      (not (sandwich_available_in_kitchen ?s))
      (sandwich_on_tray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (sandwich_on_tray ?s ?t)
      (at ?t ?p)
      (is_gluten_free ?s)
    )
    :effect (and
      (not (sandwich_on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (sandwich_on_tray ?s ?t)
      (at ?t ?p)
      (not (is_gluten_free ?s)) ; Must not be a gluten-free sandwich
    )
    :effect (and
      (not (sandwich_on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
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