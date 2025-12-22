(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    child
    bread_portion
    content_portion
    sandwich
    tray
    place
    stage
    tray_slot
  )

  (:constants
    kitchen - place
  )

  (:predicates
    ;; Locations
    (at_tray ?t - tray ?l - place)
    (at_bread ?b - bread_portion ?l - place)
    (at_content ?c - content_portion ?l - place)
    (at_sandwich ?s - sandwich ?l - place)
    (waiting ?ch - child ?l - place)

    ;; Allergies and sandwich properties
    (child_allergic ?ch - child)
    (gluten_free_bread ?b - bread_portion)
    (gluten_free_content ?c - content_portion)
    (sandwich_gf ?s - sandwich)

    ;; Sandwich lifecycle
    (notexist ?s - sandwich)
    (sandwich_created ?s - sandwich)
    (sandwich_consumed ?s - sandwich)

    ;; Tray slots and occupancy
    (is_tray_slot ?slot - tray_slot)
    (slot_of ?slot - tray_slot ?t - tray)
    (slot_free ?slot - tray_slot)
    (slot_occupied ?slot - tray_slot ?s - sandwich)
    (sandwich_on_tray ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)

    ;; Serving bookkeeping
    (served ?ch - child)
    (served_with ?ch - child ?s - sandwich)

    ;; Stage progression per tray (explicit ordered stages)
    (tray_stage ?t - tray ?st - stage)
    (next ?st1 - stage ?st2 - stage)
  )

  ;; Make a strictly gluten-free sandwich -- both ingredients must be marked gluten-free.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (notexist ?s)
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (gluten_free_bread ?b)
      (gluten_free_content ?c)
    )
    :effect (and
      ;; consume ingredients
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))

      ;; create sandwich entity at kitchen and mark GF
      (not (notexist ?s))
      (sandwich_created ?s)
      (at_sandwich ?s kitchen)
      (sandwich_gf ?s)
    )
  )

  ;; Make a sandwich when the bread is not gluten-free (content may be GF or not).
  (:action make_sandwich_non_gf_bread_not_gf
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (notexist ?s)
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gluten_free_bread ?b))
    )
    :effect (and
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))

      (not (notexist ?s))
      (sandwich_created ?s)
      (at_sandwich ?s kitchen)
      ;; not marking sandwich_gf
    )
  )

  ;; Make a sandwich when the content is not gluten-free (bread may be GF or not).
  (:action make_sandwich_non_gf_content_not_gf
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (notexist ?s)
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gluten_free_content ?c))
    )
    :effect (and
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))

      (not (notexist ?s))
      (sandwich_created ?s)
      (at_sandwich ?s kitchen)
      ;; not marking sandwich_gf
    )
  )

  ;; Put a created sandwich into a free slot on a tray (tray and sandwich must be co-located).
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?slot - tray_slot ?loc - place)
    :precondition (and
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (at_sandwich ?s ?loc)
      (at_tray ?t ?loc)
      (is_tray_slot ?slot)
      (slot_of ?slot ?t)
      (slot_free ?slot)
      (not (sandwich_on_tray ?s))
    )
    :effect (and
      (not (slot_free ?slot))
      (slot_occupied ?slot ?s)
      (sandwich_on_tray ?s)
      (on_tray ?s ?t)
      (not (at_sandwich ?s ?loc))
    )
  )

  ;; Move a tray from one place to another, advancing its stage (discrete, monotonic progression).
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (at_tray ?t ?from)
      (tray_stage ?t ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (at_tray ?t ?from))
      (at_tray ?t ?to)

      (not (tray_stage ?t ?st))
      (tray_stage ?t ?st2)
    )
  )

  ;; Serve an allergic child: requires the sandwich on-tray to be explicitly gluten-free.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?slot - tray_slot ?t - tray ?ch - child ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (child_allergic ?ch)
      (at_tray ?t ?p)
      (is_tray_slot ?slot)
      (slot_of ?slot ?t)
      (slot_occupied ?slot ?s)
      (sandwich_gf ?s)
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      (sandwich_consumed ?s)
      (served_with ?ch ?s)
      (served ?ch)

      (not (slot_occupied ?slot ?s))
      (slot_free ?slot)
      (not (sandwich_on_tray ?s))
      (not (on_tray ?s ?t))
    )
  )

  ;; Serve a non-allergic child: any created, not-yet-consumed sandwich is acceptable.
  (:action serve_sandwich
    :parameters (?s - sandwich ?slot - tray_slot ?t - tray ?ch - child ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (not (child_allergic ?ch))
      (at_tray ?t ?p)
      (is_tray_slot ?slot)
      (slot_of ?slot ?t)
      (slot_occupied ?slot ?s)
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      (sandwich_consumed ?s)
      (served_with ?ch ?s)
      (served ?ch)

      (not (slot_occupied ?slot ?s))
      (slot_free ?slot)
      (not (sandwich_on_tray ?s))
      (not (on_tray ?s ?t))
    )
  )
)