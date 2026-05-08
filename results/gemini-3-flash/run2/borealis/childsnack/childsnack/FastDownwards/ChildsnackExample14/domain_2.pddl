(define (domain child-snack)
  (:requirements :typing :negative-preconditions)
  (:types
    place - object
    locatable child - object
    tray sandwich bread-portion content-portion - locatable
    allergic-child non-allergic-child - child
    gf-bread reg-bread - bread-portion
    gf-content reg-content - content-portion
    gf-sandwich reg-sandwich - sandwich
  )
  (:constants kitchen - place)

  (:predicates
    (at ?obj - locatable ?p - place)
    (waiting ?c - child ?p - place)
    (on_tray ?s - sandwich ?t - tray)
    (made ?s - sandwich)
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - gf-sandwich ?b - gf-bread ?c - gf-content)
    :precondition (and (not (made ?s)) (at ?b kitchen) (at ?c kitchen))
    :effect (and (made ?s) (not (at ?b kitchen)) (not (at ?c kitchen)) (at ?s kitchen))
  )

  (:action make_sandwich
    :parameters (?s - reg-sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and (not (made ?s)) (at ?b kitchen) (at ?c kitchen))
    :effect (and (made ?s) (not (at ?b kitchen)) (not (at ?c kitchen)) (at ?s kitchen))
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and (at ?s kitchen) (at ?t kitchen))
    :effect (and (not (at ?s kitchen)) (on_tray ?s ?t))
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - gf-sandwich ?c - allergic-child ?t - tray ?p - place)
    :precondition (and (on_tray ?s ?t) (at ?t ?p) (waiting ?c ?p))
    :effect (and (not (on_tray ?s ?t)) (served ?c) (not (waiting ?c ?p)))
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - non-allergic-child ?t - tray ?p - place)
    :precondition (and (on_tray ?s ?t) (at ?t ?p) (waiting ?c ?p))
    :effect (and (not (on_tray ?s ?t)) (served ?c) (not (waiting ?c ?p)))
  )

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and (not (at ?t ?p1)) (at ?t ?p2))
  )
)