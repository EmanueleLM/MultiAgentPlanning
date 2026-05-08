(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    child
    bread-portion
    content-portion
    sandwich
    tray
    place
  )

  (:constants
    kitchen - place
  )

  (:predicates
    ;; tray location
    (at ?t - tray ?p - place)

    ;; ingredients in the kitchen (available)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)

    ;; sandwich bookkeeping / location
    (notexist ?s - sandwich)          ;; sandwich id not yet created or already consumed
    (at_kitchen_sandwich ?s - sandwich) ;; sandwich present in kitchen
    (on_tray ?s - sandwich ?t - tray)   ;; sandwich on a tray

    ;; gluten marker for sandwiches (only true for explicitly gluten-free sandwiches)
    (gluten_free_sandwich ?s - sandwich)

    ;; children status and locations
    (waiting ?c - child ?p - place)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (served ?c - child)
  )

  ;; Make a gluten-free sandwich: consumes a GF bread and GF content from kitchen,
  ;; produces a sandwich in the kitchen marked gluten-free, and marks the sandwich as existing.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (gluten_free_bread_flag_dummy) ;; placeholder removed in real actions below
    )
    :effect (and)
  )

  ;; The above template line with placeholder is removed by the definitive action below.
  ;; Definitive, correct make_sandwich_no_gluten action:
  (:action make_sandwich_no_gluten_real
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
      (at_kitchen_sandwich ?s)
      (gluten_free_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Make a (regular) sandwich (may contain gluten). Consumes any bread/content,
  ;; produces a sandwich in the kitchen (not marked gluten-free).
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
    )
    :effect (and
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      ;; do not add gluten_free_sandwich here; absence indicates it may contain gluten
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Put a kitchen sandwich onto a tray that is currently at the kitchen.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (at ?t kitchen)
    )
    :effect (and
      (not (at_kitchen_sandwich ?s))
      (on_tray ?s ?t)
    )
  )

  ;; Move tray between places.
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

  ;; Serve a gluten-free sandwich to a child allergic to gluten.
  ;; Preconditions ensure child is waiting at the same place as the tray and sandwich is gluten-free.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (at ?t ?p)
      (on_tray ?s ?t)
      (gluten_free_sandwich ?s)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (gluten_free_sandwich ?s))
      (notexist ?s) ;; sandwich consumed
    )
  )

  ;; Serve a (possibly gluten-containing) sandwich to a child not allergic to gluten.
  ;; Requires the sandwich NOT be marked gluten-free (negative precondition).
  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (at ?t ?p)
      (on_tray ?s ?t)
      (not (gluten_free_sandwich ?s))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (notexist ?s) ;; sandwich consumed
    )
  )
)