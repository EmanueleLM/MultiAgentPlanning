(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place stage)
  (:constants kitchen - place)

  (:predicates
    ;; tray location
    (at ?t - tray ?p - place)

    ;; ingredients available in kitchen (consumed when used)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)

    ;; gluten markers for ingredients and produced sandwiches
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (no_gluten_sandwich ?s - sandwich)

    ;; sandwich lifecycle
    (prepared ?s - sandwich)
    (in_kitchen ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (served_sandw ?s - sandwich)

    ;; service state and customers
    (served ?c - child)
    (waiting ?c - child ?p - place)
    (allergic_gluten ?c - child)

    ;; explicit discrete stages
    (current_stage ?st - stage)
    (succ ?st1 - stage ?st2 - stage)
  )

  ;; Make a gluten-free sandwich: consumes a gluten-free bread and gluten-free content.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?st - stage)
    :precondition (and
      (current_stage ?st)
      (not (prepared ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (prepared ?s)
      (in_kitchen ?s)
      (no_gluten_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Make a regular sandwich: consumes any available bread and content portions.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?st - stage)
    :precondition (and
      (current_stage ?st)
      (not (prepared ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
    )
    :effect (and
      (prepared ?s)
      (in_kitchen ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Place a prepared sandwich on a tray in the kitchen.
  ;; Sandwich remains on_tray across move_tray actions (contiguous occupancy).
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?st - stage)
    :precondition (and
      (current_stage ?st)
      (prepared ?s)
      (in_kitchen ?s)
      (at ?t kitchen)
      (not (served_sandw ?s))
    )
    :effect (and
      (not (in_kitchen ?s))
      (on_tray ?s ?t)
    )
  )

  ;; Move a tray from one place to another. on_tray facts are preserved (sandwiches move with the tray).
  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place ?st - stage)
    :precondition (and
      (current_stage ?st)
      (at ?t ?p1)
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child at the tray's location.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place ?st - stage)
    :precondition (and
      (current_stage ?st)
      (no_gluten_sandwich ?s)
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (allergic_gluten ?c)
      (not (served_sandw ?s))
      (not (served ?c))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (served_sandw ?s)
    )
  )

  ;; Serve a regular sandwich to a non-allergic child at the tray's location.
  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place ?st - stage)
    :precondition (and
      (current_stage ?st)
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (not (allergic_gluten ?c))
      (not (served_sandw ?s))
      (not (served ?c))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (served_sandw ?s)
    )
  )

  ;; Advance the discrete global stage to its successor. Time progression is explicit and optional.
  (:action advance_stage
    :parameters (?s1 - stage ?s2 - stage)
    :precondition (and
      (current_stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (current_stage ?s1))
      (current_stage ?s2)
    )
  )
)