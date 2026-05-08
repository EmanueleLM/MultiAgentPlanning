(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (has_gluten_allergy ?c - child)
    (fed ?c - child)
    (is_gluten_free_bread ?b - bread-portion)
    (fresh_bread ?b - bread-portion)
    (fresh_content ?ct - content-portion)
    (is_gluten_free_sandwich ?s - sandwich)
    (sandwich_ready ?s - sandwich) ; Indicates a sandwich has been made and is available
    (on_tray ?s - sandwich ?t - tray)
    (at ?o - (either child tray sandwich) ?l - place) ; Corrected to (either ...)
    (available ?item - (either bread-portion content-portion)) ; Corrected to (either ...)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (is_gluten_free_bread ?b)
      (fresh_bread ?b)
      (fresh_content ?c)
      (available ?b)
      (available ?c)
      (not (sandwich_ready ?s))
    )
    :effect (and
      (sandwich_ready ?s)
      (is_gluten_free_sandwich ?s)
      (not (available ?b))
      (not (available ?c))
      (not (fresh_bread ?b))
      (not (fresh_content ?c))
      (at ?s kitchen)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (is_gluten_free_bread ?b))
      (fresh_bread ?b)
      (fresh_content ?c)
      (available ?b)
      (available ?c)
      (not (sandwich_ready ?s))
    )
    :effect (and
      (sandwich_ready ?s)
      (not (is_gluten_free_sandwich ?s))
      (not (available ?b))
      (not (available ?c))
      (not (fresh_bread ?b))
      (not (fresh_content ?c))
      (at ?s kitchen)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich_ready ?s)
      (not (on_tray ?s ?t))
      (at ?s ?p)
      (at ?t ?p)
    )
    :effect (and
      (on_tray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (has_gluten_allergy ?c)
      (not (fed ?c))
      (is_gluten_free_sandwich ?s)
      (sandwich_ready ?s)
      (on_tray ?s ?t)
      (at ?t ?p)
      (at ?c ?p)
    )
    :effect (and
      (fed ?c)
      (not (on_tray ?s ?t))
      (not (sandwich_ready ?s))
      (not (at ?s ?p))
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not (has_gluten_allergy ?c))
      (not (fed ?c))
      (sandwich_ready ?s)
      (on_tray ?s ?t)
      (at ?t ?p)
      (at ?c ?p)
    )
    :effect (and
      (fed ?c)
      (not (on_tray ?s ?t))
      (not (sandwich_ready ?s))
      (not (at ?s ?p))
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (and
      (at ?t ?p1)
      (not (= ?p1 ?p2))
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )