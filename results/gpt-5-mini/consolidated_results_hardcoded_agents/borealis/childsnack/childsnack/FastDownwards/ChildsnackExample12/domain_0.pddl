(define (domain sandwich-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    table - location
    tray
    bread_portion
    content_portion
    sandwich_placeholder
    child
  )

  (:predicates
    ;; Location predicates
    (tray_at ?t - tray ?loc - location)
    (child_at ?c - child ?tab - table)
    (sandwich_at ?s - sandwich_placeholder ?loc - location)
    (on_tray ?s - sandwich_placeholder ?t - tray)

    ;; Availability predicates
    (bread_available ?b - bread_portion)
    (content_available ?c - content_portion)

    ;; Existence / status predicates
    (sandwich_exists ?s - sandwich_placeholder)
    (sandwich_served ?s - sandwich_placeholder ?c - child)
    (child_served ?c - child)

    ;; Allergy / gluten properties
    (bread_gluten_free ?b - bread_portion)
    (content_gluten_free ?c - content_portion)
    (sandwich_gluten_free ?s - sandwich_placeholder)
    (child_allergic_gluten ?c - child)

    ;; Consumption bookkeeping
    (used_bread ?b - bread_portion)
    (used_content ?c - content_portion)
  )

  ;; Create a gluten-free sandwich: requires both ingredients gluten-free.
  (:action make-sandwich-no-gluten
    :parameters (?s - sandwich_placeholder ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not (sandwich_exists ?s))
      (bread_available ?b)
      (content_available ?c)
      (bread_gluten_free ?b)
      (content_gluten_free ?c)
    )
    :effect (and
      (sandwich_exists ?s)
      (sandwich_gluten_free ?s)
      (sandwich_at ?s kitchen)
      (used_bread ?b)
      (used_content ?c)
      (not (bread_available ?b))
      (not (content_available ?c))
    )
  )

  ;; Create a sandwich where the bread is not gluten-free (content may or may not be GF).
  (:action make-sandwich-bread-non-gf
    :parameters (?s - sandwich_placeholder ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not (sandwich_exists ?s))
      (bread_available ?b)
      (content_available ?c)
      (not (bread_gluten_free ?b))
    )
    :effect (and
      (sandwich_exists ?s)
      (sandwich_at ?s kitchen)
      (used_bread ?b)
      (used_content ?c)
      (not (bread_available ?b))
      (not (content_available ?c))
      ;; no (sandwich_gluten_free ?s) added -> not gluten-free
    )
  )

  ;; Create a sandwich where the content is not gluten-free (bread may or may not be GF).
  (:action make-sandwich-content-non-gf
    :parameters (?s - sandwich_placeholder ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not (sandwich_exists ?s))
      (bread_available ?b)
      (content_available ?c)
      (not (content_gluten_free ?c))
    )
    :effect (and
      (sandwich_exists ?s)
      (sandwich_at ?s kitchen)
      (used_bread ?b)
      (used_content ?c)
      (not (bread_available ?b))
      (not (content_available ?c))
      ;; no (sandwich_gluten_free ?s) added -> not gluten-free
    )
  )

  ;; Place a sandwich from kitchen onto a tray that is in the kitchen.
  (:action put-on-tray
    :parameters (?s - sandwich_placeholder ?t - tray)
    :precondition (and
      (sandwich_exists ?s)
      (sandwich_at ?s kitchen)
      (tray_at ?t kitchen)
    )
    :effect (and
      (on_tray ?s ?t)
      (not (sandwich_at ?s kitchen))
    )
  )

  ;; Move a tray from one location to another.
  ;; Note: tables are subtypes of location, so moves kitchen <-> tableX are allowed.
  (:action move-tray
    :parameters (?t - tray ?from - location ?to - location)
    :precondition (and
      (tray_at ?t ?from)
    )
    :effect (and
      (tray_at ?t ?to)
      (not (tray_at ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to a child who is allergic to gluten.
  (:action serve-sandwich-no-gluten
    :parameters (?s - sandwich_placeholder ?tr - tray ?c - child ?tab - table)
    :precondition (and
      (on_tray ?s ?tr)
      (tray_at ?tr ?tab)
      (child_at ?c ?tab)
      (child_allergic_gluten ?c)
      (sandwich_gluten_free ?s)
      (not (child_served ?c))
    )
    :effect (and
      (sandwich_served ?s ?c)
      (child_served ?c)
      (not (on_tray ?s ?tr))
    )
  )

  ;; Serve any sandwich to a child who is not allergic to gluten.
  (:action serve-sandwich-non-allergic
    :parameters (?s - sandwich_placeholder ?tr - tray ?c - child ?tab - table)
    :precondition (and
      (on_tray ?s ?tr)
      (tray_at ?tr ?tab)
      (child_at ?c ?tab)
      (not (child_allergic_gluten ?c))
      (not (child_served ?c))
    )
    :effect (and
      (sandwich_served ?s ?c)
      (child_served ?c)
      (not (on_tray ?s ?tr))
    )
  )
)