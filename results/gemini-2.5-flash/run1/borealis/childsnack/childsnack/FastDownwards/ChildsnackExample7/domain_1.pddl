(define (domain child-snack)
  (:requirements :typing :negative-preconditions :equality)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (is_gluten_free ?s - sandwich)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (notexist ?s - sandwich) ; Indicates the sandwich has not been made yet
    (at_kitchen_sandwich ?s - sandwich) ; Indicates sandwich has been made and is in kitchen
    (on_tray ?s - sandwich ?t - tray)
    (served ?c - child)
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
      (not (notexist ?s)) ; The sandwich now exists
      (at_kitchen_sandwich ?s)
      (is_gluten_free ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (notexist ?s)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s)) ; The sandwich now exists
      (at_kitchen_sandwich ?s)
      ; This action does not set is_gluten_free, implying a regular sandwich
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
      (is_gluten_free ?s)
      (not (served ?c)) ; Child must not be served yet
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (waiting ?c ?p)) ; Child is no longer waiting
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (not (served ?c)) ; Child must not be served yet
      ; No requirement for (not (is_gluten_free ?s)), non-allergic children can eat any sandwich.
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (not (waiting ?c ?p)) ; Child is no longer waiting
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (and
      (at ?t ?p1)
      (not (= ?p1 ?p2)) ; Tray must move to a different location
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)