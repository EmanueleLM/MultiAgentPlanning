(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread_portion content_portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at_kitchen_bread ?b - bread_portion)
    (at_kitchen_content ?c - content_portion)
    (no_gluten_bread ?b - bread_portion)
    (no_gluten_content ?c - content_portion)

    (not_exist_sandwich ?s - sandwich)
    (at_kitchen_sandwich ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (no_gluten_sandwich ?s - sandwich)

    (at_place_tray ?t - tray ?p - place)

    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting_at_place ?c - child ?p - place)
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not_exist_sandwich ?s)
      (at_kitchen_bread ?b)
      (no_gluten_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_content ?c)
    )
    :effect (and
      (not (not_exist_sandwich ?s))
      (at_kitchen_sandwich ?s)
      (no_gluten_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not_exist_sandwich ?s)
      (at_kitchen_bread ?b)
      (not (no_gluten_bread ?b))
      (at_kitchen_content ?c)
      (not (no_gluten_content ?c))
    )
    :effect (and
      (not (not_exist_sandwich ?s))
      (at_kitchen_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (at_place_tray ?t kitchen)
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
      (waiting_at_place ?c ?p)
      (on_tray ?s ?t)
      (no_gluten_sandwich ?s)
      (at_place_tray ?t ?p)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting_at_place ?c ?p))
      (served ?c)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting_at_place ?c ?p)
      (on_tray ?s ?t)
      (not (no_gluten_sandwich ?s))
      (at_place_tray ?t ?p)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting_at_place ?c ?p))
      (served ?c)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_place_tray ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at_place_tray ?t ?from))
      (at_place_tray ?t ?to)
    )
  )
)