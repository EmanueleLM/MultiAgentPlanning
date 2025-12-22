(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    location
    bread_portion
    content_portion
    sandwich
    tray
    tray_slot
    child
  )

  (:predicates
    ;; Location predicates
    (at_tray ?t - tray ?l - location)
    (at_bread ?b - bread_portion ?l - location)
    (at_content ?c - content_portion ?l - location)
    (at_sandwich ?s - sandwich ?l - location)
    (slot_at ?slot - tray_slot ?l - location)
    (child_at ?ch - child ?l - location)

    ;; Availability / consumption bookkeeping
    (bread_available ?b - bread_portion)
    (used_bread ?b - bread_portion)
    (content_available ?c - content_portion)
    (used_content ?c - content_portion)

    ;; Gluten-free annotations
    (gluten_free_bread ?b - bread_portion)
    (gluten_free_content ?c - content_portion)
    (sandwich_gf ?s - sandwich)

    ;; Sandwich lifecycle and provenance
    (sandwich_slot ?s - sandwich)           ;; the identity exists as a slot
    (sandwich_created ?s - sandwich)        ;; true once a sandwich has been made in this slot
    (sandwich_consumed ?s - sandwich)       ;; true once the sandwich was served/consumed
    (sandwich_made_from ?s - sandwich ?b - bread_portion ?c - content_portion)

    ;; Tray slots and occupancy (explicit capacity model)
    (tray_slot ?slot - tray_slot)
    (slot_of ?slot - tray_slot ?t - tray)
    (slot_free ?slot - tray_slot)
    (slot_occupied_by ?slot - tray_slot ?s - sandwich)

    ;; Mirror predicates for quick checks / invariants (kept synchronized by actions)
    (on_tray ?s - sandwich ?t - tray)       ;; sandwich placed on tray
    (sandwich_on_tray ?s - sandwich)        ;; boolean: is sandwich on some tray?

    ;; Serving bookkeeping
    (served ?ch - child)
    (served_with ?ch - child ?s - sandwich)

    ;; Allergies
    (child_allergic ?ch - child)
  )

  ;; make a gluten-free sandwich (both ingredients gf)
  (:action make_sandwich_gf
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion ?loc - location)
    :precondition (and
      (sandwich_slot ?s)
      (not (sandwich_created ?s))
      (bread_available ?b)
      (content_available ?c)
      (gluten_free_bread ?b)
      (gluten_free_content ?c)
      (at_bread ?b ?loc)
      (at_content ?c ?loc)
      (at_sandwich ?s ?loc)
    )
    :effect (and
      ;; consume ingredients
      (not (bread_available ?b))
      (used_bread ?b)
      (not (content_available ?c))
      (used_content ?c)

      ;; create sandwich and record provenance
      (sandwich_created ?s)
      (sandwich_gf ?s)
      (sandwich_made_from ?s ?b ?c)

      ;; ensure sandwich located at loc (keeps invariant)
      (at_sandwich ?s ?loc)
    )
  )

  ;; make a non-gluten-free sandwich variant 1: bread is not gf (content may be gf or not)
  (:action make_sandwich_non_gf_bnotgf
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion ?loc - location)
    :precondition (and
      (sandwich_slot ?s)
      (not (sandwich_created ?s))
      (bread_available ?b)
      (content_available ?c)
      (not (gluten_free_bread ?b))
      (at_bread ?b ?loc)
      (at_content ?c ?loc)
      (at_sandwich ?s ?loc)
    )
    :effect (and
      (not (bread_available ?b))
      (used_bread ?b)
      (not (content_available ?c))
      (used_content ?c)

      (sandwich_created ?s)
      ;; deliberately do NOT add sandwich_gf
      (sandwich_made_from ?s ?b ?c)
      (at_sandwich ?s ?loc)
    )
  )

  ;; make a non-gluten-free sandwich variant 2: content is not gf (bread may be gf or not)
  (:action make_sandwich_non_gf_cnotgf
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion ?loc - location)
    :precondition (and
      (sandwich_slot ?s)
      (not (sandwich_created ?s))
      (bread_available ?b)
      (content_available ?c)
      (not (gluten_free_content ?c))
      (at_bread ?b ?loc)
      (at_content ?c ?loc)
      (at_sandwich ?s ?loc)
    )
    :effect (and
      (not (bread_available ?b))
      (used_bread ?b)
      (not (content_available ?c))
      (used_content ?c)

      (sandwich_created ?s)
      ;; deliberately do NOT add sandwich_gf
      (sandwich_made_from ?s ?b ?c)
      (at_sandwich ?s ?loc)
    )
  )

  ;; put a created, not-yet-consumed sandwich into a free slot on a tray (slot-based capacity)
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?slot - tray_slot ?loc - location)
    :precondition (and
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (at_sandwich ?s ?loc)
      (at_tray ?t ?loc)
      (tray_slot ?slot)
      (slot_of ?slot ?t)
      (slot_free ?slot)
      (slot_at ?slot ?loc)
      (not (sandwich_on_tray ?s))
    )
    :effect (and
      (not (slot_free ?slot))
      (slot_occupied_by ?slot ?s)
      (on_tray ?s ?t)
      (sandwich_on_tray ?s)
    )
  )

  ;; specialized atomic move for tray1: moves tray1 and all its slots atomically
  ;; (slots for tray1 are expected to be named slot_t1_1 .. slot_t1_4 in the problem)
  (:action move_tray_tray1
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_tray tray1 ?from)
    )
    :effect (and
      (not (at_tray tray1 ?from))
      (at_tray tray1 ?to)

      ;; move each tray1 slot atomically with the tray
      (not (slot_at slot_t1_1 ?from))
      (slot_at slot_t1_1 ?to)
      (not (slot_at slot_t1_2 ?from))
      (slot_at slot_t1_2 ?to)
      (not (slot_at slot_t1_3 ?from))
      (slot_at slot_t1_3 ?to)
      (not (slot_at slot_t1_4 ?from))
      (slot_at slot_t1_4 ?to)
    )
  )

  ;; specialized atomic move for tray2: moves tray2 and all its slots atomically
  ;; (slots for tray2 are expected to be named slot_t2_1 .. slot_t2_3 in the problem)
  (:action move_tray_tray2
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_tray tray2 ?from)
    )
    :effect (and
      (not (at_tray tray2 ?from))
      (at_tray tray2 ?to)

      ;; move each tray2 slot atomically with the tray
      (not (slot_at slot_t2_1 ?from))
      (slot_at slot_t2_1 ?to)
      (not (slot_at slot_t2_2 ?from))
      (slot_at slot_t2_2 ?to)
      (not (slot_at slot_t2_3 ?from))
      (slot_at slot_t2_3 ?to)
    )
  )

  ;; serve an allergic child: requires sandwich to be gluten-free
  (:action serve_gf_for_allergic
    :parameters (?s - sandwich ?slot - tray_slot ?t - tray ?ch - child ?loc - location)
    :precondition (and
      (child_at ?ch ?loc)
      (child_allergic ?ch)
      (at_tray ?t ?loc)
      (tray_slot ?slot)
      (slot_of ?slot ?t)
      (slot_at ?slot ?loc)
      (slot_occupied_by ?slot ?s)
      (sandwich_gf ?s)
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      ;; mark sandwich consumed and child served
      (sandwich_consumed ?s)
      (served_with ?ch ?s)
      (served ?ch)

      ;; free slot and remove sandwich from tray
      (not (slot_occupied_by ?slot ?s))
      (slot_free ?slot)
      (not (on_tray ?s ?t))
      (not (sandwich_on_tray ?s))
    )
  )

  ;; serve a non-allergic child: any sandwich allowed
  (:action serve_any_non_allergic
    :parameters (?s - sandwich ?slot - tray_slot ?t - tray ?ch - child ?loc - location)
    :precondition (and
      (child_at ?ch ?loc)
      (not (child_allergic ?ch))
      (at_tray ?t ?loc)
      (tray_slot ?slot)
      (slot_of ?slot ?t)
      (slot_at ?slot ?loc)
      (slot_occupied_by ?slot ?s)
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      (sandwich_consumed ?s)
      (served_with ?ch ?s)
      (served ?ch)

      (not (slot_occupied_by ?slot ?s))
      (slot_free ?slot)
      (not (on_tray ?s ?t))
      (not (sandwich_on_tray ?s))
    )
  )
)