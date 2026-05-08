(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at-tray ?t - tray ?p - place)                ; tray location
    (at-kitchen-bread ?b - bread-portion)        ; bread portion available in kitchen
    (at-kitchen-content ?c - content-portion)    ; content portion available in kitchen
    (no-gluten-bread ?b - bread-portion)         ; bread portion marked gluten-free
    (no-gluten-content ?c - content-portion)     ; content portion marked gluten-free
    (notexist ?s - sandwich)                     ; sandwich identifier not yet produced
    (in-kitchen ?s - sandwich)                   ; sandwich currently in kitchen (not on any tray)
    (on-tray ?s - sandwich ?t - tray)            ; sandwich currently on a tray
    (sandwich-no-gluten ?s - sandwich)           ; sandwich is gluten-free
    (allergic-gluten ?ch - child)                ; child is allergic to gluten
    (waiting ?ch - child ?p - place)             ; child is waiting at a place
    (served ?ch - child)                         ; child has been served
  )

  ;; Create a gluten-free sandwich: consumes GF bread and GF content from kitchen,
  ;; produces a sandwich in the kitchen and marks it gluten-free.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at-kitchen-bread ?b)
      (at-kitchen-content ?c)
      (no-gluten-bread ?b)
      (no-gluten-content ?c)
    )
    :effect (and
      (not (at-kitchen-bread ?b))
      (not (at-kitchen-content ?c))
      (not (notexist ?s))
      (in-kitchen ?s)
      (sandwich-no-gluten ?s)
    )
  )

  ;; Create a sandwich when the bread is NOT gluten-free (content may be GF or not).
  ;; This variant prevents accidentally creating a non-marked sandwich from GF bread.
  (:action make_sandwich_bread_not_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at-kitchen-bread ?b)
      (at-kitchen-content ?c)
      (not (no-gluten-bread ?b))
    )
    :effect (and
      (not (at-kitchen-bread ?b))
      (not (at-kitchen-content ?c))
      (not (notexist ?s))
      (in-kitchen ?s)
    )
  )

  ;; Create a sandwich when the content is NOT gluten-free (bread may be GF or not).
  (:action make_sandwich_content_not_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at-kitchen-bread ?b)
      (at-kitchen-content ?c)
      (not (no-gluten-content ?c))
    )
    :effect (and
      (not (at-kitchen-bread ?b))
      (not (at-kitchen-content ?c))
      (not (notexist ?s))
      (in-kitchen ?s)
    )
  )

  ;; Place a sandwich from the kitchen onto a tray that is currently in the kitchen.
  ;; This consumes the kitchen occupancy for the sandwich and marks it on the tray.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (in-kitchen ?s)
      (at-tray ?t kitchen)
    )
    :effect (and
      (not (in-kitchen ?s))
      (on-tray ?s ?t)
    )
  )

  ;; Move a tray from one place to another: updates tray location.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at-tray ?t ?from)
    )
    :effect (and
      (not (at-tray ?t ?from))
      (at-tray ?t ?to)
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child:
  ;; requires child waiting at same place, tray present at that place, sandwich on that tray,
  ;; sandwich marked gluten-free. Serving consumes the sandwich-on-tray and marks child served.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (allergic-gluten ?ch)
      (waiting ?ch ?p)
      (at-tray ?t ?p)
      (on-tray ?s ?t)
      (sandwich-no-gluten ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
    )
  )

  ;; Serve a sandwich to a non-allergic child:
  ;; requires child is NOT allergic, tray present at same place, sandwich on that tray.
  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?t - tray ?p - place)
    :precondition (and
      (not (allergic-gluten ?ch))
      (waiting ?ch ?p)
      (at-tray ?t ?p)
      (on-tray ?s ?t)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
    )
  )

)