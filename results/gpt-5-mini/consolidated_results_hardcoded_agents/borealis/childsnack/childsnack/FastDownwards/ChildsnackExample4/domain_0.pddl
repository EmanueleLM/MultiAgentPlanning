(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place table - place
    child
    bread-portion
    content-portion
    sandwich
    tray
  )

  (:predicates
    ;; locations
    (at-tray ?t - tray ?p - place)
    (at-bread ?b - bread-portion ?p - place)
    (at-content ?c - content-portion ?p - place)
    (at-sandw ?s - sandwich ?p - place)

    ;; sandwich lifecycle tokens
    (unused-sandw ?s - sandwich)        ;; placeholder available to create a sandwich
    (exists-sandw ?s - sandwich)        ;; sandwich has been created (not yet consumed)
    (consumed-sandw ?s - sandwich)      ;; sandwich has been consumed (served/eaten)

    ;; sandwich properties and composition markers
    (sandwich-gf ?s - sandwich)
    (sandwich-has-gluten ?s - sandwich)

    ;; ingredient consumption bookkeeping
    (bread-consumed ?b - bread-portion)
    (content-consumed ?c - content-portion)

    ;; ingredient intrinsic properties (static)
    (gf-bread ?b - bread-portion)
    (gf-content ?c - content-portion)

    ;; tray-sandwich relation
    (on-tray ?s - sandwich ?t - tray)

    ;; child and serving predicates
    (allergic ?ch - child)
    (waiting ?ch - child ?p - place)
    (served ?ch - child)
  )

  ;; Actions

  ;; Make a gluten-free sandwich: requires both ingredients GF, consumes them and an unused sandwich token,
  ;; produces an exists-sandw at the kitchen and marks it GF.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (unused-sandw ?s)
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (gf-bread ?b)
      (gf-content ?c)
    )
    :effect (and
      (exists-sandw ?s)
      (sandwich-gf ?s)
      (at-sandw ?s kitchen)
      (bread-consumed ?b)
      (content-consumed ?c)

      (not (unused-sandw ?s))
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Make a (regular) sandwich when bread contains gluten (content may be GF or not).
  ;; This action requires the bread portion to have gluten (i.e., NOT gf-bread).
  (:action make_sandwich_bread_has_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (unused-sandw ?s)
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (not (gf-bread ?b))
    )
    :effect (and
      (exists-sandw ?s)
      (sandwich-has-gluten ?s)
      (at-sandw ?s kitchen)
      (bread-consumed ?b)
      (content-consumed ?c)

      (not (unused-sandw ?s))
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Make a (regular) sandwich when content contains gluten (bread may be GF or not).
  ;; This action requires the content portion to have gluten (i.e., NOT gf-content).
  (:action make_sandwich_content_has_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (unused-sandw ?s)
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (not (gf-content ?c))
    )
    :effect (and
      (exists-sandw ?s)
      (sandwich-has-gluten ?s)
      (at-sandw ?s kitchen)
      (bread-consumed ?b)
      (content-consumed ?c)

      (not (unused-sandw ?s))
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Put a created sandwich onto a tray located at the same place.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (exists-sandw ?s)
      (at-sandw ?s ?p)
      (at-tray ?t ?p)
      (not (on-tray ?s ?t))
      (not (consumed-sandw ?s))
    )
    :effect (and
      (on-tray ?s ?t)
      (not (at-sandw ?s ?p))
    )
  )

  ;; Move a tray from one place to another. Sandwiches on the tray are carried implicitly
  ;; because on-tray facts remain unchanged and at-tray is updated.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at-tray ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (at-tray ?t ?to)
      (not (at-tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich from a tray to a waiting child (allowed for any child).
  (:action serve_sandwich_no_gluten
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich-gf ?s)
      (on-tray ?s ?t)
      (at-tray ?t ?p)
      (waiting ?ch ?p)
      (not (served ?ch))
      (not (consumed-sandw ?s))
    )
    :effect (and
      (served ?ch)
      (consumed-sandw ?s)

      (not (on-tray ?s ?t))
      (not (exists-sandw ?s))
    )
  )

  ;; Serve a regular (gluten-containing) sandwich from a tray to a waiting non-allergic child.
  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich-has-gluten ?s)
      (on-tray ?s ?t)
      (at-tray ?t ?p)
      (waiting ?ch ?p)
      (not (allergic ?ch))
      (not (served ?ch))
      (not (consumed-sandw ?s))
    )
    :effect (and
      (served ?ch)
      (consumed-sandw ?s)

      (not (on-tray ?s ?t))
      (not (exists-sandw ?s))
    )
  )

)