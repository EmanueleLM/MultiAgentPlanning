(define (domain child-snack)
  (:requirements :typing :strips :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)

  (:constants kitchen - place)

  (:predicates
    ;; resource locations
    (at_tray ?t - tray ?p - place)            ;; tray at a place
    (at_kitchen_bread ?b - bread-portion)     ;; bread portion available in kitchen
    (at_kitchen_content ?c - content-portion) ;; content portion available in kitchen

    ;; gluten markers on ingredients
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; sandwich lifecycle
    (notexist ?s - sandwich)                  ;; sandwich id not yet created
    (prepared ?s - sandwich)                  ;; sandwich prepared (exists)
    (is_glutenfree ?s - sandwich)             ;; sandwich is gluten-free
    (is_regular ?s - sandwich)                ;; sandwich is regular (may contain gluten)
    (at_kitchen_sandwich ?s - sandwich)       ;; prepared sandwich currently in kitchen
    (on_tray ?s - sandwich ?t - tray)         ;; sandwich placed on a tray
    (consumed ?s - sandwich)                  ;; sandwich has been served / consumed

    ;; serving state
    (waiting ?c - child ?p - place)           ;; child waiting at a place
    (has_gluten_allergy ?c - child)           ;; child is allergic to gluten
    (served ?c - child)                       ;; child has been served
  )

  ;; Make a gluten-free sandwich by consuming one gluten-free bread and one gluten-free content.
  ;; The sandwich id must not exist yet.
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
      (prepared ?s)
      (is_glutenfree ?s)
      (at_kitchen_sandwich ?s)
    )
  )

  ;; Make a regular sandwich by consuming one bread and one content portion.
  ;; This creates a sandwich marked regular. (It may consume gluten-free ingredients
  ;; if chosen; planners should avoid that if they need gluten-free sandwiches later.)
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
      (prepared ?s)
      (is_regular ?s)
      (at_kitchen_sandwich ?s)
    )
  )

  ;; Place a prepared sandwich onto a tray that is at the kitchen.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (prepared ?s)
      (at_kitchen_sandwich ?s)
      (at_tray ?t kitchen)
      (not (on_tray ?s ?t))
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at_kitchen_sandwich ?s))
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

  ;; Serve a gluten-free sandwich to a child who is allergic to gluten.
  ;; Tray and child must be at the same place.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?t - tray ?c - child ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?c ?p)
      (is_glutenfree ?s)
      (has_gluten_allergy ?c)
      (not (served ?c))
      (not (consumed ?s))
    )
    :effect (and
      (served ?c)
      (consumed ?s)
      (not (on_tray ?s ?t))
    )
  )

  ;; Serve a regular sandwich to a child who is NOT allergic to gluten.
  (:action serve_sandwich
    :parameters (?s - sandwich ?t - tray ?c - child ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?c ?p)
      (is_regular ?s)
      (not (has_gluten_allergy ?c))
      (not (served ?c))
      (not (consumed ?s))
    )
    :effect (and
      (served ?c)
      (consumed ?s)
      (not (on_tray ?s ?t))
    )
  )
)