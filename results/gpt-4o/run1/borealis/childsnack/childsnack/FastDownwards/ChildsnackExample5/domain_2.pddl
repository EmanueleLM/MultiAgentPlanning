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
    (allergic_gluten ?child - child)
    (not_allergic_gluten ?child - child)
    (waiting ?child - child ?p - place)
    (sandwich_exists ?s - sandwich)
    (no_gluten_sandwich ?s - sandwich)
    (regular_sandwich ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (served ?child - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (sandwich_exists ?s))
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (sandwich_exists ?s)
      (no_gluten_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (sandwich_exists ?s))
    )
    :effect (and
      (sandwich_exists ?s)
      (regular_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (sandwich_exists ?s)
      (at ?t kitchen)
    )
    :effect (and
      (on_tray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?child - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?child)
      (waiting ?child ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (no_gluten_sandwich ?s)
    )
    :effect (and
      (served ?child)
      (not (on_tray ?s ?t))
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?child - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?child)
      (waiting ?child ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (regular_sandwich ?s)
    )
    :effect (and
      (served ?child)
      (not (on_tray ?s ?t))
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)