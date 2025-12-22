(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types place tray bread content sandwich child)
  (:constants kitchen - place)

  (:predicates
    ;; locations
    (at-tray ?t - tray ?p - place)
    (at-bread ?b - bread ?p - place)
    (at-content ?c - content ?p - place)
    (at-sandwich ?s - sandwich ?p - place)
    (at-child ?ch - child ?p - place)

    ;; production / state of sandwiches
    (unmade ?s - sandwich)
    (made ?s - sandwich)
    (on-tray ?s - sandwich ?t - tray)

    ;; dietary flags
    (sandwich-gluten-free ?s - sandwich)
    (bread-gluten-free ?b - bread)
    (content-gluten-free ?c - content)
    (child-allergic-gluten ?ch - child)

    ;; completion
    (served ?ch - child)
  )

  ;; Make a gluten-free sandwich: consumes a GF bread and GF content in kitchen.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (unmade ?s)
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (bread-gluten-free ?b)
      (content-gluten-free ?c)
    )
    :effect (and
      (made ?s)
      (not (unmade ?s))
      (at-sandwich ?s kitchen)
      (sandwich-gluten-free ?s)

      ;; consume inputs (no longer at kitchen)
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Make a generic sandwich: consumes any bread and content in kitchen.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (unmade ?s)
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
    )
    :effect (and
      (made ?s)
      (not (unmade ?s))
      (at-sandwich ?s kitchen)

      ;; consume inputs
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Place a made sandwich onto a co-located tray. Sandwich leaves the location and becomes on-tray.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (made ?s)
      (at-sandwich ?s ?p)
      (at-tray ?t ?p)
    )
    :effect (and
      (on-tray ?s ?t)
      (not (at-sandwich ?s ?p))
    )
  )

  ;; Move a tray (sandwiches on it remain on-tray implicitly).
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at-tray ?t ?from)
    )
    :effect (and
      (at-tray ?t ?to)
      (not (at-tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child: requires GF sandwich on a tray at child's place.
  (:action serve_sandwich_no_gluten
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (child-allergic-gluten ?ch)
      (at-child ?ch ?p)
      (at-tray ?t ?p)
      (on-tray ?s ?t)
      (sandwich-gluten-free ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
      (not (made ?s))
      (not (sandwich-gluten-free ?s))
      (not (at-sandwich ?s ?p))
    )
  )

  ;; Serve any sandwich to a non-allergic child.
  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (at-child ?ch ?p)
      (at-tray ?t ?p)
      (on-tray ?s ?t)
      (not (child-allergic-gluten ?ch))
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
      (not (made ?s))
      (not (sandwich-gluten-free ?s))
      (not (at-sandwich ?s ?p))
    )
  )

)