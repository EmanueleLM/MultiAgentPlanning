(define (domain child-snack)
  (:requirements :typing :negative-preconditions :equality)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    ; Availability/Usage of ingredients/components (Using negation/CWA for initial availability)
    (used_bread ?b - bread-portion)
    (used_content ?c - content-portion)
    
    ; Sandwich location/state
    (at_kitchen_sandwich ?s - sandwich)
    (at ?t - tray ?p - place)
    (on_tray ?s - sandwich ?t - tray)

    ; Gluten properties (configuration facts)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (no_gluten_sandwich ?s - sandwich)

    ; State tracking for creation
    (notexist ?s - sandwich)

    ; Child state
    (allergic_gluten ?c - child) 
    (waiting ?c - child ?p - place)
    (served ?c - child)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
        (not (used_bread ?b)) ; GF bread must be available
        (no_gluten_bread ?b)
        (not (used_content ?c)) ; GF content must be available
        (no_gluten_content ?c)
        (notexist ?s)
    )
    :effect (and
        (used_bread ?b)
        (used_content ?c)
        (not (notexist ?s))
        (at_kitchen_sandwich ?s)
        (no_gluten_sandwich ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
        (not (used_bread ?b)) ; Regular bread must be available
        (not (used_content ?c)) ; Regular content must be available
        (notexist ?s)
    )
    :effect (and
        (used_bread ?b)
        (used_content ?c)
        (not (notexist ?s))
        (at_kitchen_sandwich ?s)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
        (at_kitchen_sandwich ?s)
        (at ?t kitchen)
    )
    :effect (and
        (not (at_kitchen_sandwich ?s))
        (on_tray ?s ?t)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
        (allergic_gluten ?c)
        (waiting ?c ?p)
        (on_tray ?s ?t)
        (no_gluten_sandwich ?s) ; Requires GF sandwich
        (at ?t ?p)
    )
    :effect (and
        (not (on_tray ?s ?t))
        (not (waiting ?c ?p))
        (served ?c)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
        (not (allergic_gluten ?c)) ; Requires non-allergic child
        (waiting ?c ?p)
        (on_tray ?s ?t)
        (at ?t ?p)
        (not (no_gluten_sandwich ?s)) ; Requires regular sandwich
    )
    :effect (and
        (not (on_tray ?s ?t))
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