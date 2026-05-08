(define (domain child-snack)
  (:requirements :typing :negative-preconditions :equality)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)                       ; tray at place
    (at_kitchen_bread ?b - bread-portion)          ; bread portion available in kitchen
    (at_kitchen_content ?c - content-portion)      ; content portion available in kitchen
    (no_gluten_bread ?b - bread-portion)           ; bread portion is gluten-free
    (no_gluten_content ?c - content-portion)       ; content portion is gluten-free
    (notexist ?s - sandwich)                       ; sandwich object not yet created/used
    (in_kitchen ?s - sandwich)                     ; sandwich currently in kitchen (ready)
    (on ?s - sandwich ?t - tray)                   ; sandwich on tray
    (gluten_free ?s - sandwich)                    ; sandwich is gluten-free
    (allergic_gluten ?ch - child)                  ; child is allergic to gluten
    (not_allergic_gluten ?ch - child)              ; child is not allergic to gluten
    (waiting ?ch - child ?p - place)               ; child waiting at place
    (served ?ch - child)                           ; child has been served
    (consumed ?s - sandwich)                       ; sandwich has been consumed/served
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (in_kitchen ?s)
      (gluten_free ?s)
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (no_gluten_bread ?b))
      (not (no_gluten_content ?c))
    )
    :effect (and
      (not (notexist ?s))
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (in_kitchen ?s)
      ; intentionally do not add (gluten_free ?s)
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (in_kitchen ?s)
      (at ?t kitchen)
    )
    :effect (and
      (not (in_kitchen ?s))
      (on ?s ?t)
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (at ?t ?p1)
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?ch)
      (waiting ?ch ?p)
      (at ?t ?p)
      (on ?s ?t)
      (gluten_free ?s)
      (not (consumed ?s))
    )
    :effect (and
      (not (on ?s ?t))
      (served ?ch)
      (consumed ?s)
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?ch)
      (waiting ?ch ?p)
      (at ?t ?p)
      (on ?s ?t)
      (not (consumed ?s))
    )
    :effect (and
      (not (on ?s ?t))
      (served ?ch)
      (consumed ?s)
    )
  )
)