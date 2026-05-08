(define (domain sandwich_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types bread_portion content_portion sandwich tray place child slot sandwichtype)

  (:predicates
    ; location predicates
    (at ?o - (either bread_portion content_portion sandwich) ?p - place)
    (tray_at ?t - tray ?p - place)
    (child_at ?c - child ?p - place)

    ; availability and identity
    (bread_available ?b - bread_portion)
    (content_available ?c - content_portion)
    (placeholder_available ?s - sandwich)       ; sandwiches are predeclared and initially placeholders
    (sandwich_exists ?s - sandwich)
    (sandwich_consumed ?s - sandwich)

    ; composition and typing
    (bread_gluten_free ?b - bread_portion)
    (content_gluten_free ?c - content_portion)
    (sandwich_type ?s - sandwich ?t - sandwichtype)
    (created_from ?s - sandwich ?b - bread_portion ?c - content_portion)

    ; tray bookkeeping (slots model capacity)
    (slot_of ?sl - slot ?tr - tray)
    (slot_free ?sl - slot)
    (slot_occupied ?sl - slot ?s - sandwich)
    (sandwich_on_tray ?s - sandwich ?tr - tray)

    ; child servicing / allergy
    (child_allergic_gluten ?ch - child)
    (child_served ?ch - child)
    (served_with ?ch - child ?s - sandwich)

    ; resource disposal
    (bread_consumed ?b - bread_portion)
    (content_consumed ?c - content_portion)
  )

  (:constants
    gluten_free gluten - sandwichtype
  )

  ; ------------------------
  ; Make gluten-free sandwich (explicit GF-only creator)
  ; ------------------------
  (:action make_glutenfree_sandwich
    :parameters (?b - bread_portion ?c - content_portion ?s - sandwich ?k - place)
    :precondition (and
      (bread_available ?b)
      (content_available ?c)
      (at ?b ?k)
      (at ?c ?k)
      (bread_gluten_free ?b)
      (content_gluten_free ?c)
      (placeholder_available ?s)
      (not (sandwich_exists ?s))
    )
    :effect (and
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (placeholder_available ?s))

      (bread_consumed ?b)
      (content_consumed ?c)

      (sandwich_exists ?s)
      (at ?s ?k)
      (sandwich_type ?s gluten_free)
      (created_from ?s ?b ?c)
    )
  )

  ; ------------------------
  ; Make regular sandwich when bread is non-GF (content may be either)
  ; Produces a gluten sandwich.
  ; ------------------------
  (:action make_regular_sandwich_bread_gluten
    :parameters (?b - bread_portion ?c - content_portion ?s - sandwich ?k - place)
    :precondition (and
      (bread_available ?b)
      (content_available ?c)
      (at ?b ?k)
      (at ?c ?k)
      (not (bread_gluten_free ?b))
      (placeholder_available ?s)
      (not (sandwich_exists ?s))
    )
    :effect (and
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (placeholder_available ?s))

      (bread_consumed ?b)
      (content_consumed ?c)

      (sandwich_exists ?s)
      (at ?s ?k)
      (sandwich_type ?s gluten)
      (created_from ?s ?b ?c)
    )
  )

  ; ------------------------
  ; Make regular sandwich when content is non-GF but bread is GF.
  ; Produces a gluten sandwich.
  ; ------------------------
  (:action make_regular_sandwich_content_gluten
    :parameters (?b - bread_portion ?c - content_portion ?s - sandwich ?k - place)
    :precondition (and
      (bread_available ?b)
      (content_available ?c)
      (at ?b ?k)
      (at ?c ?k)
      (bread_gluten_free ?b)
      (not (content_gluten_free ?c))
      (placeholder_available ?s)
      (not (sandwich_exists ?s))
    )
    :effect (and
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (placeholder_available ?s))

      (bread_consumed ?b)
      (content_consumed ?c)

      (sandwich_exists ?s)
      (at ?s ?k)
      (sandwich_type ?s gluten)
      (created_from ?s ?b ?c)
    )
  )

  ; ------------------------
  ; Make regular sandwich when both ingredients are GF -> produce GF sandwich.
  ; This is logically equivalent to make_glutenfree_sandwich but retained as
  ; an explicit regular-making variant to reflect the specification.
  ; ------------------------
  (:action make_regular_sandwich_both_gf
    :parameters (?b - bread_portion ?c - content_portion ?s - sandwich ?k - place)
    :precondition (and
      (bread_available ?b)
      (content_available ?c)
      (at ?b ?k)
      (at ?c ?k)
      (bread_gluten_free ?b)
      (content_gluten_free ?c)
      (placeholder_available ?s)
      (not (sandwich_exists ?s))
    )
    :effect (and
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (placeholder_available ?s))

      (bread_consumed ?b)
      (content_consumed ?c)

      (sandwich_exists ?s)
      (at ?s ?k)
      (sandwich_type ?s gluten_free)
      (created_from ?s ?b ?c)
    )
  )

  ; ------------------------
  ; Put sandwich on tray: occupies a specific free slot on the tray.
  ; ------------------------
  (:action put_sandwich_on_tray
    :parameters (?s - sandwich ?tr - tray ?p - place ?sl - slot)
    :precondition (and
      (sandwich_exists ?s)
      (at ?s ?p)
      (tray_at ?tr ?p)
      (slot_of ?sl ?tr)
      (slot_free ?sl)
      (not (sandwich_on_tray ?s ?tr))
    )
    :effect (and
      (not (at ?s ?p))
      (sandwich_on_tray ?s ?tr)
      (slot_occupied ?sl ?s)
      (not (slot_free ?sl))
    )
  )

  ; ------------------------
  ; Move tray between places (atomic). Sandwiches on the tray are associated
  ; via sandwich_on_tray and slot_occupied; tray_at is updated.
  ; ------------------------
  (:action move_tray
    :parameters (?tr - tray ?from - place ?to - place)
    :precondition (and
      (tray_at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (tray_at ?tr ?from))
      (tray_at ?tr ?to)
    )
  )

  ; ------------------------
  ; Serve sandwich to a gluten-allergic child: sandwich must be GF.
  ; Requires the sandwich occupies a specific slot on the tray.
  ; ------------------------
  (:action serve_sandwich_to_child_allergic
    :parameters (?tr - tray ?sl - slot ?s - sandwich ?ch - child ?p - place)
    :precondition (and
      (tray_at ?tr ?p)
      (child_at ?ch ?p)
      (slot_of ?sl ?tr)
      (slot_occupied ?sl ?s)
      (sandwich_on_tray ?s ?tr)
      (sandwich_exists ?s)
      (not (sandwich_consumed ?s))
      (child_allergic_gluten ?ch)
      (sandwich_type ?s gluten_free)
      (not (child_served ?ch))
    )
    :effect (and
      (not (slot_occupied ?sl ?s))
      (slot_free ?sl)
      (not (sandwich_on_tray ?s ?tr))

      (not (sandwich_exists ?s))
      (sandwich_consumed ?s)

      (served_with ?ch ?s)
      (child_served ?ch)
    )
  )

  ; ------------------------
  ; Serve sandwich to a non-allergic child: any sandwich type ok.
  ; ------------------------
  (:action serve_sandwich_to_child_non_allergic
    :parameters (?tr - tray ?sl - slot ?s - sandwich ?ch - child ?p - place)
    :precondition (and
      (tray_at ?tr ?p)
      (child_at ?ch ?p)
      (slot_of ?sl ?tr)
      (slot_occupied ?sl ?s)
      (sandwich_on_tray ?s ?tr)
      (sandwich_exists ?s)
      (not (sandwich_consumed ?s))
      (not (child_allergic_gluten ?ch))
      (not (child_served ?ch))
    )
    :effect (and
      (not (slot_occupied ?sl ?s))
      (slot_free ?sl)
      (not (sandwich_on_tray ?s ?tr))

      (not (sandwich_exists ?s))
      (sandwich_consumed ?s)

      (served_with ?ch ?s)
      (child_served ?ch)
    )
  )

)