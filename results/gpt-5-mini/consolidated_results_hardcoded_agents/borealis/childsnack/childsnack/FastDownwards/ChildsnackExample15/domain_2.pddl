(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at-tray ?t - tray ?p - place)
    (at-kitchen-bread ?b - bread-portion)
    (at-kitchen-content ?c - content-portion)
    (no-gluten-bread ?b - bread-portion)
    (no-gluten-content ?c - content-portion)
    (notexist ?s - sandwich)
    (in-kitchen ?s - sandwich)
    (on-tray ?s - sandwich ?t - tray)
    (sandwich-no-gluten ?s - sandwich)
    (allergic-gluten ?ch - child)
    (waiting ?ch - child ?p - place)
    (served ?ch - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at-kitchen-bread ?b)
      (at-kitchen-content ?c)
      (no-gluten-bread ?b)
      (no-gluten-content ?c)
    )
    :effect (and
      (not (at-kitchen-bread ?b))
      (not (at-kitchen-content ?c))
      (not (notexist ?s))
      (in-kitchen ?s)
      (sandwich-no-gluten ?s)
    )
  )

  (:action make_sandwich_bread_not_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at-kitchen-bread ?b)
      (at-kitchen-content ?c)
      (not (no-gluten-bread ?b))
    )
    :effect (and
      (not (at-kitchen-bread ?b))
      (not (at-kitchen-content ?c))
      (not (notexist ?s))
      (in-kitchen ?s)
    )
  )

  (:action make_sandwich_content_not_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at-kitchen-bread ?b)
      (at-kitchen-content ?c)
      (not (no-gluten-content ?c))
    )
    :effect (and
      (not (at-kitchen-bread ?b))
      (not (at-kitchen-content ?c))
      (not (notexist ?s))
      (in-kitchen ?s)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (in-kitchen ?s)
      (at-tray ?t kitchen)
    )
    :effect (and
      (not (in-kitchen ?s))
      (on-tray ?s ?t)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at-tray ?t ?from)
    )
    :effect (and
      (not (at-tray ?t ?from))
      (at-tray ?t ?to)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (allergic-gluten ?ch)
      (waiting ?ch ?p)
      (at-tray ?t ?p)
      (on-tray ?s ?t)
      (sandwich-no-gluten ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (not (allergic-gluten ?ch))
      (waiting ?ch ?p)
      (at-tray ?t ?p)
      (on-tray ?s ?t)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
    )
  )
)