(define (domain child_snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child tray place bread content sandwich)

  (:predicates
    ;; locations
    (at_tray ?t - tray ?p - place)
    (at_child ?ch - child ?p - place)
    (at_sandwich ?s - sandwich ?p - place)

    ;; ingredient availability and properties
    (bread_available ?b - bread)
    (content_available ?c - content)
    (bread_glutenfree ?b - bread)
    (content_glutenfree ?c - content)

    ;; child properties and serving bookkeeping
    (child_allergic ?ch - child)     ;; allergic to gluten
    (child_unserved ?ch - child)     ;; still needs a sandwich
    (served ?ch - child)             ;; served already

    ;; sandwich placeholder and state
    (sandwich_free ?s - sandwich)    ;; placeholder is free (can be filled)
    (sandwich_filled ?s - sandwich)  ;; placeholder currently contains a sandwich
    (sandwich_on_tray ?s - sandwich ?t - tray)
    (sandwich_glutenfree ?s - sandwich)
  )

  ;; Make a sandwich that is gluten-free (requires both GF bread and GF content).
  (:action make_glutenfree_sandwich
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (sandwich_free ?s)
      (bread_available ?b)
      (content_available ?c)
      (bread_glutenfree ?b)
      (content_glutenfree ?c)
    )
    :effect (and
      (sandwich_filled ?s)
      (sandwich_glutenfree ?s)
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (sandwich_free ?s))
      ;; created sandwich is located in the kitchen by convention
      (at_sandwich ?s kitchen)
    )
  )

  ;; Make a sandwich where the bread is not gluten-free (therefore sandwich contains gluten).
  (:action make_sandwich_bread_not_gf
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (sandwich_free ?s)
      (bread_available ?b)
      (content_available ?c)
      (not (bread_glutenfree ?b))
    )
    :effect (and
      (sandwich_filled ?s)
      ;; sandwich_glutenfree is not added -> sandwich is not gluten-free
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (sandwich_free ?s))
      (at_sandwich ?s kitchen)
    )
  )

  ;; Make a sandwich where the content is not gluten-free (therefore sandwich contains gluten).
  (:action make_sandwich_content_not_gf
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (sandwich_free ?s)
      (bread_available ?b)
      (content_available ?c)
      (not (content_glutenfree ?c))
    )
    :effect (and
      (sandwich_filled ?s)
      ;; sandwich_glutenfree is not added -> sandwich is not gluten-free
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (sandwich_free ?s))
      (at_sandwich ?s kitchen)
    )
  )

  ;; Place an off-tray sandwich onto a co-located tray.
  ;; Precondition requires the sandwich to be off-tray (represented by having an at_sandwich fact).
  (:action place_on_tray
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
  ;; No universal effects on sandwiches are required because sandwich location is derived from tray location + sandwich_on_tray.
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

  ;; Serve a gluten-free sandwich to an allergic child (must be at same place).
  (:action serve_allergic
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (child_allergic ?ch)
      (child_unserved ?ch)
      (sandwich_filled ?s)
      (sandwich_glutenfree ?s)
      (sandwich_on_tray ?s ?t)
      (at_tray ?t ?p)
      (at_child ?ch ?p)
    )
    :effect (and
      (served ?ch)
      (not (child_unserved ?ch))
      (not (sandwich_on_tray ?s ?t))
      (not (sandwich_filled ?s))
      (sandwich_free ?s)
    )
  )

  ;; Serve any sandwich (gluten or not) to a non-allergic child.
  (:action serve_nonallergic
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (not (child_allergic ?ch))
      (child_unserved ?ch)
      (sandwich_filled ?s)
      (sandwich_on_tray ?s ?t)
      (at_tray ?t ?p)
      (at_child ?ch ?p)
    )
    :effect (and
      (served ?ch)
      (not (child_unserved ?ch))
      (not (sandwich_on_tray ?s ?t))
      (not (sandwich_filled ?s))
      (sandwich_free ?s)
    )
  )
)