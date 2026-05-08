(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types
    child
    bread-portion
        gf_bread reg_bread - bread-portion
    content-portion
        gf_content reg_content - content-portion
    sandwich
        gf_sandwich reg_sandwich - sandwich
    tray place
  )

  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c_portion - content-portion)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (notexist ?s - sandwich)
    (sandwich_available_in_kitchen ?s - sandwich)
    (sandwich_on_tray ?s - sandwich ?t - tray)
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - gf_sandwich ?b - gf_bread ?c_portion - gf_content)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c_portion)
    )
    :effect (and
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c_portion))
      (sandwich_available_in_kitchen ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - reg_sandwich ?b - reg_bread ?c_portion - reg_content)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c_portion)
    )
    :effect (and
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c_portion))
      (sandwich_available_in_kitchen ?s)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (sandwich_available_in_kitchen ?s)
      (at ?t kitchen)
    )
    :effect (and
      (not (sandwich_available_in_kitchen ?s))
      (sandwich_on_tray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - gf_sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (sandwich_on_tray ?s ?t)
      (at ?t ?p)
    )
    :effect (and
      (not (sandwich_on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  (:action serve_sandwich
    :parameters (?s - reg_sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (sandwich_on_tray ?s ?t)
      (at ?t ?p)
    )
    :effect (and
      (not (sandwich_on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (and
      (at ?t ?p1)
      (not (= ?p1 ?p2))
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)