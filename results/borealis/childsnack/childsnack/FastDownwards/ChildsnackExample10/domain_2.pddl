(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (at_kitchen_sandwich ?s - sandwich)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (is_no_gluten ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (served ?c - child)
    (created ?s - sandwich) ; Tracks if the unique sandwich object has been materialized
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
      (not (created ?s)) ; Must not exist yet
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (created ?s)
      (at_kitchen_sandwich ?s)
      (is_no_gluten ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (created ?s)) ; Must not exist yet
      ; Ensure it's a regular sandwich by requiring non-gluten bread (standard domain simplification)
      (not (no_gluten_bread ?b)) 
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (created ?s)
      (at_kitchen_sandwich ?s)
      ; (is_no_gluten ?s) remains false by CWA
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (at ?t kitchen)
    )
    :effect (and
      (not (at_kitchen_sandwich ?s))
      (on_tray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (is_no_gluten ?s)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not (allergic_gluten ?c)) ; Child is not allergic
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      ; Implicit: (not (is_no_gluten ?s))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (and
      (at ?t ?p1)
      (not (= ?p1 ?p2))
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)