(define (domain child-snack)
  (:requirements :typing :strips :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    ;; ingredient availability and gluten markers
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (bread-gf ?b - bread-portion)
    (content-gf ?c - content-portion)

    ;; sandwich lifecycle & properties
    (sandwich-exists ?s - sandwich)
    (sandwich-gf ?s - sandwich)
    (sand-in-kitchen ?s - sandwich)
    (sandwich-on-tray ?s - sandwich ?tr - tray)
    (assigned ?s - sandwich ?ch - child)

    ;; trays, children and serving
    (tray-at ?tr - tray ?p - place)
    (waiting ?ch - child ?p - place)
    (allergic-gluten ?ch - child)
    (served ?ch - child)
  )

  ;; make a gluten-free sandwich: both bread and content must be GF; create sandwich reserved for a child
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?ch - child)
    :precondition (and
      (not (sandwich-exists ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (bread-gf ?b)
      (content-gf ?c)
    )
    :effect (and
      (sandwich-exists ?s)
      (sand-in-kitchen ?s)
      (sandwich-gf ?s)
      (assigned ?s ?ch)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; make a sandwich where the bread is non-GF (content may be GF or not) => result non-GF; reserve for child
  (:action make_sandwich_bread_non_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?ch - child)
    :precondition (and
      (not (sandwich-exists ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (bread-gf ?b))
    )
    :effect (and
      (sandwich-exists ?s)
      (sand-in-kitchen ?s)
      (assigned ?s ?ch)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; make a sandwich where the content is non-GF (bread may be GF or not) => result non-GF; reserve for child
  (:action make_sandwich_content_non_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?ch - child)
    :precondition (and
      (not (sandwich-exists ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (content-gf ?c))
    )
    :effect (and
      (sandwich-exists ?s)
      (sand-in-kitchen ?s)
      (assigned ?s ?ch)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; place a sandwich from kitchen onto a tray that is in the kitchen; sandwich must be reserved for the intended child
  (:action put_on_tray
    :parameters (?s - sandwich ?tr - tray ?ch - child)
    :precondition (and
      (sandwich-exists ?s)
      (assigned ?s ?ch)
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

  ;; serve a gluten-free sandwich to an allergic child: sandwich must be the one assigned to that child and GF
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (tray-at ?tr ?p)
      (sandwich-on-tray ?s ?tr)
      (sandwich-exists ?s)
      (assigned ?s ?ch)
      (sandwich-gf ?s)
      (allergic-gluten ?ch)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
      (not (assigned ?s ?ch))
    )
  )

  ;; serve a sandwich to a non-allergic child: sandwich must be the one assigned to that child
  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (tray-at ?tr ?p)
      (sandwich-on-tray ?s ?tr)
      (sandwich-exists ?s)
      (assigned ?s ?ch)
      (not (allergic-gluten ?ch))
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
      (not (assigned ?s ?ch))
    )
  )
)