(define (domain child-snack)
  (:requirements :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    ;; ingredient availability in kitchen
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)

    ;; gluten annotations for ingredients
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; sandwich id pool and sandwich properties
    (unused ?s - sandwich)              ; sandwich id is unused / not created yet
    (sandwich_no_gluten ?s - sandwich)  ; sandwich prepared as gluten-free
    (at_kitchen_sandwich ?s - sandwich) ; sandwich currently in kitchen (created but not on tray)
    (on_tray ?s - sandwich ?t - tray)   ; sandwich s currently on tray t

    ;; tray locations and connectivity
    (tray_at ?t - tray ?p - place)
    (location_connected ?p1 - place ?p2 - place)

    ;; children, waiting locations and allergy/served status
    (waiting ?ch - child ?p - place)
    (allergic_gluten ?ch - child)
    (not_allergic_gluten ?ch - child)
    (served ?ch - child)
  )

  ;; make a regular sandwich by consuming a bread and content portion
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (unused ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
    )
    :effect (and
      ;; consume assigned ingredients
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      ;; mark sandwich id as used / created
      (not (unused ?s))
      ;; sandwich now exists in kitchen
      (at_kitchen_sandwich ?s)
    )
  )

  ;; make a gluten-free sandwich (requires both ingredients to be gluten-free)
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
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (unused ?s))
      (at_kitchen_sandwich ?s)
      (sandwich_no_gluten ?s)
    )
  )

  ;; put a prepared sandwich onto a tray; tray must be at the kitchen to pick it up
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (tray_at ?t kitchen)
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at_kitchen_sandwich ?s))
    )
  )

  ;; move a tray between connected places
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (tray_at ?t ?from)
      (location_connected ?from ?to)
    )
    :effect (and
      (tray_at ?t ?to)
      (not (tray_at ?t ?from))
    )
  )

  ;; serve a gluten-free sandwich to an allergic child
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?ch)
      (waiting ?ch ?p)
      (tray_at ?t ?p)
      (on_tray ?s ?t)
      (sandwich_no_gluten ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      ;; sandwich removed from tray and id becomes available again
      (not (on_tray ?s ?t))
      (not (sandwich_no_gluten ?s))
      (unused ?s)
    )
  )

  ;; serve a sandwich to a non-allergic child (any sandwich is allowed)
  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?ch)
      (waiting ?ch ?p)
      (tray_at ?t ?p)
      (on_tray ?s ?t)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on_tray ?s ?t))
      (unused ?s)
      ;; ensure gluten-free mark is cleared so id reuse is clean
      (not (sandwich_no_gluten ?s))
    )
  )
)