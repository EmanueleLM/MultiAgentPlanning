(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)

  (:constants
    kitchen - place
  )

  (:predicates
    ;; locations and waiting
    (at_tray ?t - tray ?p - place)
    (waiting ?c - child ?p - place)

    ;; ingredients in kitchen and gluten annotations
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; sandwich placeholders and state
    (sandwich_free ?s - sandwich)     ;; placeholder available to make a sandwich
    (sandwich_filled ?s - sandwich)   ;; placeholder currently holds a sandwich (not on tray)
    (at_sandwich ?s - sandwich ?p - place) ;; sandwich is located at a place (typically kitchen when made)
    (sandwich_on_tray ?s - sandwich ?t - tray) ;; sandwich placed on a tray
    (sandwich_glutenfree ?s - sandwich)

    ;; child status
    (child_allergic ?c - child)   ;; child allergic to gluten
    (unserved ?c - child)         ;; child still needs serving
    (served ?c - child)           ;; child has been served
  )

  ;; Make a gluten-free sandwich: requires both bread and content to be gluten-free and available in kitchen.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (sandwich_free ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (sandwich_filled ?s)
      (sandwich_glutenfree ?s)
      (at_sandwich ?s kitchen)
      (not (sandwich_free ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Make a (possibly gluten-containing) sandwich: consumes a bread and a content portion from kitchen.
  ;; If either ingredient is not annotated gluten-free, the sandwich will not be marked glutenfree.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (sandwich_free ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
    )
    :effect (and
      (sandwich_filled ?s)
      (at_sandwich ?s kitchen)
      (not (sandwich_free ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      ;; do not add sandwich_glutenfree here; only make_sandwich_no_gluten sets it
    )
  )

  ;; Put a filled sandwich that is at the same place as a tray onto that tray.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich_filled ?s)
      (at_sandwich ?s ?p)
      (at_tray ?t ?p)
    )
    :effect (and
      (sandwich_on_tray ?s ?t)
      (not (at_sandwich ?s ?p))
    )
  )

  ;; Move a tray from one place to another.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_tray ?t ?from)
    )
    :effect (and
      (at_tray ?t ?to)
      (not (at_tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to a child who is allergic: tray and child must be co-located.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (child_allergic ?c)
      (unserved ?c)
      (sandwich_on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?c ?p)
      (sandwich_glutenfree ?s)
    )
    :effect (and
      (served ?c)
      (not (unserved ?c))
      (not (sandwich_on_tray ?s ?t))
      (not (sandwich_filled ?s))
      (sandwich_free ?s)
    )
  )

  ;; Serve any sandwich to a child who is not allergic (expressed with a negative precondition).
  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not (child_allergic ?c))
      (unserved ?c)
      (sandwich_on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?c ?p)
    )
    :effect (and
      (served ?c)
      (not (unserved ?c))
      (not (sandwich_on_tray ?s ?t))
      (not (sandwich_filled ?s))
      (sandwich_free ?s)
    )
  )
)