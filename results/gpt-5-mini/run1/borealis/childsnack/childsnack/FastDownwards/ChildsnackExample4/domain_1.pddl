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
    ;; ingredient locations / availability
    (at-bread ?b - bread-portion ?p - place)
    (bread-available ?b - bread-portion)
    (at-content ?c - content-portion ?p - place)
    (content-available ?c - content-portion)

    ;; trays and sandwich placement
    (tray-at ?t - tray ?p - place)
    (sandwich-at ?s - sandwich ?p - place)   ;; sandwich located at a place (when not on a tray)
    (on-tray ?s - sandwich ?t - tray)        ;; sandwich placed on a tray

    ;; sandwich existence and type
    (sandwich-exists ?s - sandwich)
    (sandwich-gluten-free ?s - sandwich)
    (sandwich-contains-gluten ?s - sandwich)

    ;; gluten markers on ingredients
    (gluten-free-bread ?b - bread-portion)
    (gluten-free-content ?c - content-portion)

    ;; children / serving
    (waiting ?ch - child ?p - place)
    (allergic-gluten ?ch - child)
    (served ?ch - child)
  )

  ;; Make a gluten-free sandwich: requires both bread and content be gluten-free and available in kitchen.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at-bread ?b kitchen)
      (bread-available ?b)
      (at-content ?c kitchen)
      (content-available ?c)
      (gluten-free-bread ?b)
      (gluten-free-content ?c)
      (not (sandwich-exists ?s))
    )
    :effect (and
      (sandwich-exists ?s)
      (sandwich-gluten-free ?s)
      (sandwich-at ?s kitchen)
      (not (bread-available ?b))
      (not (content-available ?c))
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Make a sandwich when the bread is non-gluten-free (content may be anything).
  (:action make_sandwich_from_non_gf_bread
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at-bread ?b kitchen)
      (bread-available ?b)
      (at-content ?c kitchen)
      (content-available ?c)
      (not (gluten-free-bread ?b))
      (not (sandwich-exists ?s))
    )
    :effect (and
      (sandwich-exists ?s)
      (sandwich-contains-gluten ?s)
      (sandwich-at ?s kitchen)
      (not (bread-available ?b))
      (not (content-available ?c))
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Make a sandwich when the content is non-gluten-free (bread may be anything).
  (:action make_sandwich_from_non_gf_content
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at-bread ?b kitchen)
      (bread-available ?b)
      (at-content ?c kitchen)
      (content-available ?c)
      (not (gluten-free-content ?c))
      (not (sandwich-exists ?s))
    )
    :effect (and
      (sandwich-exists ?s)
      (sandwich-contains-gluten ?s)
      (sandwich-at ?s kitchen)
      (not (bread-available ?b))
      (not (content-available ?c))
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; Place a sandwich on a tray (both at same place).
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (sandwich-exists ?s)
      (sandwich-at ?s kitchen)
      (tray-at ?t kitchen)
      (not (on-tray ?s ?t))
    )
    :effect (and
      (on-tray ?s ?t)
      (not (sandwich-at ?s kitchen))
    )
  )

  ;; Move a tray from one place to another.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (tray-at ?t ?from)
      (not (tray-at ?t ?to))
    )
    :effect (and
      (tray-at ?t ?to)
      (not (tray-at ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to a child who is allergic (requires sandwich marked gluten-free).
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (on-tray ?s ?t)
      (tray-at ?t ?p)
      (waiting ?ch ?p)
      (sandwich-exists ?s)
      (sandwich-gluten-free ?s)
      (allergic-gluten ?ch)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
      (not (sandwich-exists ?s))
      (not (sandwich-gluten-free ?s))
    )
  )

  ;; Serve a sandwich that contains gluten to a child who is not allergic.
  (:action serve_sandwich
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (on-tray ?s ?t)
      (tray-at ?t ?p)
      (waiting ?ch ?p)
      (sandwich-exists ?s)
      (sandwich-contains-gluten ?s)
      (not (allergic-gluten ?ch))
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
      (not (sandwich-exists ?s))
      (not (sandwich-contains-gluten ?s))
    )
  )

)