(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    child bread-portion content-portion sandwich tray place
  )

  (:constants
    kitchen - place
  )

  (:predicates
    ;; tray location
    (at ?t - tray ?p - place)

    ;; where children wait
    (waiting ?c - child ?p - place)

    ;; ingredient availability in kitchen
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)

    ;; gluten flags for ingredients
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; sandwich existence / location
    (notexist ?s - sandwich)        ;; true while sandwich id is unused
    (in_kitchen ?s - sandwich)      ;; sandwich exists and is in the kitchen (surface)
    (on_tray ?s - sandwich ?t - tray) ;; sandwich placed on a tray

    ;; sandwich gluten marker
    (sandwich_no_gluten ?s - sandwich)

    ;; child allergy flags and served status
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (served ?c - child)
  )

  ;; make a gluten-free sandwich: consumes a gluten-free bread and gluten-free content in kitchen
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?cont - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?cont)
      (no_gluten_bread ?b)
      (no_gluten_content ?cont)
    )
    :effect (and
      (not (notexist ?s))
      (in_kitchen ?s)
      (sandwich_no_gluten ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?cont))
    )
  )

  ;; make a regular sandwich: consumes any bread and content available in kitchen
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?cont - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?cont)
    )
    :effect (and
      (not (notexist ?s))
      (in_kitchen ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?cont))
    )
  )

  ;; put a sandwich on a tray (sandwich must be in the kitchen and tray at kitchen)
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (in_kitchen ?s)
      (at ?t kitchen)
    )
    :effect (and
      (on_tray ?s ?t)
      (not (in_kitchen ?s))
    )
  )

  ;; move tray between places; sandwiches on the tray remain on_tray and travel with the tray implicitly
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ;; serve a gluten-free sandwich to an allergic child
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?t - tray ?c - child ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (allergic_gluten ?c)
      (sandwich_no_gluten ?s)
      (not (served ?c))
    )
    :effect (and
      (served ?c)
      (not (on_tray ?s ?t))
    )
  )

  ;; serve a sandwich to a non-allergic child (can be gluten-free or regular)
  (:action serve_sandwich
    :parameters (?s - sandwich ?t - tray ?c - child ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (not_allergic_gluten ?c)
      (not (served ?c))
    )
    :effect (and
      (served ?c)
      (not (on_tray ?s ?t))
    )
  )
)