(define (domain lunch-serving)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    staff chef server
    child
    tray
    bread
    filling
    sandwich
    location
  )

  ;; Predicates:
  ;; at-staff: staff member is at a location
  ;; at-tray: tray is at a location
  ;; seated-at: child is seated at a table location
  ;; bread-available, filling-available: ingredient portions available in kitchen
  ;; bread-gf, filling-gf: gluten-free markings on portions
  ;; sandwich-unused: placeholder sandwich has not yet been produced
  ;; sandwich-on-tray: produced sandwich currently on a tray
  ;; sandwich-gf: sandwich is gluten-free (suitable for allergic children)
  ;; child-allergic: child must receive gluten-free sandwich
  ;; served: child has been served a sandwich
  (:predicates
    (at-staff ?p - staff ?loc - location)
    (at-tray ?t - tray ?loc - location)
    (seated-at ?c - child ?loc - location)

    (bread-available ?b - bread)
    (filling-available ?f - filling)

    (bread-gf ?b - bread)
    (filling-gf ?f - filling)

    (sandwich-unused ?s - sandwich)
    (sandwich-on-tray ?s - tray)
    (sandwich-gf ?s - sandwich)

    (child-allergic ?c - child)
    (served ?c - child)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions executed by the chef: create sandwiches on trays.
  ;; Creation consumes a bread and a filling portion from availability,
  ;; marks the sandwich as used (removes sandwich-unused),
  ;; and places the sandwich on a tray at the chef's location (kitchen).
  ;; If the bread used is gluten-free, the sandwich is marked gluten-free.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Chef action: make sandwich when bread is gluten-free
  ; Role: chef
  (:action make-sandwich-bread-gf
    :parameters (?chef - chef ?s - sandwich ?b - bread ?f - filling ?tray - tray ?loc - location)
    :precondition (and
      (at-staff ?chef ?loc)
      (at-tray ?tray ?loc)
      (sandwich-unused ?s)
      (bread-available ?b)
      (filling-available ?f)
      (bread-gf ?b)
    )
    :effect (and
      (not (bread-available ?b))
      (not (filling-available ?f))
      (not (sandwich-unused ?s))
      (sandwich-on-tray ?s ?tray)
      (sandwich-gf ?s)
    )
  )

  ; Chef action: make sandwich when bread is NOT gluten-free
  ; Role: chef
  (:action make-sandwich-bread-not-gf
    :parameters (?chef - chef ?s - sandwich ?b - bread ?f - filling ?tray - tray ?loc - location)
    :precondition (and
      (at-staff ?chef ?loc)
      (at-tray ?tray ?loc)
      (sandwich-unused ?s)
      (bread-available ?b)
      (filling-available ?f)
      (not (bread-gf ?b))
    )
    :effect (and
      (not (bread-available ?b))
      (not (filling-available ?f))
      (not (sandwich-unused ?s))
      (sandwich-on-tray ?s ?tray)
      ;; sandwich-gf is intentionally not added here
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions executed by the server: move trays and serve children.
  ;; Moving a tray updates both the tray location and the server's location.
  ;; Serving consumes the sandwich from the tray and marks the child served.
  ;; Allergy constraint: allergic children can only be served by serve-allergic,
  ;; which requires sandwich-gf on the sandwich being served.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Move a tray from one location to another (server accompanies tray)
  ; Role: server
  (:action move-tray
    :parameters (?server - server ?tray - tray ?from - location ?to - location)
    :precondition (and
      (at-staff ?server ?from)
      (at-tray ?tray ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-staff ?server ?from))
      (at-staff ?server ?to)
      (not (at-tray ?tray ?from))
      (at-tray ?tray ?to)
    )
  )

  ; Serve action for allergic children: requires sandwich to be gluten-free
  ; Role: server
  (:action serve-allergic
    :parameters (?server - server ?sand - sandwich ?tray - tray ?child - child ?loc - location)
    :precondition (and
      (at-staff ?server ?loc)
      (at-tray ?tray ?loc)
      (sandwich-on-tray ?sand ?tray)
      (seated-at ?child ?loc)
      (child-allergic ?child)
      (sandwich-gf ?sand)
      (not (served ?child))
    )
    :effect (and
      (served ?child)
      (not (sandwich-on-tray ?sand ?tray))
    )
  )

  ; Serve action for non-allergic children
  ; Role: server
  (:action serve-nonallergic
    :parameters (?server - server ?sand - sandwich ?tray - tray ?child - child ?loc - location)
    :precondition (and
      (at-staff ?server ?loc)
      (at-tray ?tray ?loc)
      (sandwich-on-tray ?sand ?tray)
      (seated-at ?child ?loc)
      (not (child-allergic ?child))
      (not (served ?child))
    )
    :effect (and
      (served ?child)
      (not (sandwich-on-tray ?sand ?tray))
    )
  )

)