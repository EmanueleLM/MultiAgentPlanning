(define (domain child-snack)
  (:requirements :typing :strips :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place stage)

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

    ;; explicit discrete-stage progression
    (current ?st - stage)
    (succ ?st1 - stage ?st2 - stage)
  )

  ;; All actions consume one stage step: require (current ?st) and a successor (?st ?stnext)
  ;; and advance the "current" marker to ?stnext. This enforces a strict linear ordering of actions.

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?ch - child ?st - stage ?stnext - stage)
    :precondition (and
      (not (sandwich-exists ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (bread-gf ?b)
      (content-gf ?c)
      (current ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      (sandwich-exists ?s)
      (sand-in-kitchen ?s)
      (sandwich-gf ?s)
      (assigned ?s ?ch)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (current ?st))
      (current ?stnext)
    )
  )

  (:action make_sandwich_bread_non_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?ch - child ?st - stage ?stnext - stage)
    :precondition (and
      (not (sandwich-exists ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (bread-gf ?b))
      (current ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      (sandwich-exists ?s)
      (sand-in-kitchen ?s)
      (assigned ?s ?ch)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (current ?st))
      (current ?stnext)
    )
  )

  (:action make_sandwich_content_non_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?ch - child ?st - stage ?stnext - stage)
    :precondition (and
      (not (sandwich-exists ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (content-gf ?c))
      (current ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      (sandwich-exists ?s)
      (sand-in-kitchen ?s)
      (assigned ?s ?ch)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (current ?st))
      (current ?stnext)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?tr - tray ?ch - child ?st - stage ?stnext - stage)
    :precondition (and
      (sandwich-exists ?s)
      (assigned ?s ?ch)
      (sand-in-kitchen ?s)
      (tray-at ?tr kitchen)
      (current ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      (sandwich-on-tray ?s ?tr)
      (not (sand-in-kitchen ?s))
      (not (current ?st))
      (current ?stnext)
    )
  )

  (:action move_tray
    :parameters (?tr - tray ?from - place ?to - place ?st - stage ?stnext - stage)
    :precondition (and
      (tray-at ?tr ?from)
      (current ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      (not (tray-at ?tr ?from))
      (tray-at ?tr ?to)
      (not (current ?st))
      (current ?stnext)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place ?st - stage ?stnext - stage)
    :precondition (and
      (waiting ?ch ?p)
      (tray-at ?tr ?p)
      (sandwich-on-tray ?s ?tr)
      (sandwich-exists ?s)
      (assigned ?s ?ch)
      (sandwich-gf ?s)
      (allergic-gluten ?ch)
      (not (served ?ch))
      (current ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      (served ?ch)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
      (not (assigned ?s ?ch))
      (not (current ?st))
      (current ?stnext)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place ?st - stage ?stnext - stage)
    :precondition (and
      (waiting ?ch ?p)
      (tray-at ?tr ?p)
      (sandwich-on-tray ?s ?tr)
      (sandwich-exists ?s)
      (assigned ?s ?ch)
      (not (allergic-gluten ?ch))
      (not (served ?ch))
      (current ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      (served ?ch)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
      (not (assigned ?s ?ch))
      (not (current ?st))
      (current ?stnext)
    )
  )
)