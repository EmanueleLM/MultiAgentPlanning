(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types place child bread_portion content_portion sandwich tray)
  (:constants kitchen - place)

  (:predicates
    (at_tray ?t - tray ?p - place)                 ; tray ?t is at place ?p
    (at_sandw ?s - sandwich ?p - place)            ; sandwich ?s is at place ?p (not on a tray)
    (on_tray ?s - sandwich ?t - tray)              ; sandwich ?s is on tray ?t
    (exists_sandw ?s - sandwich)                   ; sandwich ?s has been created

    (sandwich_gf ?s - sandwich)                    ; sandwich is gluten-free
    (sandwich_gluten ?s - sandwich)                ; sandwich may contain gluten

    (gf_bread ?b - bread_portion)                  ; bread portion is gluten-free
    (gf_content ?c - content_portion)              ; content portion is gluten-free

    (used_bread ?b - bread_portion)                ; bread portion has been consumed
    (used_content ?c - content_portion)            ; content portion has been consumed

    (allergic ?ch - child)                         ; child is allergic to gluten
    (waiting ?ch - child ?p - place)               ; child is waiting at place
    (served ?ch - child)                           ; child has been served
  )

  ;; Make a gluten-free sandwich: both ingredients must be gluten-free and unused.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not (exists_sandw ?s))
      (not (used_bread ?b))
      (not (used_content ?c))
      (gf_bread ?b)
      (gf_content ?c)
    )
    :effect (and
      (exists_sandw ?s)
      (sandwich_gf ?s)
      (at_sandw ?s kitchen)
      (used_bread ?b)
      (used_content ?c)
    )
  )

  ;; Make a sandwich that contains gluten because the bread is not gluten-free.
  (:action make_sandwich_bread_has_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not (exists_sandw ?s))
      (not (used_bread ?b))
      (not (used_content ?c))
      (not (gf_bread ?b))
    )
    :effect (and
      (exists_sandw ?s)
      (sandwich_gluten ?s)
      (at_sandw ?s kitchen)
      (used_bread ?b)
      (used_content ?c)
    )
  )

  ;; Make a sandwich that contains gluten because the content is not gluten-free.
  (:action make_sandwich_content_has_gluten
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (not (exists_sandw ?s))
      (not (used_bread ?b))
      (not (used_content ?c))
      (not (gf_content ?c))
    )
    :effect (and
      (exists_sandw ?s)
      (sandwich_gluten ?s)
      (at_sandw ?s kitchen)
      (used_bread ?b)
      (used_content ?c)
    )
  )

  ;; Place an existing sandwich at the same place onto a tray at that place.
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

  ;; Move a tray between places; sandwiches remain on the tray (tracked by on_tray).
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

  ;; Serve a gluten-free sandwich to an allergic child.
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
      (not (sandwich_gf ?s))
    )
  )

  ;; Serve any sandwich (gluten-free or not) to a non-allergic child.
  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (not (allergic ?ch))
      (on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?ch ?p)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on_tray ?s ?t))
      (not (exists_sandw ?s))
      (not (sandwich_gf ?s))
      (not (sandwich_gluten ?s))
    )
  )
)