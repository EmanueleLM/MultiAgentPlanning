(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    child
    bread-portion
    content-portion
    sandwich
    tray
    place
  )

  (:constants
    kitchen - place
  )

  (:predicates
    ;; resource location of raw ingredients
    (bread_at ?b - bread-portion ?p - place)
    (content_at ?c - content-portion ?p - place)

    ;; gluten attributes for raw ingredients
    (bread_gf ?b - bread-portion)
    (content_gf ?c - content-portion)

    ;; sandwich attributes and bookkeeping
    (sandwich_used ?s - sandwich)             ;; true once a sandwich object has been prepared (one-time use)
    (sandwich_ready ?s - sandwich)            ;; true while a prepared sandwich exists and can be placed/served
    (sandwich_gf ?s - sandwich)
    (sandwich_contains_gluten ?s - sandwich)
    (made_from ?s - sandwich ?b - bread-portion ?c - content-portion)
    (at_sandwich ?s - sandwich ?p - place)   ;; sandwich is at a place (kitchen or a table)

    ;; trays and placement
    (tray_at ?t - tray ?p - place)
    (tray_pure ?t - tray)                    ;; true until a gluten-containing sandwich is placed on it
    (on_tray ?s - sandwich ?t - tray)

    ;; people, waiting and serving
    (waiting_at ?ch - child ?p - place)
    (child_allergic_gluten ?ch - child)
    (served ?ch - child)
    (served_with ?ch - child ?s - sandwich)
  )

  ;; Make a gluten-free sandwich: consumes gluten-free bread and gluten-free content
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?ct - content-portion)
    :precondition (and
      (not (sandwich_used ?s))
      (bread_at ?b kitchen)
      (content_at ?ct kitchen)
      (bread_gf ?b)
      (content_gf ?ct)
    )
    :effect (and
      (sandwich_used ?s)
      (sandwich_ready ?s)
      (sandwich_gf ?s)
      (made_from ?s ?b ?ct)
      (at_sandwich ?s kitchen)
      (not (bread_at ?b kitchen))
      (not (content_at ?ct kitchen))
    )
  )

  ;; Make a regular sandwich when bread contains gluten (content may be any available)
  (:action make_sandwich_regular_bread_gluten
    :parameters (?s - sandwich ?b - bread-portion ?ct - content-portion)
    :precondition (and
      (not (sandwich_used ?s))
      (bread_at ?b kitchen)
      (content_at ?ct kitchen)
      (not (bread_gf ?b))
    )
    :effect (and
      (sandwich_used ?s)
      (sandwich_ready ?s)
      (sandwich_contains_gluten ?s)
      (made_from ?s ?b ?ct)
      (at_sandwich ?s kitchen)
      (not (bread_at ?b kitchen))
      (not (content_at ?ct kitchen))
    )
  )

  ;; Make a regular sandwich when content contains gluten (bread may be any available)
  (:action make_sandwich_regular_content_gluten
    :parameters (?s - sandwich ?b - bread-portion ?ct - content-portion)
    :precondition (and
      (not (sandwich_used ?s))
      (bread_at ?b kitchen)
      (content_at ?ct kitchen)
      (not (content_gf ?ct))
    )
    :effect (and
      (sandwich_used ?s)
      (sandwich_ready ?s)
      (sandwich_contains_gluten ?s)
      (made_from ?s ?b ?ct)
      (at_sandwich ?s kitchen)
      (not (bread_at ?b kitchen))
      (not (content_at ?ct kitchen))
    )
  )

  ;; Put a gluten-free sandwich on a tray (tray purity preserved)
  (:action put_on_tray_gf
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich_ready ?s)
      (sandwich_gf ?s)
      (at_sandwich ?s ?p)
      (tray_at ?t ?p)
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at_sandwich ?s ?p))
    )
  )

  ;; Put a regular (gluten-containing) sandwich on a tray (contaminates tray)
  (:action put_on_tray_regular
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich_ready ?s)
      (sandwich_contains_gluten ?s)
      (at_sandwich ?s ?p)
      (tray_at ?t ?p)
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at_sandwich ?s ?p))
      (not (tray_pure ?t))
    )
  )

  ;; Move a tray between places (sandwiches remain on the tray)
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (tray_at ?t ?from)
      (not (tray_at ?t ?to))
    )
    :effect (and
      (tray_at ?t ?to)
      (not (tray_at ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child: requires tray to be pure and sandwich on tray at child's place
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (child_allergic_gluten ?ch)
      (waiting_at ?ch ?p)
      (tray_at ?t ?p)
      (on_tray ?s ?t)
      (sandwich_gf ?s)
      (tray_pure ?t)
      (sandwich_ready ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (served_with ?ch ?s)
      (not (on_tray ?s ?t))
      (not (sandwich_ready ?s))
    )
  )

  ;; Serve any sandwich to a non-allergic child
  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (not (child_allergic_gluten ?ch))
      (waiting_at ?ch ?p)
      (tray_at ?t ?p)
      (on_tray ?s ?t)
      (sandwich_ready ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (served_with ?ch ?s)
      (not (on_tray ?s ?t))
      (not (sandwich_ready ?s))
    )
  )
)