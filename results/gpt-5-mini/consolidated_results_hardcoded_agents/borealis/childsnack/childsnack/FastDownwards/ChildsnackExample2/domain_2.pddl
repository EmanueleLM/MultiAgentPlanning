(define (domain child-snack)
  (:requirements :typing :negative-preconditions :strips)
  (:types child bread-portion content-portion sandwich tray place stage)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (no_gluten_sandwich ?s - sandwich)
    (notexist ?s - sandwich)
    (in_kitchen ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (consumed ?s - sandwich)
    (allergic_gluten ?ch - child)
    (not_allergic_gluten ?ch - child)
    (waiting ?ch - child ?p - place)
    (served ?ch - child)
    (current_stage ?st - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Make a gluten-free sandwich: consumes gluten-free bread and content,
  ;; creates a sandwich at the kitchen and marks it gluten-free.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?st1 - stage ?st2 - stage)
    :precondition (and
      (current_stage ?st1)
      (next ?st1 ?st2)
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (in_kitchen ?s)
      (no_gluten_sandwich ?s)
      (not (current_stage ?st1))
      (current_stage ?st2)
    )
  )

  ;; Make a regular sandwich: cannot consume gluten-free-labelled ingredients
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?st1 - stage ?st2 - stage)
    :precondition (and
      (current_stage ?st1)
      (next ?st1 ?st2)
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (no_gluten_bread ?b))
      (not (no_gluten_content ?c))
    )
    :effect (and
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (in_kitchen ?s)
      (not (current_stage ?st1))
      (current_stage ?st2)
    )
  )

  ;; Place a sandwich on a tray located at the kitchen
  (:action put_on_tray
    :parameters (?s - sandwich ?tr - tray ?st1 - stage ?st2 - stage)
    :precondition (and
      (current_stage ?st1)
      (next ?st1 ?st2)
      (in_kitchen ?s)
      (at ?tr kitchen)
      (not (consumed ?s))
    )
    :effect (and
      (not (in_kitchen ?s))
      (on_tray ?s ?tr)
      (not (current_stage ?st1))
      (current_stage ?st2)
    )
  )

  ;; Move a tray from one place to another
  (:action move_tray
    :parameters (?tr - tray ?p1 - place ?p2 - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (current_stage ?st1)
      (next ?st1 ?st2)
      (at ?tr ?p1)
    )
    :effect (and
      (not (at ?tr ?p1))
      (at ?tr ?p2)
      (not (current_stage ?st1))
      (current_stage ?st2)
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (current_stage ?st1)
      (next ?st1 ?st2)
      (allergic_gluten ?ch)
      (waiting ?ch ?p)
      (on_tray ?s ?tr)
      (at ?tr ?p)
      (no_gluten_sandwich ?s)
      (not (consumed ?s))
    )
    :effect (and
      (not (on_tray ?s ?tr))
      (consumed ?s)
      (served ?ch)
      (not (current_stage ?st1))
      (current_stage ?st2)
    )
  )

  ;; Serve a regular sandwich to a non-allergic child
  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (current_stage ?st1)
      (next ?st1 ?st2)
      (not_allergic_gluten ?ch)
      (waiting ?ch ?p)
      (on_tray ?s ?tr)
      (at ?tr ?p)
      (not (consumed ?s))
    )
    :effect (and
      (not (on_tray ?s ?tr))
      (consumed ?s)
      (served ?ch)
      (not (current_stage ?st1))
      (current_stage ?st2)
    )
  )
)