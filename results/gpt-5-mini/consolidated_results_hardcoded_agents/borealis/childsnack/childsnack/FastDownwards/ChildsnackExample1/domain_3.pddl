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
    ;; locations
    (at_tray ?t - tray ?l - place)
    (at_bread ?b - bread-portion ?l - place)
    (at_content ?c - content-portion ?l - place)
    (at_sandwich ?s - sandwich ?l - place)
    (waiting ?ch - child ?l - place)

    ;; allergies and ingredient annotations
    (child_allergic ?ch - child)
    (gluten_free_bread ?b - bread-portion)
    (gluten_free_content ?c - content-portion)

    ;; sandwich state
    (sandwich_gf ?s - sandwich)
    (sandwich_created ?s - sandwich)
    (sandwich_consumed ?s - sandwich)

    ;; tray contents and serving bookkeeping
    (on_tray ?s - sandwich ?t - tray)
    (served ?ch - child)
    (served_with ?ch - child ?s - sandwich)
  )

  ;; Make a strictly gluten-free sandwich (both ingredients must be gluten-free)
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich_created ?s))
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
      (sandwich_created ?s)
      (at_sandwich ?s kitchen)
      (sandwich_gf ?s)
    )
  )

  ;; Make a sandwich when the bread is not gluten-free (content may be GF or not).
  (:action make_sandwich_non_gf_bread_not_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich_created ?s))
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gluten_free_bread ?b))
    )
    :effect (and
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))

      (sandwich_created ?s)
      (at_sandwich ?s kitchen)
      ;; not marking sandwich_gf
    )
  )

  ;; Make a sandwich when the content is not gluten-free (bread may be GF or not).
  (:action make_sandwich_non_gf_content_not_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich_created ?s))
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gluten_free_content ?c))
    )
    :effect (and
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))

      (sandwich_created ?s)
      (at_sandwich ?s kitchen)
      ;; not marking sandwich_gf
    )
  )

  ;; Put a created sandwich onto a tray (tray and sandwich must be co-located).
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?loc - place)
    :precondition (and
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (at_sandwich ?s ?loc)
      (at_tray ?t ?loc)
      (not (on_tray ?s ?t))
    )
    :effect (and
      (not (at_sandwich ?s ?loc))
      (on_tray ?s ?t)
    )
  )

  ;; Move a tray from one place to another.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_tray ?t ?from)
    )
    :effect (and
      (not (at_tray ?t ?from))
      (at_tray ?t ?to)
    )
  )

  ;; Serve an allergic child: requires the sandwich on-tray to be explicitly gluten-free.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (child_allergic ?ch)
      (at_tray ?t ?p)
      (on_tray ?s ?t)
      (sandwich_gf ?s)
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      (sandwich_consumed ?s)
      (served_with ?ch ?s)
      (served ?ch)

      (not (on_tray ?s ?t))
    )
  )

  ;; Serve a non-allergic child: any created, not-yet-consumed sandwich is acceptable.
  (:action serve_sandwich
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (not (child_allergic ?ch))
      (at_tray ?t ?p)
      (on_tray ?s ?t)
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      (sandwich_consumed ?s)
      (served_with ?ch ?s)
      (served ?ch)

      (not (on_tray ?s ?t))
    )
  )
)