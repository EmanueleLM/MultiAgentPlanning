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

    ;; ingredient availability in kitchen
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; sandwich bookkeeping and locations
    (notexist ?s - sandwich)            ;; sandwich id not yet created / free
    (at_kitchen_sandwich ?s - sandwich) ;; sandwich present in kitchen (ready)
    (on_tray ?s - sandwich ?t - tray)   ;; sandwich on a tray
    (gluten_free_sandwich ?s - sandwich)

    ;; children status and locations
    (waiting ?c - child ?p - place)
    (allergic_gluten ?c - child)
    (served ?c - child)
  )

  ;; Make a gluten-free sandwich: consumes a GF bread and GF content from kitchen,
  ;; produces a sandwich in the kitchen marked gluten-free, and marks the sandwich id as used.
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
      ;; If both ingredients happened to be GF, we do not automatically tag it here;
      ;; use make_sandwich_no_gluten to explicitly create GF sandwiches.
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
  ;; Preconditions ensure child is allergic, waiting at same place, tray at that place, sandwich on that tray and gluten-free.
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
      (notexist ?s)
      (not (waiting ?c ?p))
    )
  )

  ;; Serve any sandwich to a non-allergic child.
  ;; Uses negative precondition: child must not be allergic to gluten.
  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not (allergic_gluten ?c))
      (waiting ?c ?p)
      (at ?t ?p)
      (on_tray ?s ?t)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (gluten_free_sandwich ?s)) ;; consume GF flag if present
      (notexist ?s)
      (not (waiting ?c ?p))
    )
  )
)