(define (domain child-snack)
  (:requirements :typing :negative-preconditions :strips)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (no_gluten_sandwich ?s - sandwich)
    (notexist ?s - sandwich)
    (in_kitchen ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (allergic_gluten ?ch - child)
    (not_allergic_gluten ?ch - child)
    (waiting ?ch - child ?p - place)
    (served ?ch - child)
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
      (in_kitchen ?s)
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
      (in_kitchen ?s)
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

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (and
      (at ?t ?p1)
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?ch)
      (waiting ?ch ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (no_gluten_sandwich ?s)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?ch)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?ch)
      (waiting ?ch ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?ch)
    )
  )
)