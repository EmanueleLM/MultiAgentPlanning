(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types child bread_portion content_portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at_kitchen_bread ?b - bread_portion)
    (at_kitchen_content ?c_portion - content_portion)
    (is_gluten_free_bread ?b - bread_portion)
    (has_gluten_bread ?b - bread_portion) ; Explicit predicate for non-gluten-free bread
    (is_gluten_free_content ?c_portion - content_portion)
    (has_gluten_content ?c_portion - content_portion) ; Explicit predicate for non-gluten-free content
    (not_exist_sandwich ?s - sandwich)
    (at_kitchen_sandwich ?s - sandwich)
    (is_gluten_free_sandwich ?s - sandwich)
    (has_gluten_sandwich ?s - sandwich) ; Explicit predicate for non-gluten-free sandwich
    (at_tray ?t - tray ?p - place)
    (on_tray ?s - sandwich ?t - tray)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c_portion - content_portion)
    :precondition (and
      (not_exist_sandwich ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c_portion)
      (is_gluten_free_bread ?b)
      (is_gluten_free_content ?c_portion)
    )
    :effect (and
      (not (not_exist_sandwich ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c_portion))
      (at_kitchen_sandwich ?s)
      (is_gluten_free_sandwich ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread_portion ?c_portion - content_portion)
    :precondition (and
      (not_exist_sandwich ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c_portion)
      (has_gluten_bread ?b) ; Use positive predicate
      (has_gluten_content ?c_portion) ; Use positive predicate
    )
    :effect (and
      (not (not_exist_sandwich ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c_portion))
      (at_kitchen_sandwich ?s)
      (has_gluten_sandwich ?s) ; Use positive predicate
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (at_tray ?t kitchen) ; Tray must be in the kitchen to put sandwich on it
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
      (on_tray ?s ?t)
      (is_gluten_free_sandwich ?s)
      (at_tray ?t ?p)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (has_gluten_sandwich ?s) ; Use positive predicate
      (at_tray ?t ?p)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p_from - place ?p_to - place)
    :precondition (and
      (at_tray ?t ?p_from)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      (not (at_tray ?t ?p_from))
      (at_tray ?t ?p_to)
    )
  )
)