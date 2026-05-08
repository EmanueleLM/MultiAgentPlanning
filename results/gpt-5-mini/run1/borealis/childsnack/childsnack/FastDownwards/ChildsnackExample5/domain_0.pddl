(define (domain sandwich-serving)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent bread_portion content_portion sandwich tray child location)

  (:predicates
    ;; agent/location
    (at_agent ?a - agent ?loc - location)

    ;; children and locations
    (child_at ?ch - child ?loc - location)
    (child_allergic_to_gluten ?ch - child)
    (child_served ?ch - child)

    ;; bread and content inventory & usage
    (bread_available ?b - bread_portion)
    (content_available ?c - content_portion)
    (bread_used ?b - bread_portion)
    (content_used ?c - content_portion)
    (bread_is_gluten_free ?b - bread_portion)
    (content_is_gluten_free ?c - content_portion)

    ;; sandwich identity, creation, composition, location, and state
    (unused_sandwich_id ?s - sandwich)
    (exists_sandwich ?s - sandwich)
    (sandwich_has_bread ?s - sandwich ?b - bread_portion)
    (sandwich_has_content ?s - sandwich ?c - content_portion)
    (sandwich_prepared ?s - sandwich)
    (sandwich_at ?s - sandwich ?loc - location)
    (not_on_any_tray ?s - sandwich)
    (sandwich_on_tray ?s - sandwich ?t - tray)
    (sandwich_is_gluten_free ?s - sandwich)
    (sandwich_served ?s - sandwich ?ch - child)
    (sandwich_consumed ?s - sandwich)

    ;; tray and slots
    (tray_at ?t - tray ?loc - location)
    (tray_has_slot ?t - tray)

    ;; connectivity
    (location_connected ?from - location ?to - location)
  )

  ;; make a general sandwich; does NOT assert gluten-free automatically
  (:action make_sandwich
    :parameters (?chef - agent ?b - bread_portion ?c - content_portion ?s - sandwich)
    :precondition (and
      (at_agent ?chef kitchen)
      (bread_available ?b)
      (content_available ?c)
      (not (bread_used ?b))
      (not (content_used ?c))
      (unused_sandwich_id ?s)
    )
    :effect (and
      ;; creation and composition
      (exists_sandwich ?s)
      (sandwich_has_bread ?s ?b)
      (sandwich_has_content ?s ?c)
      (sandwich_prepared ?s)
      ;; bookkeeping: mark consumed ingredients and remove availability
      (bread_used ?b)
      (content_used ?c)
      (not (bread_available ?b))
      (not (content_available ?c))
      ;; assign location at creation (kitchen) and mark as not on any tray
      (sandwich_at ?s kitchen)
      (not_on_any_tray ?s)
      ;; remove id from unused pool
      (not (unused_sandwich_id ?s))
    )
  )

  ;; make a strictly gluten-free sandwich (both ingredients must be GF)
  (:action make_sandwich_no_gluten
    :parameters (?chef - agent ?b - bread_portion ?c - content_portion ?s - sandwich)
    :precondition (and
      (at_agent ?chef kitchen)
      (bread_available ?b)
      (content_available ?c)
      (bread_is_gluten_free ?b)
      (content_is_gluten_free ?c)
      (not (bread_used ?b))
      (not (content_used ?c))
      (unused_sandwich_id ?s)
    )
    :effect (and
      ;; creation and composition
      (exists_sandwich ?s)
      (sandwich_has_bread ?s ?b)
      (sandwich_has_content ?s ?c)
      (sandwich_prepared ?s)
      ;; explicitly mark gluten-free sandwich
      (sandwich_is_gluten_free ?s)
      ;; bookkeeping: mark consumed ingredients and remove availability
      (bread_used ?b)
      (content_used ?c)
      (not (bread_available ?b))
      (not (content_available ?c))
      ;; assign location at creation (kitchen) and mark as not on any tray
      (sandwich_at ?s kitchen)
      (not_on_any_tray ?s)
      ;; remove id from unused pool
      (not (unused_sandwich_id ?s))
    )
  )

  ;; place a prepared sandwich on a tray; consumes one slot (tray_has_slot)
  (:action put_on_tray
    :parameters (?chef - agent ?s - sandwich ?t - tray ?loc - location)
    :precondition (and
      (at_agent ?chef ?loc)
      (tray_at ?t ?loc)
      (sandwich_at ?s ?loc)
      (sandwich_prepared ?s)
      (not_on_any_tray ?s)
      (tray_has_slot ?t)
    )
    :effect (and
      (sandwich_on_tray ?s ?t)
      (not (not_on_any_tray ?s))
      (not (tray_has_slot ?t))
      ;; keep sandwich_at ?s ?loc (sandwich remains at the same place while on the tray)
    )
  )

  ;; move a tray that currently carries exactly one sandwich (modeling capacity=1 trays)
  (:action move_tray
    :parameters (?chef - agent ?t - tray ?s - sandwich ?from - location ?to - location)
    :precondition (and
      (at_agent ?chef ?from)
      (tray_at ?t ?from)
      (sandwich_on_tray ?s ?t)
      (sandwich_at ?s ?from)
      (location_connected ?from ?to)
    )
    :effect (and
      (tray_at ?t ?to)
      (not (tray_at ?t ?from))
      (at_agent ?chef ?to)
      (not (at_agent ?chef ?from))
      ;; update sandwich location to follow the tray
      (sandwich_at ?s ?to)
      (not (sandwich_at ?s ?from))
      ;; sandwich_on_tray remains true for (?s ?t)
    )
  )

  ;; serve a sandwich to a non-allergic child (child must NOT be allergic)
  (:action serve_sandwich
    :parameters (?chef - agent ?s - sandwich ?ch - child ?t - tray ?loc - location)
    :precondition (and
      (at_agent ?chef ?loc)
      (child_at ?ch ?loc)
      (tray_at ?t ?loc)
      (sandwich_on_tray ?s ?t)
      (exists_sandwich ?s)
      (not (child_allergic_to_gluten ?ch))
      (not (child_served ?ch))
    )
    :effect (and
      (sandwich_served ?s ?ch)
      (sandwich_consumed ?s)
      (child_served ?ch)
      ;; remove sandwich from tray and system
      (not (sandwich_on_tray ?s ?t))
      (not (exists_sandwich ?s))
      (not (sandwich_at ?s ?loc))
      ;; free the tray slot and recycle sandwich id for reuse
      (tray_has_slot ?t)
      (unused_sandwich_id ?s)
    )
  )

  ;; serve a sandwich to a child that requires gluten-free food
  (:action serve_sandwich_no_gluten
    :parameters (?chef - agent ?s - sandwich ?ch - child ?t - tray ?loc - location)
    :precondition (and
      (at_agent ?chef ?loc)
      (child_at ?ch ?loc)
      (tray_at ?t ?loc)
      (sandwich_on_tray ?s ?t)
      (exists_sandwich ?s)
      (sandwich_is_gluten_free ?s)
      (child_allergic_to_gluten ?ch)
      (not (child_served ?ch))
    )
    :effect (and
      (sandwich_served ?s ?ch)
      (sandwich_consumed ?s)
      (child_served ?ch)
      ;; remove sandwich from tray and system
      (not (sandwich_on_tray ?s ?t))
      (not (exists_sandwich ?s))
      (not (sandwich_at ?s ?loc))
      ;; free the tray slot and recycle sandwich id for reuse
      (tray_has_slot ?t)
      (unused_sandwich_id ?s)
    )
  )
)