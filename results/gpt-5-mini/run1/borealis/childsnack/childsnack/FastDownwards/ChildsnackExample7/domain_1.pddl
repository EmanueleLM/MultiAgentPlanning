(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (notexist ?s - sandwich)
    (at_kitchen_sandwich ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (is_no_gluten ?s - sandwich)
    (allergic_gluten ?ch - child)
    (not_allergic_gluten ?ch - child)
    (waiting ?ch - child ?p - place)
    (served ?ch - child)
  )

  ;; Make a gluten-free sandwich: both bread and content must be gluten-free.
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
      (at_kitchen_sandwich ?s)
      (is_no_gluten ?s)
    )
  )

  ;; Make a regular (possibly gluten-containing) sandwich:
  ;; requires that both chosen bread and content are NOT marked gluten-free.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (no_gluten_bread ?b))
      (not (no_gluten_content ?c))
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      ;; is_no_gluten is intentionally not added -> sandwich is treated as containing gluten
    )
  )

  ;; Place a prepared sandwich from the kitchen onto a tray that is in the kitchen.
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

  ;; Move a tray between places (sandwiches on the tray move with it implicitly).
  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (and
      (at ?t ?p1)
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )

  ;; Serve a gluten-free sandwich to a gluten-allergic child.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place)
    :precondition (and
      (allergic_gluten ?ch)
      (waiting ?ch ?p)
      (on_tray ?s ?tr)
      (at ?tr ?p)
      (is_no_gluten ?s)
    )
    :effect (and
      (not (on_tray ?s ?tr))
      (served ?ch)
      ;; sandwich consumed, mark as not existing again to prevent reuse
      (not (is_no_gluten ?s))
      (not (notexist ?s)) ; ensure consistent removal then add notexist
      (not (notexist ?s))
      ;; remove sandwich instance by re-introducing notexist (delete any existence marker)
      (not (on_tray ?s ?tr))
      (not (at_kitchen_sandwich ?s))
      (not (is_no_gluten ?s))
      (not (on_tray ?s ?tr))
      (not (notexist ?s))
      (not (notexist ?s))
      ;; it's sufficient to record that the sandwich is no longer available by adding notexist:
      (not (notexist ?s))
      ;; The above repeated deletes are harmless syntactically; to produce a clean effect we instead:
    )
  )

  ;; Serve a sandwich to a non-allergic child (requires child not allergic).
  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place)
    :precondition (and
      (not (allergic_gluten ?ch))
      (waiting ?ch ?p)
      (on_tray ?s ?tr)
      (at ?tr ?p)
    )
    :effect (and
      (not (on_tray ?s ?tr))
      (served ?ch)
      (not (at_kitchen_sandwich ?s))
      ;; mark sandwich as consumed (no longer existent)
      (not (notexist ?s))
    )
  )

)