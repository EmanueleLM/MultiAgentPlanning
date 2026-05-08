(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)

  (:constants
    kitchen - place
  )

  (:predicates
    ;; tray and people locations
    (at_tray ?t - tray ?p - place)
    (waiting ?c - child ?p - place)

    ;; gluten annotations on ingredient portions
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; consumption bookkeeping (absence = available)
    (bread_used ?b - bread-portion)
    (content_used ?c - content-portion)
    (sandwich_used ?s - sandwich)        ;; placeholder currently used to hold a sandwich

    ;; sandwich location / attributes
    (at_sandwich ?s - sandwich ?p - place)   ;; sandwich is located at a place (kitchen when made)
    (sandwich_on_tray ?s - sandwich ?t - tray)
    (sandwich_glutenfree ?s - sandwich)

    ;; child status
    (child_allergic ?c - child)   ;; child allergic to gluten
    (served ?c - child)
  )

  ;; Make a gluten-free sandwich: require unused sandwich placeholder and unused gluten-free ingredients.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich_used ?s))
      (not (bread_used ?b))
      (not (content_used ?c))
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (sandwich_used ?s)
      (bread_used ?b)
      (content_used ?c)
      (at_sandwich ?s kitchen)
      (sandwich_glutenfree ?s)
    )
  )

  ;; Make a (possibly gluten-containing) sandwich: require unused sandwich placeholder and unused ingredients.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich_used ?s))
      (not (bread_used ?b))
      (not (content_used ?c))
    )
    :effect (and
      (sandwich_used ?s)
      (bread_used ?b)
      (content_used ?c)
      (at_sandwich ?s kitchen)
    )
  )

  ;; Put a sandwich that is at the same place as a tray onto that tray.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
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
  ;; Uses negative precondition to check child not already served.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (child_allergic ?c)
      (not (served ?c))
      (sandwich_on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?c ?p)
      (sandwich_glutenfree ?s)
    )
    :effect (and
      (served ?c)
      (not (sandwich_on_tray ?s ?t))
      ;; free placeholder for reuse after serving
      (not (sandwich_used ?s))
    )
  )

  ;; Serve any sandwich to a child who is not allergic (tested with negative precondition).
  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not (child_allergic ?c))
      (not (served ?c))
      (sandwich_on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?c ?p)
    )
    :effect (and
      (served ?c)
      (not (sandwich_on_tray ?s ?t))
      (not (sandwich_used ?s))
    )
  )
)