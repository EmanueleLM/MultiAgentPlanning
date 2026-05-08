(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    ;; kitchen ingredient availability
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)

    ;; gluten annotations for ingredients
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; sandwich id pool and sandwich properties
    (notexist ?s - sandwich)            ; sandwich id unused
    (sandwich_no_gluten ?s - sandwich) ; sandwich prepared as gluten-free
    (not_on_tray ?s - sandwich)         ; sandwich exists and currently not on any tray
    (sandwich_on_tray ?s - sandwich ?t - tray)

    ;; trays and places
    (tray_at ?t - tray ?p - place)
    (location_connected ?p1 - place ?p2 - place)

    ;; children, waiting locations and allergy/served status
    (waiting ?ch - child ?p - place)
    (allergic_gluten ?ch - child)
    (not_allergic_gluten ?ch - child)
    (served ?ch - child)
  )

  ;; make a regular sandwich from kitchen ingredients
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (notexist ?s)) ; avoid name clash if already used ? -- keep consistent creation semantics
    )
    :effect (and
      ;; consume ingredients
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      ;; create sandwich id
      (not (notexist ?s))
      ;; sandwich initially not on tray
      (not_on_tray ?s)
    )
  )

  ;; make a gluten-free sandwich (requires GF bread and content)
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
      (not (notexist ?s))
    )
    :effect (and
      ;; consume ingredients
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      ;; create sandwich id and mark gluten-free
      (not (notexist ?s))
      (sandwich_no_gluten ?s)
      ;; sandwich initially not on tray
      (not_on_tray ?s)
    )
  )

  ;; put a prepared sandwich (existing id) onto a tray at the same place
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (tray_at ?t ?p)
      (not (notexist ?s))   ; sandwich exists
      (not_on_tray ?s)      ; currently not on any tray
    )
    :effect (and
      (sandwich_on_tray ?s ?t)
      (not (not_on_tray ?s))
    )
  )

  ;; move a tray between connected places (sandwiches on the tray move implicitly with it)
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
      (sandwich_on_tray ?s ?t)
      (sandwich_no_gluten ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      ;; sandwich removed from tray and recycled (id becomes unused again)
      (not (sandwich_on_tray ?s ?t))
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
      (sandwich_on_tray ?s ?t)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (sandwich_on_tray ?s ?t))
      (notexist ?s)
    )
  )
)