(define (domain child-snack)
  (:requirements :typing :strips :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place step)

  (:constants
    kitchen - place
  )

  (:predicates
    ;; tray location
    (at_tray ?t - tray ?p - place)

    ;; kitchen resources
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; sandwich lifecycle and location
    (unused ?s - sandwich)            ;; sandwich placeholder not yet created
    (available ?s - sandwich)         ;; prepared and available (not yet served)
    (at_sandwich ?s - sandwich ?p - place) ;; sandwich is at a place (typically kitchen)
    (sandwich_gluten_free ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray) ;; sandwich placed on a tray

    ;; children and serving
    (waiting ?ch - child ?p - place)
    (child_gluten_allergic ?ch - child)
    (served ?ch - child)

    ;; explicit ordered stages to force sequential progression (discrete time / phases)
    (next ?a - step ?b - step)
    (active_stage ?s - step)

    ;; helper to prevent no-op moves when desired
    (distinct_place ?p1 - place ?p2 - place)
  )

  ;; Make a gluten-free sandwich by consuming gluten-free bread and content in the kitchen
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

  ;; Make a (possibly gluten-containing) sandwich by consuming bread and content in the kitchen
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

  ;; Place a prepared sandwich onto a co-located tray (removes sandwich-from-place marker)
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

  ;; Move a tray from one place to another. distinct_place prevents no-op moves.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_tray ?t ?from)
      (distinct_place ?from ?to)
    )
    :effect (and
      (at_tray ?t ?to)
      (not (at_tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child; requires sandwich on a tray at child's place.
  ;; Consumes the sandwich, marks child served, and advances the active stage.
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

  ;; Serve any sandwich to a non-allergic child; consumes the sandwich, marks child served, and advances stage.
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