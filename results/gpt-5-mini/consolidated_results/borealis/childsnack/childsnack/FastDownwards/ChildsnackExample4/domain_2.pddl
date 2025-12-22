(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types place child bread_portion content_portion sandwich tray)
  (:constants kitchen - place)

  (:predicates
    (at_tray ?t - tray ?p - place)
    (at_bread ?b - bread_portion ?p - place)
    (at_content ?c - content_portion ?p - place)
    (at_sandw ?s - sandwich ?p - place)

    (notexist ?s - sandwich)
    (exists_sandw ?s - sandwich)

    (sandwich_gf ?s - sandwich)
    (sandwich_gluten ?s - sandwich)

    (gf_bread ?b - bread_portion)
    (gf_content ?c - content_portion)

    (on_tray ?s - sandwich ?t - tray)

    (allergic ?ch - child)
    (waiting ?ch - child ?p - place)
    (served ?ch - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (notexist ?s)
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (gf_bread ?b)
      (gf_content ?c)
    )
    :effect (and
      (exists_sandw ?s)
      (sandwich_gf ?s)
      (at_sandw ?s kitchen)
      (not (notexist ?s))
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))
    )
  )

  (:action make_sandwich_bread_has_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (notexist ?s)
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gf_bread ?b))
    )
    :effect (and
      (exists_sandw ?s)
      (sandwich_gluten ?s)
      (at_sandw ?s kitchen)
      (not (notexist ?s))
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))
    )
  )

  (:action make_sandwich_content_has_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (notexist ?s)
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gf_content ?c))
    )
    :effect (and
      (exists_sandw ?s)
      (sandwich_gluten ?s)
      (at_sandw ?s kitchen)
      (not (notexist ?s))
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (exists_sandw ?s)
      (at_sandw ?s ?p)
      (at_tray ?t ?p)
      (not (on_tray ?s ?t))
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at_sandw ?s ?p))
    )
  )

  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_tray ?t ?from)
      (not (at_tray ?t ?to))
    )
    :effect (and
      (at_tray ?t ?to)
      (not (at_tray ?t ?from))
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich_gf ?s)
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?ch ?p)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on_tray ?s ?t))
      (not (exists_sandw ?s))
    )
  )

  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (sandwich_gluten ?s)
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?ch ?p)
      (not (allergic ?ch))
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on_tray ?s ?t))
      (not (exists_sandw ?s))
    )
  )
)