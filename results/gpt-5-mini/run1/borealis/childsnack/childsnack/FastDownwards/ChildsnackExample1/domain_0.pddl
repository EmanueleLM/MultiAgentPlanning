(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    bread
    content
    sandwich
    tray
    slot
    child
  )

  (:predicates
    ;; locations for physical items
    (at-bread ?b - bread ?loc - location)
    (at-content ?c - content ?loc - location)
    (at-sandwich ?s - sandwich ?loc - location)

    ;; tray location
    (tray-at ?t - tray ?loc - location)

    ;; sandwich lifecycle
    (notexist ?s - sandwich)
    (made ?s - sandwich)
    (consumed-sandwich ?s - sandwich)

    ;; ingredient consumption
    (consumed-bread ?b - bread)
    (consumed-content ?c - content)

    ;; sandwich composition
    (contains-bread ?s - sandwich ?b - bread)
    (contains-content ?s - sandwich ?c - content)

    ;; gluten-free flags (typed)
    (gluten-free-bread ?b - bread)
    (gluten-free-content ?c - content)
    (gluten-free-sandwich ?s - sandwich)

    ;; tray slots and occupancy
    (tray-slot ?t - tray ?slot - slot)  ;; slot belongs to tray
    (slot-free ?slot - slot)           ;; atomic token for capacity
    (on-slot ?s - sandwich ?slot - slot) ;; sandwich placed on specific slot
    (in-tray ?s - sandwich)            ;; sandwich is on some slot (short-circuit test)

    ;; child and serving bookkeeping
    (waiting-at ?c - child ?loc - location)
    (allergic ?c - child)
    (served ?c - child)
    (served-with ?c - child ?s - sandwich)
  )

  ;; Actions
  ;; Two make actions: one that produces a gluten-free sandwich and one that produces a non-GF sandwich.
  (:action make-sandwich-gf
    :parameters (?s - sandwich ?b - bread ?c - content ?loc - location)
    :precondition (and
      (notexist ?s)
      (at-bread ?b ?loc)
      (at-content ?c ?loc)
      (not (consumed-bread ?b))
      (not (consumed-content ?c))
      (gluten-free-bread ?b)
      (gluten-free-content ?c)
    )
    :effect (and
      ;; lifecycle and composition
      (not (notexist ?s))
      (made ?s)
      (contains-bread ?s ?b)
      (contains-content ?s ?c)

      ;; consume components (atomic): mark consumed and remove their locations
      (consumed-bread ?b)
      (consumed-content ?c)
      (not (at-bread ?b ?loc))
      (not (at-content ?c ?loc))

      ;; sandwich exists at same location (not on tray)
      (at-sandwich ?s ?loc)

      ;; sandwich gluten-free set atomically by this action
      (gluten-free-sandwich ?s)
    )
  )

  (:action make-sandwich-non-gf
    :parameters (?s - sandwich ?b - bread ?c - content ?loc - location)
    :precondition (and
      (notexist ?s)
      (at-bread ?b ?loc)
      (at-content ?c ?loc)
      (not (consumed-bread ?b))
      (not (consumed-content ?c))
      ;; This variant does NOT require components to be GF; it will not add gluten-free-sandwich
    )
    :effect (and
      ;; lifecycle and composition
      (not (notexist ?s))
      (made ?s)
      (contains-bread ?s ?b)
      (contains-content ?s ?c)

      ;; consume components (atomic): mark consumed and remove their locations
      (consumed-bread ?b)
      (consumed-content ?c)
      (not (at-bread ?b ?loc))
      (not (at-content ?c ?loc))

      ;; sandwich exists at same location (not on tray)
      (at-sandwich ?s ?loc)
    )
  )

  ;; put a made sandwich onto a free slot of a tray at the same location
  (:action put-on-tray
    :parameters (?s - sandwich ?t - tray ?slot - slot ?loc - location)
    :precondition (and
      (made ?s)
      (at-sandwich ?s ?loc)
      (tray-at ?t ?loc)
      (tray-slot ?t ?slot)
      (slot-free ?slot)
      (not (in-tray ?s))            ;; sandwich must not already be on a tray
      (not (consumed-sandwich ?s)) ;; cannot put already-consumed sandwich
    )
    :effect (and
      (on-slot ?s ?slot)
      (in-tray ?s)
      (not (slot-free ?slot))
      (not (at-sandwich ?s ?loc))
    )
  )

  ;; move a tray from one location to another; sandwiches remain on their slots
  (:action move-tray
    :parameters (?t - tray ?from - location ?to - location)
    :precondition (and
      (tray-at ?t ?from)
    )
    :effect (and
      (not (tray-at ?t ?from))
      (tray-at ?t ?to)
      ;; sandwiches on slots automatically considered to be at the tray's new location
      ;; (no per-sandwich at-sandwich facts for on-slot items)
    )
  )

  ;; serve a gluten-free sandwich to an allergic child (uses slot and tray location)
  (:action serve-gf
    :parameters (?s - sandwich ?slot - slot ?t - tray ?c - child ?loc - location)
    :precondition (and
      (on-slot ?s ?slot)
      (tray-slot ?t ?slot)
      (tray-at ?t ?loc)
      (waiting-at ?c ?loc)
      (allergic ?c)
      (gluten-free-sandwich ?s)
      (not (served ?c))
      (made ?s)
      (not (consumed-sandwich ?s))
    )
    :effect (and
      (served ?c)
      (served-with ?c ?s)
      (consumed-sandwich ?s)
      (not (made ?s))
      (not (on-slot ?s ?slot))
      (slot-free ?slot)
      (not (in-tray ?s))
    )
  )

  ;; serve any sandwich to a non-allergic child
  (:action serve-nonallergic
    :parameters (?s - sandwich ?slot - slot ?t - tray ?c - child ?loc - location)
    :precondition (and
      (on-slot ?s ?slot)
      (tray-slot ?t ?slot)
      (tray-at ?t ?loc)
      (waiting-at ?c ?loc)
      (not (allergic ?c))
      (not (served ?c))
      (made ?s)
      (not (consumed-sandwich ?s))
    )
    :effect (and
      (served ?c)
      (served-with ?c ?s)
      (consumed-sandwich ?s)
      (not (made ?s))
      (not (on-slot ?s ?slot))
      (slot-free ?slot)
      (not (in-tray ?s))
    )
  )
)