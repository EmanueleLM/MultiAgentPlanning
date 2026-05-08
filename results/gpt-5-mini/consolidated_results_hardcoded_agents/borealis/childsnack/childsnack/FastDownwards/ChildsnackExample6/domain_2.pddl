(define (domain child-snack)
  (:requirements :typing :strips :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    ;; ingredients
    (bread-available ?b - bread-portion)
    (content-available ?c - content-portion)
    (bread-gf ?b - bread-portion)
    (content-gf ?c - content-portion)

    ;; sandwich lifecycle & properties
    (sandwich-unused ?s - sandwich)      ; placeholder not yet used
    (sandwich-exists ?s - sandwich)      ; created and available
    (sandwich-unassigned ?s - sandwich)  ; created but not yet reserved for a child
    (sandwich-gf ?s - sandwich)          ; sandwich is gluten-free
    (sand-in-kitchen ?s - sandwich)      ; created and located in kitchen
    (sandwich-on-tray ?s - sandwich ?tr - tray)
    (assigned-for ?s - sandwich ?ch - child)

    ;; trays & places
    (tray-at ?tr - tray ?p - place)
    (waiting ?ch - child ?p - place)
    (allergic-gluten ?ch - child)
    (served ?ch - child)
  )

  ;; make a gluten-free sandwich: both bread and content must be GF
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (sandwich-unused ?s)
      (bread-available ?b)
      (content-available ?c)
      (bread-gf ?b)
      (content-gf ?c)
    )
    :effect (and
      (not (sandwich-unused ?s))
      (sandwich-exists ?s)
      (sandwich-unassigned ?s)
      (sandwich-gf ?s)
      (sand-in-kitchen ?s)
      (not (bread-available ?b))
      (not (content-available ?c))
    )
  )

  ;; make a sandwich where the bread is non-GF (content may be GF or not) => result is non-GF
  (:action make_sandwich_bread_non_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (sandwich-unused ?s)
      (bread-available ?b)
      (content-available ?c)
      (not (bread-gf ?b))
    )
    :effect (and
      (not (sandwich-unused ?s))
      (sandwich-exists ?s)
      (sandwich-unassigned ?s)
      (sand-in-kitchen ?s)
      (not (bread-available ?b))
      (not (content-available ?c))
    )
  )

  ;; make a sandwich where the content is non-GF (bread may be GF or not) => result is non-GF
  (:action make_sandwich_content_non_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (sandwich-unused ?s)
      (bread-available ?b)
      (content-available ?c)
      (not (content-gf ?c))
    )
    :effect (and
      (not (sandwich-unused ?s))
      (sandwich-exists ?s)
      (sandwich-unassigned ?s)
      (sand-in-kitchen ?s)
      (not (bread-available ?b))
      (not (content-available ?c))
    )
  )

  ;; assign a created sandwich to a child (reservation). This prevents re-assignment.
  (:action assign_sandwich
    :parameters (?s - sandwich ?ch - child)
    :precondition (and
      (sandwich-exists ?s)
      (sandwich-unassigned ?s)
      (not (served ?ch))
    )
    :effect (and
      (assigned-for ?s ?ch)
      (not (sandwich-unassigned ?s))
    )
  )

  ;; place a sandwich from kitchen onto a tray that is in the kitchen; require that sandwich is reserved for the child
  (:action put_on_tray
    :parameters (?s - sandwich ?tr - tray ?ch - child)
    :precondition (and
      (sandwich-exists ?s)
      (assigned-for ?s ?ch)
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
    :precondition (and
      (tray-at ?tr ?from)
    )
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
      (assigned-for ?s ?ch)
      (sandwich-exists ?s)
      (sandwich-gf ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
    )
  )

  ;; serve a sandwich to a non-allergic child
  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?tr - tray ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (tray-at ?tr ?p)
      (sandwich-on-tray ?s ?tr)
      (assigned-for ?s ?ch)
      (sandwich-exists ?s)
      (not (allergic-gluten ?ch))
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
    )
  )
)