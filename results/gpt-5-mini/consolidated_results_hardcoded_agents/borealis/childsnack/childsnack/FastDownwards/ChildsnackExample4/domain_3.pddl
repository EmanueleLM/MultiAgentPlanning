(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types place child bread_portion content_portion sandwich tray)
  (:constants kitchen - place)

  (:predicates
    (at_tray ?t - tray ?p - place)               ; tray ?t is at place ?p
    (at_bread ?b - bread_portion ?p - place)    ; bread portion ?b is at place ?p
    (at_content ?c - content_portion ?p - place); content portion ?c is at place ?p
    (at_sandw ?s - sandwich ?p - place)         ; sandwich ?s is at place ?p

    (notexist ?s - sandwich)                    ; sandwich object ?s has not been created yet
    (exists_sandw ?s - sandwich)                ; sandwich object ?s exists (was created)

    (sandwich_gf ?s - sandwich)                 ; sandwich ?s is gluten-free
    (sandwich_gluten ?s - sandwich)             ; sandwich ?s may contain gluten

    (gf_bread ?b - bread_portion)               ; bread portion ?b is gluten-free
    (gf_content ?c - content_portion)           ; content portion ?c is gluten-free

    (on_tray ?s - sandwich ?t - tray)           ; sandwich ?s is currently on tray ?t

    (allergic ?ch - child)                      ; child ?ch is allergic to gluten
    (waiting ?ch - child ?p - place)            ; child ?ch is waiting at place ?p
    (served ?ch - child)                        ; child ?ch has been served a safe sandwich
  )

  ;; Make a gluten-free sandwich: requires both bread and content be gluten-free.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (notexist ?s)
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (gf_bread ?b)
      (gf_content ?c)
    )
    :effect (and
      (exists_sandw ?s)
      (sandwich_gf ?s)
      (at_sandw ?s kitchen)
      (not (notexist ?s))
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))
    )
  )

  ;; Make a sandwich when the bread has gluten (content may be anything).
  (:action make_sandwich_bread_has_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (notexist ?s)
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gf_bread ?b))
    )
    :effect (and
      (exists_sandw ?s)
      (sandwich_gluten ?s)
      (at_sandw ?s kitchen)
      (not (notexist ?s))
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))
    )
  )

  ;; Make a sandwich when the content has gluten (bread may be anything).
  (:action make_sandwich_content_has_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (notexist ?s)
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gf_content ?c))
    )
    :effect (and
      (exists_sandw ?s)
      (sandwich_gluten ?s)
      (at_sandw ?s kitchen)
      (not (notexist ?s))
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))
    )
  )

  ;; Place an existing sandwich that is at the same place onto a tray at that place.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (exists_sandw ?s)
      (at_sandw ?s ?p)
      (at_tray ?t ?p)
      (not (on_tray ?s ?t))
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at_sandw ?s ?p))
    )
  )

  ;; Move a tray from one place to another (allows carrying sandwiches on it).
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_tray ?t ?from)
      (not (at_tray ?t ?to))
    )
    :effect (and
      (at_tray ?t ?to)
      (not (at_tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child at the location where both the tray and child are.
  (:action serve_sandwich_no_gluten
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (allergic ?ch)
      (sandwich_gf ?s)
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?ch ?p)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on_tray ?s ?t))
      (not (exists_sandw ?s))
    )
  )

  ;; Serve a sandwich that may contain gluten to a non-allergic child.
  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (not (allergic ?ch))
      (sandwich_gluten ?s)
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?ch ?p)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on_tray ?s ?t))
      (not (exists_sandw ?s))
    )
  )
)