(define (domain child-snack)
  (:requirements :typing :negative-preconditions :equality)
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
    (exist_sandwich ?s - sandwich)
    (is_gluten_free_sandwich ?s - sandwich)
    (at_kitchen_sandwich ?s - sandwich) ; sandwich is in the kitchen, not on a tray
    (on_tray ?s - sandwich ?t - tray)    ; sandwich is on a tray
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (no_gluten_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_content ?c)
      (not (exist_sandwich ?s))
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (exist_sandwich ?s)
      (is_gluten_free_sandwich ?s)
      (at_kitchen_sandwich ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (not (no_gluten_bread ?b)) ; Must use non-gluten-free bread
      (at_kitchen_content ?c)
      (not (no_gluten_content ?c)) ; Must use non-gluten-free content
      (not (exist_sandwich ?s))
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (exist_sandwich ?s)
      (at_kitchen_sandwich ?s)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (at ?t kitchen) ; Tray must be at the kitchen to put sandwich on it
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
      (is_gluten_free_sandwich ?s)
      (on_tray ?s ?t)
      (at ?t ?p)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (waiting ?c ?p)) ; Child is no longer waiting after being served
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (not (is_gluten_free_sandwich ?s)) ; Must serve a regular sandwich
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (waiting ?c ?p)) ; Child is no longer waiting after being served
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