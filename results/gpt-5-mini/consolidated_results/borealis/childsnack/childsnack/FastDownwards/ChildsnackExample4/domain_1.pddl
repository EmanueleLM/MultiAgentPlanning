(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    child
    bread-portion
    content-portion
    sandwich
    tray
  )

  (:constants
    kitchen - place
  )

  (:predicates
    ;; Locations
    (at-tray ?t - tray ?p - place)         ;; tray ?t is at place ?p
    (at-bread ?b - bread-portion ?p - place) ;; bread portion ?b is at place ?p
    (at-content ?c - content-portion ?p - place) ;; content portion ?c is at place ?p
    (at-sandw ?s - sandwich ?p - place)    ;; sandwich ?s is at place ?p (not on-tray)

    ;; Sandwich existence tokens
    (notexist ?s - sandwich)               ;; sandwich object not yet made
    (exists-sandw ?s - sandwich)           ;; sandwich object has been created and not yet removed

    ;; Sandwich property markers
    (sandwich-gf ?s - sandwich)            ;; sandwich is gluten-free (safe for allergic children)
    (sandwich-gluten ?s - sandwich)        ;; sandwich contains gluten (unsafe for allergic children)

    ;; Ingredient intrinsic properties (static)
    (gf-bread ?b - bread-portion)          ;; bread portion is gluten-free
    (gf-content ?c - content-portion)      ;; content portion is gluten-free

    ;; Tray-sandwich relation
    (on-tray ?s - sandwich ?t - tray)      ;; sandwich ?s is on tray ?t

    ;; Child and serving
    (allergic ?ch - child)                 ;; child is allergic to gluten
    (waiting ?ch - child ?p - place)       ;; child is waiting at place
    (served ?ch - child)                   ;; child has been served an acceptable sandwich
  )

  ;; Actions

  ;; Make a gluten-free sandwich: requires both ingredients to be gluten-free.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (gf-bread ?b)
      (gf-content ?c)
    )
    :effect (and
      (exists-sandw ?s)
      (sandwich-gf ?s)
      (at-sandw ?s kitchen)

      (not (notexist ?s))
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Make a sandwich that contains gluten because the bread has gluten.
  (:action make_sandwich_bread_has_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (not (gf-bread ?b))
    )
    :effect (and
      (exists-sandw ?s)
      (sandwich-gluten ?s)
      (at-sandw ?s kitchen)

      (not (notexist ?s))
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Make a sandwich that contains gluten because the content has gluten.
  (:action make_sandwich_content_has_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (not (gf-content ?c))
    )
    :effect (and
      (exists-sandw ?s)
      (sandwich-gluten ?s)
      (at-sandw ?s kitchen)

      (not (notexist ?s))
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Put a created sandwich onto a tray at the same place.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (exists-sandw ?s)
      (at-sandw ?s ?p)
      (at-tray ?t ?p)
      (not (on-tray ?s ?t))
    )
    :effect (and
      (on-tray ?s ?t)
      (not (at-sandw ?s ?p))
    )
  )

  ;; Move a tray from one place to another. Sandwiches on the tray remain on-tray.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at-tray ?t ?from)
      (not (at-tray ?t ?to))
    )
    :effect (and
      (at-tray ?t ?to)
      (not (at-tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich from a tray to a waiting child (allowed whether or not child is allergic).
  (:action serve_sandwich_no_gluten
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich-gf ?s)
      (on-tray ?s ?t)
      (at-tray ?t ?p)
      (waiting ?ch ?p)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
      (not (exists-sandw ?s))
    )
  )

  ;; Serve a sandwich that contains gluten: allowed only to non-allergic children.
  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich-gluten ?s)
      (on-tray ?s ?t)
      (at-tray ?t ?p)
      (waiting ?ch ?p)
      (not (allergic ?ch))
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
      (not (exists-sandw ?s))
    )
  )
)