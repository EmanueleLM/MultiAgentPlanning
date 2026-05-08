(define (domain child-snack)
  (:requirements :typing :negative-preconditions :equality :strips)
  (:types child bread-portion content-portion sandwich tray place)

  (:constants kitchen - place)

  (:predicates
    ;; tray location
    (at ?tr - tray ?p - place)

    ;; ingredients available in kitchen
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)

    ;; ingredient gluten-free markings
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; sandwich placeholders / existence
    (notexist ?s - sandwich)         ; sandwich placeholder unused
    (in_kitchen ?s - sandwich)       ; sandwich exists in kitchen (made)
    (sand_no_gluten ?s - sandwich)   ; sandwich is gluten-free

    ;; sandwich on a tray
    (on ?s - sandwich ?tr - tray)

    ;; children state and locations
    (waiting ?c - child ?p - place)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (served ?c - child)
  )

  ;; Make a gluten-free sandwich: consumes a gluten-free bread and a gluten-free content portion,
  ;; consumes the sandwich placeholder and produces an instantiated gluten-free sandwich in kitchen.
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

  ;; Make a regular sandwich: consumes a bread and a content portion,
  ;; consumes the sandwich placeholder and produces an instantiated sandwich in kitchen.
  ;; This action does not label the sandwich as gluten-free even if the ingredients happen to be GF.
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

  ;; Place a made sandwich onto a tray that is currently at the kitchen.
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

  ;; Serve a gluten-free sandwich to a child who is allergic to gluten:
  ;; requires the tray to be at the child's place, the sandwich on that tray, the child waiting there,
  ;; the child allergic, the sandwich marked gluten-free, and the child not yet served.
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

  ;; Serve a sandwich to a child who is not allergic to gluten:
  ;; requires the tray to be at the child's place, the sandwich on that tray, the child waiting there,
  ;; the child marked not allergic, and the child not yet served.
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