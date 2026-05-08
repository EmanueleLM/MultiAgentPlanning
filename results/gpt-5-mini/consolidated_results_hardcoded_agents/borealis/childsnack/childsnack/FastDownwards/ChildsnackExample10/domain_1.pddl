(define (domain child-snack)
  (:requirements :typing :strips :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place step)

  (:constants
    kitchen - place
  )

  (:predicates
    ;; Locations
    (at_tray ?t - tray ?p - place)

    ;; Kitchen resources
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; Sandwich identity / lifecycle
    (unused ?s - sandwich)            ; sandwich placeholder not yet prepared
    (available ?s - sandwich)         ; sandwich prepared and located at a place
    (at_sandwich ?s - sandwich ?p - place)
    (sandwich_gluten_free ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)

    ;; Children and serving
    (waiting ?ch - child ?p - place)
    (child_gluten_allergic ?ch - child)
    (served ?ch - child)

    ;; Stage ordering (explicit discrete progression)
    (next ?a - step ?b - step)
    (active_stage ?s - step)
  )

  ;; Make a gluten-free sandwich by consuming GF bread and GF content in the kitchen
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (unused ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (available ?s)
      (at_sandwich ?s kitchen)
      (sandwich_gluten_free ?s)
      (not (unused ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Make a sandwich that may contain gluten (consumes bread and content)
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (unused ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
    )
    :effect (and
      (available ?s)
      (at_sandwich ?s kitchen)
      (not (unused ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Put a prepared sandwich onto a co-located tray
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (available ?s)
      (at_sandwich ?s ?p)
      (at_tray ?t ?p)
      (not (on_tray ?s ?t))
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at_sandwich ?s ?p))
    )
  )

  ;; Move a tray from one place to another; sandwiches on tray move implicitly (on_tray unaffected)
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_tray ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (at_tray ?t ?to)
      (not (at_tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to a gluten-allergic child.
  ;; This action also advances the active stage to enforce ordered serving.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place ?st - step ?stn - step)
    :precondition (and
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?ch ?p)
      (sandwich_gluten_free ?s)
      (available ?s)
      (child_gluten_allergic ?ch)
      (not (served ?ch))
      (active_stage ?st)
      (next ?st ?stn)
    )
    :effect (and
      (served ?ch)
      (not (on_tray ?s ?t))
      (not (available ?s))
      (not (active_stage ?st))
      (active_stage ?stn)
    )
  )

  ;; Serve any sandwich to a non-allergic child; advances stage.
  (:action serve_sandwich
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place ?st - step ?stn - step)
    :precondition (and
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?ch ?p)
      (available ?s)
      (not (child_gluten_allergic ?ch))
      (not (served ?ch))
      (active_stage ?st)
      (next ?st ?stn)
    )
    :effect (and
      (served ?ch)
      (not (on_tray ?s ?t))
      (not (available ?s))
      (not (active_stage ?st))
      (active_stage ?stn)
    )
  )
)