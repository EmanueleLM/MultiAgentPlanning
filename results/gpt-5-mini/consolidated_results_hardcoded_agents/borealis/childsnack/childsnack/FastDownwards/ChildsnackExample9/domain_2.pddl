(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)

  (:constants
    kitchen - place
  )

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (in_kitchen ?s - sandwich)
    (notexist ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (gluten_free ?s - sandwich)
    (consumed ?s - sandwich)
    (served ?c - child)
    (waiting ?c - child ?p - place)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
  )

  ;; Make a gluten-free sandwich: consumes a gluten-free bread and gluten-free content,
  ;; creates the sandwich in the kitchen and marks it gluten_free.
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
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (in_kitchen ?s)
      (gluten_free ?s)
    )
  )

  ;; Make a regular sandwich: consumes one bread and one content and creates the sandwich in the kitchen.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (in_kitchen ?s)
    )
  )

  ;; Place a sandwich from the kitchen onto a tray that is at the kitchen.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (in_kitchen ?s)
      (at ?t kitchen)
      (not (on_tray ?s ?t))
      (not (consumed ?s))
    )
    :effect (and
      (not (in_kitchen ?s))
      (on_tray ?s ?t)
    )
  )

  ;; Move a tray from one place to another.
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

  ;; Serve a gluten-free sandwich to a gluten-allergic child.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?ch)
      (waiting ?ch ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (gluten_free ?s)
      (not (consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (consumed ?s)
      (served ?ch)
    )
  )

  ;; Serve any sandwich to a child who is not allergic to gluten.
  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?ch)
      (waiting ?ch ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (not (consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (consumed ?s)
      (served ?ch)
    )
  )
)