(define (domain child-snack)
  (:requirements :typing :negative-preconditions :equality :strips)
  (:types child bread-portion content-portion sandwich tray place)

  (:constants kitchen - place)

  (:predicates
    (at ?tr - tray ?p - place)                      ; tray location
    (at_kitchen_bread ?b - bread-portion)          ; bread portion available in kitchen
    (at_kitchen_content ?c - content-portion)      ; content portion available in kitchen
    (no_gluten_bread ?b - bread-portion)           ; bread portion is gluten-free
    (no_gluten_content ?c - content-portion)       ; content portion is gluten-free
    (notexist ?s - sandwich)                       ; sandwich placeholder not used yet
    (in_kitchen ?s - sandwich)                     ; sandwich exists in the kitchen (made)
    (sand_no_gluten ?s - sandwich)                 ; sandwich is gluten-free
    (on ?s - sandwich ?tr - tray)                  ; sandwich is on a tray
    (waiting ?c - child ?p - place)                ; child is waiting at a place
    (allergic_gluten ?c - child)                   ; child is allergic to gluten
    (not_allergic_gluten ?c - child)               ; child is not allergic to gluten
    (served ?c - child)                            ; child has been served
  )

  ;; Make a gluten-free sandwich: requires both bread and content to be gluten-free.
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
              (not (at_kitchen_bread ?b))
              (not (at_kitchen_content ?c))
              (not (notexist ?s))
              (in_kitchen ?s)
              (sand_no_gluten ?s)
            )
  )

  ;; Make a regular sandwich (generic): consumes bread and content, produces a sandwich in kitchen.
  ;; Note: this action does not mark the sandwich as gluten-free even if both ingredients happen to be GF.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
                    (notexist ?s)
                    (at_kitchen_bread ?b)
                    (at_kitchen_content ?c)
                   )
    :effect (and
              (not (at_kitchen_bread ?b))
              (not (at_kitchen_content ?c))
              (not (notexist ?s))
              (in_kitchen ?s)
            )
  )

  ;; Put a made sandwich onto a tray that is in the kitchen.
  (:action put_on_tray
    :parameters (?s - sandwich ?tr - tray)
    :precondition (and
                    (in_kitchen ?s)
                    (at ?tr kitchen)
                    (not (on ?s ?tr))
                  )
    :effect (and
              (not (in_kitchen ?s))
              (on ?s ?tr)
            )
  )

  ;; Move a tray from one place to another.
  (:action move_tray
    :parameters (?tr - tray ?from - place ?to - place)
    :precondition (and
                    (at ?tr ?from)
                  )
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
            )
  )

  ;; Serve a gluten-free sandwich to a child allergic to gluten.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?tr - tray ?p - place)
    :precondition (and
                    (on ?s ?tr)
                    (at ?tr ?p)
                    (waiting ?c ?p)
                    (allergic_gluten ?c)
                    (sand_no_gluten ?s)
                    (not (served ?c))
                  )
    :effect (and
              (served ?c)
              (not (on ?s ?tr))
            )
  )

  ;; Serve a sandwich to a child who is not allergic to gluten.
  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?tr - tray ?p - place)
    :precondition (and
                    (on ?s ?tr)
                    (at ?tr ?p)
                    (waiting ?c ?p)
                    (not_allergic_gluten ?c)
                    (not (served ?c))
                  )
    :effect (and
              (served ?c)
              (not (on ?s ?tr))
            )
  )
)