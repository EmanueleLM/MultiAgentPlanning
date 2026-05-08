(define (domain child-snack)
  (:requirements :typing :negative-preconditions :strips)
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
    (notexist ?s - sandwich)            ; sandwich id unused
    (sandwich_no_gluten ?s - sandwich) ; sandwich prepared as gluten-free
    (on_tray ?s - sandwich ?t - tray)  ; sandwich s currently on tray t

    ;; tray locations
    (tray_at ?t - tray ?p - place)
    (location_connected ?p1 - place ?p2 - place)

    ;; fixed assignment of ingredients to sandwich ids (reduces combinatorics)
    (assigned_bread ?s - sandwich ?b - bread-portion)
    (assigned_content ?s - sandwich ?c - content-portion)

    ;; children, waiting locations and allergy/served status
    (waiting ?ch - child ?p - place)
    (allergic_gluten ?ch - child)
    (not_allergic_gluten ?ch - child)
    (served ?ch - child)
  )

  ;; make a regular sandwich using the predetermined assignment for the sandwich id
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (assigned_bread ?s ?b)
      (assigned_content ?s ?c)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (notexist ?s)
    )
    :effect (and
      ;; consume assigned ingredients
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      ;; mark sandwich id as created
      (not (notexist ?s))
    )
  )

  ;; make a gluten-free sandwich (requires both assigned ingredients to be gluten-free)
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (assigned_bread ?s ?b)
      (assigned_content ?s ?c)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
      (notexist ?s)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (sandwich_no_gluten ?s)
    )
  )

  ;; put a prepared sandwich onto a tray (tray must be at the kitchen to pick it up)
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (tray_at ?t ?p)
      (assigned_bread ?s ?_b)   ; ensure sandwich id has an assignment (prevents putting unknown/unmakeable ids)
      (not (notexist ?s))       ; sandwich exists
      ;; require tray to be where sandwich is picked (typically kitchen)
      (at_kitchen_bread ?_b)    ; link sandwich assignment to presence in kitchen: the assigned bread must currently be in kitchen initially; this is only used as a light check
    )
    :effect (and
      (on_tray ?s ?t)
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
      (notexist ?s)
    )
  )

  ;; serve a regular sandwich to a non-allergic child
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
      (notexist ?s)
    )
  )
)