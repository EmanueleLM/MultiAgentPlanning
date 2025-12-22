(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types tray bread content sandwich child place)

  (:predicates
    (at_tray ?t - tray ?p - place)
    (at_sandwich ?s - sandwich ?p - place)
    (at_child ?ch - child ?p - place)
    (on_tray ?s - sandwich ?t - tray)
    (sandwich_made ?s - sandwich)
    (sandwich_gluten_free ?s - sandwich)
    (at_kitchen_bread ?b - bread)
    (at_kitchen_content ?c - content)
    (bread_gluten_free ?b - bread)
    (content_gluten_free ?c - content)
    (bread_used ?b - bread)
    (content_used ?c - content)
    (served ?ch - child)
    (consumed ?s - sandwich)
    (child_gluten_allergic ?ch - child)
  )

  ;; Create a gluten-free sandwich by consuming GF bread and GF content
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (not (sandwich_made ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (bread_gluten_free ?b)
      (content_gluten_free ?c)
    )
    :effect (and
      (sandwich_made ?s)
      (at_sandwich ?s kitchen)
      (sandwich_gluten_free ?s)
      (bread_used ?b)
      (content_used ?c)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Create a sandwich when the bread is NOT gluten-free (content may be GF or not)
  (:action make_sandwich_bread_not_gf
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (not (sandwich_made ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (bread_gluten_free ?b))
    )
    :effect (and
      (sandwich_made ?s)
      (at_sandwich ?s kitchen)
      (bread_used ?b)
      (content_used ?c)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Create a sandwich when the content is NOT gluten-free (bread may be GF or not)
  (:action make_sandwich_content_not_gf
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (not (sandwich_made ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (content_gluten_free ?c))
    )
    :effect (and
      (sandwich_made ?s)
      (at_sandwich ?s kitchen)
      (bread_used ?b)
      (content_used ?c)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Place a sandwich located at a place onto a co-located tray
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich_made ?s)
      (at_sandwich ?s ?p)
      (at_tray ?t ?p)
      (not (on_tray ?s ?t))
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at_sandwich ?s ?p))
    )
  )

  ;; Move a tray from one place to another (sandwiches stay on_tray and thus move implicitly)
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_tray ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (at_tray ?t ?to)
      (not (at_tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child (tray and child must be co-located)
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (at_child ?ch ?p)
      (sandwich_made ?s)
      (sandwich_gluten_free ?s)
      (not (served ?ch))
      (child_gluten_allergic ?ch)
    )
    :effect (and
      (served ?ch)
      (consumed ?s)
      (not (on_tray ?s ?t))
      (not (sandwich_made ?s))
    )
  )

  ;; Serve any sandwich to a non-allergic child (tray and child must be co-located)
  (:action serve_sandwich_non_allergic
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (at_child ?ch ?p)
      (sandwich_made ?s)
      (not (served ?ch))
      (not (child_gluten_allergic ?ch))
    )
    :effect (and
      (served ?ch)
      (consumed ?s)
      (not (on_tray ?s ?t))
      (not (sandwich_made ?s))
    )
  )
)