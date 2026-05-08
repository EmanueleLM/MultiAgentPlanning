(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)                     ; Tray is at a place
    (at_kitchen_bread ?b - bread-portion)         ; Bread is available in the kitchen
    (at_kitchen_content ?c - content-portion)     ; Content is available in the kitchen
    (no_gluten_bread ?b - bread-portion)          ; Bread is gluten-free
    (no_gluten_content ?c - content-portion)      ; Content is gluten-free
    (is_gluten_free ?s - sandwich)                ; Sandwich is gluten-free
    (allergic_gluten ?ch - child)                 ; Child is allergic to gluten
    (not_allergic_gluten ?ch - child)             ; Child is not allergic to gluten
    (waiting ?ch - child ?p - place)              ; Child is waiting at a place
    (served ?ch - child)                          ; Child has been served
    (notexist ?s - sandwich)                      ; Sandwich object has not been made yet
    (sandwich_at_kitchen ?s - sandwich)           ; Made sandwich is in the kitchen
    (on_tray ?s - sandwich ?t - tray)             ; Sandwich is on a tray
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (no_gluten_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_content ?c)
      (notexist ?s)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (sandwich_at_kitchen ?s)
      (is_gluten_free ?s)
      (not (notexist ?s))
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (notexist ?s)
      (not (no_gluten_bread ?b))     ; Ensures non-gluten bread for a regular sandwich
      (not (no_gluten_content ?c))   ; Ensures non-gluten content for a regular sandwich
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (sandwich_at_kitchen ?s)
      (not (is_gluten_free ?s))      ; Explicitly states it's not gluten-free
      (not (notexist ?s))
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (sandwich_at_kitchen ?s)
      (at ?t kitchen)
    )
    :effect (and
      (not (sandwich_at_kitchen ?s))
      (on_tray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?ch)
      (waiting ?ch ?p)
      (is_gluten_free ?s)
      (on_tray ?s ?t)
      (at ?t ?p)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?ch)
      (not (waiting ?ch ?p))
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?ch)
      (waiting ?ch ?p)
      (not (is_gluten_free ?s))      ; Ensures it's a regular sandwich
      (on_tray ?s ?t)
      (at ?t ?p)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?ch)
      (not (waiting ?ch ?p))
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (and
      (at ?t ?p1)
      (not (= ?p1 ?p2)) ; Tray must move to a different place
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)