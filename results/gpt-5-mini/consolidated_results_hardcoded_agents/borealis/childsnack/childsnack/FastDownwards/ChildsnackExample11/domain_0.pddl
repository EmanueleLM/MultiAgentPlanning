(define (domain sandwich-serving)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types
    location
    kitchen - location
    table - location
    tray
    bread
    content
    sandwich
    child
  )

  (:predicates
    ;; type-identifying predicates (redundant with typing but kept explicit per specification)
    (tray ?t - tray)
    (bread ?b - bread)
    (content ?c - content)
    (sandwich ?s - sandwich)
    (child ?ch - child)

    ;; location predicates
    (at-tray ?t - tray ?loc - location)        ; tray ?t is at location ?loc
    (at-bread ?b - bread ?loc - location)      ; bread portion ?b is at location ?loc
    (at-content ?c - content ?loc - location)  ; content portion ?c is at location ?loc
    (at-sandwich ?s - sandwich ?loc - location) ; sandwich ?s is free/standing at location ?loc
    (at-child ?ch - child ?loc - table)        ; child ?ch is at table ?loc

    ;; availability / resource bookkeeping
    (bread-available ?b - bread)
    (content-available ?c - content)
    (unmade ?s - sandwich)
    (made ?s - sandwich)
    (free-sandwich ?s - sandwich)              ; sandwich is not on any tray (available to place)
    (on-tray ?s - sandwich ?t - tray)          ; sandwich is on tray ?t

    ;; dietary flags
    (sandwich-gluten-free ?s - sandwich)
    (bread-gluten-free ?b - bread)
    (content-gluten-free ?c - content)
    (child-allergic-gluten ?ch - child)

    ;; consumption/consumed markers
    (consumed-bread ?b - bread)
    (consumed-content ?c - content)
    (consumed-sandwich ?s - sandwich)

    ;; final served marker
    (served ?ch - child)
  )

  ;; Actions

  ;; Make a sandwich that is guaranteed gluten-free: requires both ingredients GF.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread ?c - content ?loc - kitchen)
    :precondition (and
      (unmade ?s)
      (bread ?b)
      (content ?c)
      (bread-available ?b)
      (content-available ?c)
      (bread-gluten-free ?b)
      (content-gluten-free ?c)
      (at-bread ?b ?loc)
      (at-content ?c ?loc)
      (= ?loc kitchen)
    )
    :effect (and
      ;; creation bookkeeping
      (made ?s)
      (sandwich ?s)
      (sandwich-gluten-free ?s)
      (at-sandwich ?s ?loc)
      (free-sandwich ?s)
      (not (unmade ?s))

      ;; consume inputs
      (not (bread-available ?b))
      (not (content-available ?c))
      (consumed-bread ?b)
      (consumed-content ?c)
    )
  )

  ;; Make a generic sandwich (does not tag gluten-free). This action is usable with any ingredients.
  ;; If planner wants a gluten-free sandwich it must use make_sandwich_no_gluten instead.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread ?c - content ?loc - kitchen)
    :precondition (and
      (unmade ?s)
      (bread ?b)
      (content ?c)
      (bread-available ?b)
      (content-available ?c)
      (at-bread ?b ?loc)
      (at-content ?c ?loc)
      (= ?loc kitchen)
    )
    :effect (and
      (made ?s)
      (sandwich ?s)
      (at-sandwich ?s ?loc)
      (free-sandwich ?s)
      (not (unmade ?s))

      ;; consume inputs
      (not (bread-available ?b))
      (not (content-available ?c))
      (consumed-bread ?b)
      (consumed-content ?c)
    )
  )

  ;; Put a made, free sandwich onto a co-located tray.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?loc - location)
    :precondition (and
      (made ?s)
      (sandwich ?s)
      (tray ?t)
      (at-tray ?t ?loc)
      (at-sandwich ?s ?loc)
      (free-sandwich ?s)
    )
    :effect (and
      (on-tray ?s ?t)
      (not (at-sandwich ?s ?loc))
      (not (free-sandwich ?s))
    )
  )

  ;; Move a tray (and implicitly all sandwiches on it) from one location to another.
  (:action move_tray
    :parameters (?t - tray ?from - location ?to - location)
    :precondition (and
      (tray ?t)
      (at-tray ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (at-tray ?t ?to)
      (not (at-tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to a child who is allergic to gluten.
  (:action serve_sandwich_no_gluten
    :parameters (?ch - child ?s - sandwich ?t - tray ?table - table)
    :precondition (and
      (child ?ch)
      (child-allergic-gluten ?ch)
      (at-child ?ch ?table)
      (tray ?t)
      (at-tray ?t ?table)
      (on-tray ?s ?t)
      (sandwich-gluten-free ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (consumed-sandwich ?s)
      (not (on-tray ?s ?t))
      (not (made ?s))
      (not (sandwich ?s))
      (not (sandwich-gluten-free ?s))
    )
  )

  ;; Serve any sandwich to a non-allergic child.
  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?t - tray ?table - table)
    :precondition (and
      (child ?ch)
      (not (child-allergic-gluten ?ch))
      (at-child ?ch ?table)
      (tray ?t)
      (at-tray ?t ?table)
      (on-tray ?s ?t)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (consumed-sandwich ?s)
      (not (on-tray ?s ?t))
      (not (made ?s))
      (not (sandwich ?s))
      (not (sandwich-gluten-free ?s))
    )
  )

)