(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at_tray ?t - tray ?p - place)
    (at_child ?c - child ?p - place)
    (hungry ?c - child)
    (allergic ?c - child) ; Allergic to gluten, requires GF sandwich
    (eaten ?c - child)

    (available_bread ?b - bread-portion)
    (available_content ?c - content-portion)
    (gluten_free_bread ?b - bread-portion)
    (gluten_free_content ?c - content-portion)

    (made ?s - sandwich)
    (is_gluten_free ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and (available_bread ?b)
                       (available_content ?c)
                       (gluten_free_bread ?b)
                       (gluten_free_content ?c))
    :effect (and (made ?s)
                 (is_gluten_free ?s)
                 (not (available_bread ?b))
                 (not (available_content ?c)))
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and (available_bread ?b)
                       (available_content ?c)
                       ; Precondition ensures it is NOT a GF sandwich (i.e., at least one ingredient is not GF)
                       (or (not (gluten_free_bread ?b))
                           (not (gluten_free_content ?c))))
    :effect (and (made ?s)
                 (not (is_gluten_free ?s))
                 (not (available_bread ?b))
                 (not (available_content ?c)))
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (made ?s)
    :effect (on_tray ?s ?t)
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and (hungry ?c)
                       (allergic ?c)
                       (at_child ?c ?p)
                       (at_tray ?t ?p)
                       (on_tray ?s ?t)
                       (is_gluten_free ?s))
    :effect (and (eaten ?c)
                 (not (hungry ?c))
                 (not (on_tray ?s ?t)))
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and (hungry ?c)
                       (not (allergic ?c))
                       (at_child ?c ?p)
                       (at_tray ?t ?p)
                       (on_tray ?s ?t)
                       (not (is_gluten_free ?s)))
    :effect (and (eaten ?c)
                 (not (hungry ?c))
                 (not (on_tray ?s ?t)))
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (and (at_tray ?t ?p1)
                       (not (= ?p1 ?p2)))
    :effect (and (at_tray ?t ?p2)
                 (not (at_tray ?t ?p1)))
  )
)