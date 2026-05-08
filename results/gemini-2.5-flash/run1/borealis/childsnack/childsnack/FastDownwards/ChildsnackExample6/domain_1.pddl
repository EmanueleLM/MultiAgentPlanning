(define (domain child-snack)
  (:requirements :typing :equality :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (notexist ?s - sandwich) ; sandwich does not exist yet
    (served ?c - child)
    (at ?t - tray ?p - place) ; tray location

    ; Predicates for internal state of sandwiches
    (sandwich_in_kitchen ?s - sandwich) ; sandwich has been made and is in the kitchen
    (on_tray ?s - sandwich ?t - tray) ; sandwich is on a specific tray
    (is_gluten_free ?s - sandwich) ; marks a sandwich as gluten-free
    (is_regular ?s - sandwich) ; marks a sandwich as regular (contains gluten)
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
                    (at_kitchen_bread ?b)
                    (no_gluten_bread ?b)
                    (at_kitchen_content ?c)
                    (no_gluten_content ?c)
                    (notexist ?s) ; sandwich must not already exist
                  )
    :effect (and
              (not (at_kitchen_bread ?b))
              (not (at_kitchen_content ?c))
              (not (notexist ?s)) ; sandwich now exists
              (sandwich_in_kitchen ?s)
              (is_gluten_free ?s)
            )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
                    (at_kitchen_bread ?b)
                    (not (no_gluten_bread ?b)) ; must be regular bread
                    (at_kitchen_content ?c)
                    (not (no_gluten_content ?c)) ; must be regular content
                    (notexist ?s) ; sandwich must not already exist
                  )
    :effect (and
              (not (at_kitchen_bread ?b))
              (not (at_kitchen_content ?c))
              (not (notexist ?s))
              (sandwich_in_kitchen ?s)
              (is_regular ?s)
            )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
                    (sandwich_in_kitchen ?s)
                    (at ?t kitchen) ; tray must be at the kitchen
                  )
    :effect (and
              (not (sandwich_in_kitchen ?s))
              (on_tray ?s ?t)
            )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
                    (allergic_gluten ?c)
                    (waiting ?c ?p)
                    (is_gluten_free ?s) ; sandwich must be gluten-free
                    (on_tray ?s ?t) ; sandwich must be on a tray
                    (at ?t ?p) ; tray must be at the same place as the child
                  )
    :effect (and
              (not (on_tray ?s ?t))
              (served ?c)
            )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
                    (not_allergic_gluten ?c)
                    (waiting ?c ?p)
                    (is_regular ?s) ; sandwich must be regular
                    (on_tray ?s ?t)
                    (at ?t ?p)
                  )
    :effect (and
              (not (on_tray ?s ?t))
              (served ?c)
            )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and
              (not (at ?t ?p1))
              (at ?t ?p2)
            )
  )
)