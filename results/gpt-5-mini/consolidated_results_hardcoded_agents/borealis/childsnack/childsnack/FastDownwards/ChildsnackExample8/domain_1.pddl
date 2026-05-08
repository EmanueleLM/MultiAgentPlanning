(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    child
    bread-portion
    content-portion
    sandwich
    tray
    place
    slot
    chef
    server
  )

  (:constants
    kitchen - place
  )

  (:predicates
    ;; resource location and availability
    (bread_at ?b - bread-portion ?p - place)
    (content_at ?c - content-portion ?p - place)
    (bread_available ?b - bread-portion)
    (content_available ?c - content-portion)

    ;; gluten attributes
    (bread_gf ?b - bread-portion)
    (content_gf ?c - content-portion)
    (sandwich_gf ?s - sandwich)
    (sandwich_contains_gluten ?s - sandwich)

    ;; sandwich existence / location / composition
    (sandwich_ready ?s - sandwich)           ;; true once sandwich has been prepared and located
    (at_sandwich ?s - sandwich ?p - place)  ;; sandwich is at a place (kitchen or a table)
    (made_from ?s - sandwich ?b - bread-portion ?c - content-portion)

    ;; trays, slots and placement bookkeeping
    (tray_at ?t - tray ?p - place)
    (tray_pure ?t - tray)                    ;; true until a gluten-containing sandwich is placed
    (slot_of ?sl - slot ?t - tray)
    (free_slot ?sl - slot)
    (on_tray ?s - sandwich ?t - tray)
    (occupies_slot ?s - sandwich ?sl - slot)

    ;; people, waiting and serving
    (waiting_at ?ch - child ?p - place)
    (child_allergic_gluten ?ch - child)
    (served ?ch - child)
    (served_with ?ch - child ?s - sandwich)

    ;; agents (optional bookkeeping to keep actions agent-parameterized)
    (chef ?x - chef)
    (server ?x - server)
  )

  ;; Make gluten-free sandwich: consumes bread and content that are marked gluten-free
  (:action make_sandwich_no_gluten
    :parameters (?chef - chef ?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (chef ?chef)
      (not (sandwich_ready ?s))
      (bread_available ?b)
      (content_available ?c)
      (bread_at ?b kitchen)
      (content_at ?c kitchen)
      (bread_gf ?b)
      (content_gf ?c)
    )
    :effect (and
      (sandwich_ready ?s)
      (sandwich_gf ?s)
      (made_from ?s ?b ?c)
      (at_sandwich ?s kitchen)
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (bread_at ?b kitchen))
      (not (content_at ?c kitchen))
    )
  )

  ;; Make regular sandwich when the bread contains gluten (content may be any available)
  (:action make_sandwich_regular_bread_gluten
    :parameters (?chef - chef ?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (chef ?chef)
      (not (sandwich_ready ?s))
      (bread_available ?b)
      (content_available ?c)
      (bread_at ?b kitchen)
      (content_at ?c kitchen)
      (not (bread_gf ?b))
    )
    :effect (and
      (sandwich_ready ?s)
      (sandwich_contains_gluten ?s)
      (made_from ?s ?b ?c)
      (at_sandwich ?s kitchen)
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (bread_at ?b kitchen))
      (not (content_at ?c kitchen))
    )
  )

  ;; Make regular sandwich when the content contains gluten (bread may be any available)
  (:action make_sandwich_regular_content_gluten
    :parameters (?chef - chef ?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (chef ?chef)
      (not (sandwich_ready ?s))
      (bread_available ?b)
      (content_available ?c)
      (bread_at ?b kitchen)
      (content_at ?c kitchen)
      (not (content_gf ?c))
    )
    :effect (and
      (sandwich_ready ?s)
      (sandwich_contains_gluten ?s)
      (made_from ?s ?b ?c)
      (at_sandwich ?s kitchen)
      (not (bread_available ?b))
      (not (content_available ?c))
      (not (bread_at ?b kitchen))
      (not (content_at ?c kitchen))
    )
  )

  ;; Put a gluten-free sandwich on a tray: requires tray to be pure
  (:action put_on_tray_gf
    :parameters (?srv - server ?s - sandwich ?t - tray ?sl - slot ?p - place)
    :precondition (and
      (server ?srv)
      (sandwich_ready ?s)
      (sandwich_gf ?s)
      (at_sandwich ?s ?p)
      (tray_at ?t ?p)
      (slot_of ?sl ?t)
      (free_slot ?sl)
      (tray_pure ?t)
    )
    :effect (and
      (on_tray ?s ?t)
      (occupies_slot ?s ?sl)
      (not (free_slot ?sl))
      (not (at_sandwich ?s ?p))
      ;; tray_pure stays true
    )
  )

  ;; Put a regular (gluten-containing) sandwich on a tray: contaminates tray
  (:action put_on_tray_regular
    :parameters (?srv - server ?s - sandwich ?t - tray ?sl - slot ?p - place)
    :precondition (and
      (server ?srv)
      (sandwich_ready ?s)
      (sandwich_contains_gluten ?s)
      (at_sandwich ?s ?p)
      (tray_at ?t ?p)
      (slot_of ?sl ?t)
      (free_slot ?sl)
    )
    :effect (and
      (on_tray ?s ?t)
      (occupies_slot ?s ?sl)
      (not (free_slot ?sl))
      (not (at_sandwich ?s ?p))
      (not (tray_pure ?t))
    )
  )

  ;; Move a tray between places (sandwiches remain on the tray)
  (:action move_tray
    :parameters (?srv - server ?t - tray ?from - place ?to - place)
    :precondition (and
      (server ?srv)
      (tray_at ?t ?from)
      (not (tray_at ?t ?to))
    )
    :effect (and
      (tray_at ?t ?to)
      (not (tray_at ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child: requires tray to be pure
  (:action serve_sandwich_no_gluten
    :parameters (?srv - server ?ch - child ?s - sandwich ?t - tray ?sl - slot ?p - place)
    :precondition (and
      (server ?srv)
      (child_allergic_gluten ?ch)
      (waiting_at ?ch ?p)
      (tray_at ?t ?p)
      (on_tray ?s ?t)
      (occupies_slot ?s ?sl)
      (slot_of ?sl ?t)
      (sandwich_gf ?s)
      (tray_pure ?t)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (served_with ?ch ?s)
      (not (on_tray ?s ?t))
      (not (occupies_slot ?s ?sl))
      (free_slot ?sl)
      (not (sandwich_ready ?s))
    )
  )

  ;; Serve any sandwich to a non-allergic child
  (:action serve_sandwich
    :parameters (?srv - server ?ch - child ?s - sandwich ?t - tray ?sl - slot ?p - place)
    :precondition (and
      (server ?srv)
      (not (child_allergic_gluten ?ch))
      (waiting_at ?ch ?p)
      (tray_at ?t ?p)
      (on_tray ?s ?t)
      (occupies_slot ?s ?sl)
      (slot_of ?sl ?t)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (served_with ?ch ?s)
      (not (on_tray ?s ?t))
      (not (occupies_slot ?s ?sl))
      (free_slot ?sl)
      (not (sandwich_ready ?s))
    )
  )
)