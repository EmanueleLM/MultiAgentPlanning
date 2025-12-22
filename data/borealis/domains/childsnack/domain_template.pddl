(define (domain child-snack)
  (:requirements :typing :equality)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates)

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition ()
    :effect ()
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition ()
    :effect ()
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition ()
    :effect ()
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition ()
    :effect ()
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition ()
    :effect ()
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition ()
    :effect ()
  )
)