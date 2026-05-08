(define (domain child-snack)
  (:requirements :typing :strips :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    ;; ingredient markers and usage
    (bread-gf ?b - bread-portion)
    (content-gf ?c - content-portion)
    (used-bread ?b - bread-portion)
    (used-content ?c - content-portion)

    ;; sandwich lifecycle & properties
    (sandwich-exists ?s - sandwich)
    (sandwich-gf ?s - sandwich)
    (sand-in-kitchen ?s - sandwich)
    (sandwich-on-tray ?s - sandwich ?tr - tray)
    (assigned ?s - sandwich)

    ;; trays, children and serving
    (tray-at ?tr - tray ?p - place)
    (waiting ?ch - child ?p - place)
    (allergic-gluten ?ch - child)
    (served ?ch - child)
  )

  ;; make a gluten-free sandwich: both bread and content must be GF
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich-exists ?s))
      (not (used-bread ?b))
      (not (used-content ?c))
      (bread-gf ?b)
      (content-gf ?c)
    )
    :effect (and
      (sandwich-exists ?s)
      (sand-in-kitchen ?s)
      (sandwich-gf ?s)
      (used-bread ?b)
      (used-content ?c)
    )
  )

  ;; make a sandwich where the bread is non-GF (content may be GF or not) => result is non-GF
  (:action make_sandwich_bread_non_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich-exists ?s))
      (not (used-bread ?b))
      (not (used-content ?c))
      (not (bread-gf ?b))
    )
    :effect (and
      (sandwich-exists ?s)
      (sand-in-kitchen ?s)
      (used-bread ?b)
      (used-content ?c)
    )
  )

  ;; make a sandwich where the content is non-GF (bread may be GF or not) => result is non-GF
  (:action make_sandwich_content_non_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich-exists ?s))
      (not (used-bread ?b))
      (not (used-content ?c))
      (not (content-gf ?c))
    )
    :effect (and
      (sandwich-exists ?s)
      (sand-in-kitchen ?s)
      (used-bread ?b)
      (used-content ?c)
    )
  )

  ;; reserve/assign a created sandwich for a child to avoid reuse
  (:action assign_sandwich
    :parameters (?s - sandwich ?ch - child)
    :precondition (and
      (sandwich-exists ?s)
      (not (assigned ?s))
      (not (served ?ch))
    )
    :effect (and
      (assigned ?s)
    )
  )

  ;; place a sandwich from kitchen onto a tray that is in the kitchen; sandwich must be assigned
  (:action put_on_tray
    :parameters (?s - sandwich ?tr - tray ?ch - child)
    :precondition (and
      (sandwich-exists ?s)
      (assigned ?s)
      (sand-in-kitchen ?s)
      (tray-at ?tr kitchen)
    )
    :effect (and
      (sandwich-on-tray ?s ?tr)
      (not (sand-in-kitchen ?s))
    )
  )

  ;; move a tray from one place to another
  (:action move_tray
    :parameters (?tr - tray ?from - place ?to - place)
    :precondition (tray-at ?tr ?from)
    :effect (and
      (not (tray-at ?tr ?from))
      (tray-at ?tr ?to)
    )
  )

  ;; serve a gluten-free sandwich to an allergic child
  (:action serve_sandwich_no_gluten
    :parameters (?ch - child ?s - sandwich ?tr - tray ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (tray-at ?tr ?p)
      (sandwich-on-tray ?s ?tr)
      (assigned ?s)
      (sandwich-exists ?s)
      (sandwich-gf ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
      (not (assigned ?s))
    )
  )

  ;; serve a sandwich to a non-allergic child
  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?tr - tray ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (tray-at ?tr ?p)
      (sandwich-on-tray ?s ?tr)
      (assigned ?s)
      (sandwich-exists ?s)
      (not (allergic-gluten ?ch))
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
      (not (assigned ?s))
    )
  )
)