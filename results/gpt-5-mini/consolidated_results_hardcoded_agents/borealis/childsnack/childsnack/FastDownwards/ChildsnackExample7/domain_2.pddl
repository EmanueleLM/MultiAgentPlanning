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
    (notexist ?s - sandwich)
    (in_kitchen ?s - sandwich)
    (no_gluten_sandwich ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (consumed ?s - sandwich)
    (served ?c - child)
    (waiting ?c - child ?p - place)
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
      (in_kitchen ?s)
      (no_gluten_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
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
      (in_kitchen ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (in_kitchen ?s)
      (at ?t kitchen)
      (not (consumed ?s))
    )
    :effect (and
      (not (in_kitchen ?s))
      (on_tray ?s ?t)
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

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (no_gluten_sandwich ?s)
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (allergic_gluten ?c)
      (not (consumed ?s))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (consumed ?s)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (not_allergic_gluten ?c)
      (not (consumed ?s))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (consumed ?s)
    )
  )
)