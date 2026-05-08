(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    ;; Locations
    (at ?t - tray ?p - place)                 ; tray ?t is at place ?p
    (waiting ?c - child ?p - place)           ; child ?c is waiting at place ?p

    ;; Ingredient availability in kitchen
    (bread_available ?b - bread-portion)
    (content_available ?x - content-portion)

    ;; Gluten markers for ingredients
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?x - content-portion)

    ;; Sandwich lifecycle
    (not_made ?s - sandwich)                  ; sandwich placeholder not made yet
    (in_kitchen ?s - sandwich)                ; sandwich exists and is in the kitchen (made, not on tray)
    (on_tray ?s - sandwich ?t - tray)         ; sandwich is on tray ?t
    (gluten_free ?s - sandwich)               ; sandwich is gluten-free (both ingredients GF)
    (consumed ?s - sandwich)                  ; sandwich has been served/consumed

    ;; Child status
    (allergic_gluten ?c - child)
    (served ?c - child)
  )

  ;; Make a sandwich when both bread and content are gluten-free.
  (:action make_sandwich_gf
    :parameters (?s - sandwich ?b - bread-portion ?x - content-portion)
    :precondition (and
      (not_made ?s)
      (bread_available ?b)
      (content_available ?x)
      (no_gluten_bread ?b)
      (no_gluten_content ?x)
    )
    :effect (and
      (not (not_made ?s))
      (in_kitchen ?s)
      (gluten_free ?s)
      (not (bread_available ?b))
      (not (content_available ?x))
    )
  )

  ;; Make a sandwich when the bread is NOT gluten-free (content may be GF or not).
  (:action make_sandwich_bread_ng
    :parameters (?s - sandwich ?b - bread-portion ?x - content-portion)
    :precondition (and
      (not_made ?s)
      (bread_available ?b)
      (content_available ?x)
      (not (no_gluten_bread ?b))
    )
    :effect (and
      (not (not_made ?s))
      (in_kitchen ?s)
      (not (bread_available ?b))
      (not (content_available ?x))
    )
  )

  ;; Make a sandwich when the content is NOT gluten-free (bread may be GF or not).
  (:action make_sandwich_content_ng
    :parameters (?s - sandwich ?b - bread-portion ?x - content-portion)
    :precondition (and
      (not_made ?s)
      (bread_available ?b)
      (content_available ?x)
      (not (no_gluten_content ?x))
    )
    :effect (and
      (not (not_made ?s))
      (in_kitchen ?s)
      (not (bread_available ?b))
      (not (content_available ?x))
    )
  )

  ;; Place a sandwich from the kitchen onto a tray that is at the kitchen.
  ;; Sandwich must exist in kitchen and not yet consumed.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (in_kitchen ?s)
      (at ?t kitchen)
      (not (consumed ?s))
    )
    :effect (and
      (on_tray ?s ?t)
      (not (in_kitchen ?s))
    )
  )

  ;; Move a tray from one place to another.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to a child allergic to gluten.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?t - tray ?c - child ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (allergic_gluten ?c)
      (gluten_free ?s)
      (not (served ?c))
      (not (consumed ?s))
    )
    :effect (and
      (served ?c)
      (not (on_tray ?s ?t))
      (consumed ?s)
    )
  )

  ;; Serve any sandwich to a child who is not allergic to gluten.
  (:action serve_sandwich
    :parameters (?s - sandwich ?t - tray ?c - child ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at ?t ?p)
      (waiting ?c ?p)
      (not (allergic_gluten ?c))
      (not (served ?c))
      (not (consumed ?s))
    )
    :effect (and
      (served ?c)
      (not (on_tray ?s ?t))
      (consumed ?s)
    )
  )
)