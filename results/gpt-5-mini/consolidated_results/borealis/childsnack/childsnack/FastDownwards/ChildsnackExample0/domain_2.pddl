(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place stage)
  (:constants kitchen - place)

  (:predicates
    (at ?tr - tray ?p - place)                        ; tray location
    (at_kitchen_bread ?b - bread-portion)            ; bread portion available in kitchen
    (at_kitchen_content ?c - content-portion)        ; content portion available in kitchen
    (no_gluten_bread ?b - bread-portion)             ; bread portion is gluten-free
    (no_gluten_content ?c - content-portion)         ; content portion is gluten-free
    (notexist ?s - sandwich)                         ; sandwich id not yet produced
    (at_kitchen_sandwich ?s - sandwich)              ; sandwich present in kitchen (not on tray)
    (on_tray ?s - sandwich ?tr - tray)               ; sandwich placed on tray
    (gluten_free ?s - sandwich)                      ; sandwich marked gluten-free
    (waiting ?ch - child ?p - place)                 ; child waiting at place
    (served ?ch - child)                             ; child has been served
    (allergic_gluten ?ch - child)                    ; child is allergic to gluten
    (not_allergic_gluten ?ch - child)                ; child is not allergic to gluten
    (stage_current ?st - stage)                      ; current discrete stage/time
    (succ ?st1 - stage ?st2 - stage)                 ; successor relation between stages
  )

  ;; Make a gluten-free sandwich: consumes gluten-free bread and content, creates sandwich in kitchen,
  ;; marks it gluten_free, and advances the current stage contiguously.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?st - stage ?st2 - stage)
    :precondition (and
                    (notexist ?s)
                    (at_kitchen_bread ?b)
                    (at_kitchen_content ?c)
                    (no_gluten_bread ?b)
                    (no_gluten_content ?c)
                    (stage_current ?st)
                    (succ ?st ?st2)
                  )
    :effect (and
              (not (notexist ?s))
              (not (at_kitchen_bread ?b))
              (not (at_kitchen_content ?c))
              (at_kitchen_sandwich ?s)
              (gluten_free ?s)
              (not (stage_current ?st))
              (stage_current ?st2)
            )
  )

  ;; Make a regular (not guaranteed gluten-free) sandwich:
  ;; consumes bread and content, creates sandwich in kitchen, ensures it is not gluten_free, advance stage.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?st - stage ?st2 - stage)
    :precondition (and
                    (notexist ?s)
                    (at_kitchen_bread ?b)
                    (at_kitchen_content ?c)
                    (stage_current ?st)
                    (succ ?st ?st2)
                  )
    :effect (and
              (not (notexist ?s))
              (not (at_kitchen_bread ?b))
              (not (at_kitchen_content ?c))
              (at_kitchen_sandwich ?s)
              ;; explicit negative effect to make clear this sandwich is not marked gluten_free
              (not (gluten_free ?s))
              (not (stage_current ?st))
              (stage_current ?st2)
            )
  )

  ;; Put a kitchen sandwich onto a tray that is at the kitchen. Advances stage contiguously.
  (:action put_on_tray
    :parameters (?s - sandwich ?tr - tray ?st - stage ?st2 - stage)
    :precondition (and
                    (at_kitchen_sandwich ?s)
                    (at ?tr kitchen)
                    (stage_current ?st)
                    (succ ?st ?st2)
                  )
    :effect (and
              (not (at_kitchen_sandwich ?s))
              (on_tray ?s ?tr)
              (not (stage_current ?st))
              (stage_current ?st2)
            )
  )

  ;; Move a tray from one place to another. Requires tray at source, advances stage.
  (:action move_tray
    :parameters (?tr - tray ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
                    (at ?tr ?from)
                    (stage_current ?st)
                    (succ ?st ?st2)
                  )
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
              (not (stage_current ?st))
              (stage_current ?st2)
            )
  )

  ;; Serve a gluten-free sandwich to a child allergic to gluten:
  ;; requires sandwich on tray, tray at child's place, child allergic, sandwich marked gluten_free, advances stage,
  ;; and removes sandwich from tray (consumed).
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place ?st - stage ?st2 - stage)
    :precondition (and
                    (allergic_gluten ?ch)
                    (waiting ?ch ?p)
                    (at ?tr ?p)
                    (on_tray ?s ?tr)
                    (gluten_free ?s)
                    (stage_current ?st)
                    (succ ?st ?st2)
                  )
    :effect (and
              (not (on_tray ?s ?tr))
              (served ?ch)
              (not (stage_current ?st))
              (stage_current ?st2)
            )
  )

  ;; Serve a regular (non-allergic) sandwich to a child not allergic to gluten:
  ;; requires sandwich on tray, tray at child's place, child not allergic, advances stage, and consumes the sandwich.
  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place ?st - stage ?st2 - stage)
    :precondition (and
                    (not_allergic_gluten ?ch)
                    (waiting ?ch ?p)
                    (at ?tr ?p)
                    (on_tray ?s ?tr)
                    (stage_current ?st)
                    (succ ?st ?st2)
                  )
    :effect (and
              (not (on_tray ?s ?tr))
              (served ?ch)
              (not (stage_current ?st))
              (stage_current ?st2)
            )
  )
)