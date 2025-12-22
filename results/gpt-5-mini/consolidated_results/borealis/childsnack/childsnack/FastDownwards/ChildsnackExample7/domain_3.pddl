(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)

    ;; ingredients usage tracking (absence = available)
    (used_bread ?b - bread-portion)
    (used_content ?c - content-portion)

    ;; gluten markers for ingredients and sandwiches
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (no_gluten_sandwich ?s - sandwich)

    ;; sandwich lifecycle
    (prepared ?s - sandwich)
    (in_kitchen ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (served_sandw ?s - sandwich)  ;; prevents reuse of a sandwich

    ;; service state and customers
    (served ?c - child)
    (waiting ?c - child ?p - place)
    (allergic_gluten ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (prepared ?s))
      (not (used_bread ?b))
      (not (used_content ?c))
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (prepared ?s)
      (in_kitchen ?s)
      (no_gluten_sandwich ?s)
      (used_bread ?b)
      (used_content ?c)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (prepared ?s))
      (not (used_bread ?b))
      (not (used_content ?c))
    )
    :effect (and
      (prepared ?s)
      (in_kitchen ?s)
      (used_bread ?b)
      (used_content ?c)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
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

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (no_gluten_sandwich ?s)
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (allergic_gluten ?c)
      (not (served_sandw ?s))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (served_sandw ?s)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (not (allergic_gluten ?c))
      (not (served_sandw ?s))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (served ?c)
      (served_sandw ?s)
    )
  )
)