(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place stage)
  (:constants kitchen - place)

  (:predicates
    (at ?tr - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (notexist ?s - sandwich)
    (at_kitchen_sandwich ?s - sandwich)
    (on_tray ?s - sandwich ?tr - tray)
    (gluten_free ?s - sandwich)
    (waiting ?ch - child ?p - place)
    (served ?ch - child)
    (allergic_gluten ?ch - child)
    (not_allergic_gluten ?ch - child)
    (stage_current ?st - stage)
    (succ ?st1 - stage ?st2 - stage)
  )

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
              ;; gluten_free is only added for gluten-free sandwiches;
              ;; absence of gluten_free means sandwich may contain gluten
              (not (stage_current ?st))
              (stage_current ?st2)
            )
  )

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