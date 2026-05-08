(define (domain child-snack)
  (:requirements :typing :strips :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)

  (:constants kitchen - place)

  (:predicates
    ;; ingredient availability and properties
    (bread-available ?b - bread-portion)
    (content-available ?c - content-portion)
    (bread-gf ?b - bread-portion)
    (content-gf ?c - content-portion)

    ;; sandwich lifecycle and properties
    (sandwich-unused ?s - sandwich)    ;; placeholder not yet created
    (sandwich-exists ?s - sandwich)    ;; created and available (may later be put on tray)
    (sandwich-gf ?s - sandwich)        ;; sandwich is gluten-free
    (assigned-for ?s - sandwich ?ch - child) ;; sandwich reserved for a child
    (sandwich-on-tray ?s - sandwich ?tr - tray)
    (sandwich-served ?s - sandwich)

    ;; trays and locations
    (tray-at ?tr - tray ?p - place)

    ;; children, waiting and allergy info, served marker
    (waiting ?ch - child ?p - place)
    (allergic-gluten ?ch - child)
    (served ?ch - child)
  )

  ;; Chef actions: create sandwiches, consuming one bread and one content portion.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?ch - child)
    :precondition (and
      (sandwich-unused ?s)
      (bread-available ?b)
      (content-available ?c)
      (bread-gf ?b)
      (content-gf ?c)
      (waiting ?ch ?p)            ;; ensure the child exists and is waiting somewhere
      (not (served ?ch))          ;; do not create for already served child
    )
    :effect (and
      (not (sandwich-unused ?s))
      (sandwich-exists ?s)
      (sandwich-gf ?s)
      (assigned-for ?s ?ch)
      (not (bread-available ?b))
      (not (content-available ?c))
    )
  )

  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?ch - child)
    :precondition (and
      (sandwich-unused ?s)
      (bread-available ?b)
      (content-available ?c)
      (not (bread-gf ?b))
      (not (content-gf ?c))
      (waiting ?ch ?p)
      (not (served ?ch))
    )
    :effect (and
      (not (sandwich-unused ?s))
      (sandwich-exists ?s)
      (assigned-for ?s ?ch)
      (not (bread-available ?b))
      (not (content-available ?c))
    )
  )

  ;; Server action: place a created sandwich onto a tray while the tray is in the kitchen.
  (:action put_on_tray
    :parameters (?s - sandwich ?tr - tray ?ch - child ?p - place)
    :precondition (and
      (sandwich-exists ?s)
      (assigned-for ?s ?ch)
      (waiting ?ch ?p)
      (tray-at ?tr kitchen)
      (not (sandwich-served ?s))
      (not (sandwich-on-tray ?s ?tr))
    )
    :effect (and
      (sandwich-on-tray ?s ?tr)
      ;; sandwich still exists until it is served; no deletion of sandwich-exists here
    )
  )

  ;; Explicit move actions (hard constraints): require the exact set of sandwiches
  ;; that must be carried on each tray before that tray may leave the kitchen.
  (:action move_tray_tray1_to_table1
    :parameters ()
    :precondition (and
      (tray-at tray1 kitchen)
      (sandwich-on-tray sandw2 tray1)
      (sandwich-on-tray sandw5 tray1)
      (sandwich-on-tray sandw6 tray1)
      (sandwich-on-tray sandw7 tray1)
    )
    :effect (and
      (not (tray-at tray1 kitchen))
      (tray-at tray1 table1)
    )
  )

  (:action move_tray_tray2_to_table3
    :parameters ()
    :precondition (and
      (tray-at tray2 kitchen)
      (sandwich-on-tray sandw4 tray2)
      (sandwich-on-tray sandw3 tray2)
      (sandwich-on-tray sandw8 tray2)
    )
    :effect (and
      (not (tray-at tray2 kitchen))
      (tray-at tray2 table3)
    )
  )

  (:action move_tray_tray3_to_table2
    :parameters ()
    :precondition (and
      (tray-at tray3 kitchen)
      (sandwich-on-tray sandw9 tray3)
      (sandwich-on-tray sandw1 tray3)
    )
    :effect (and
      (not (tray-at tray3 kitchen))
      (tray-at tray3 table2)
    )
  )

  ;; Serving actions.
  (:action serve_sandwich_no_gluten
    :parameters (?ch - child ?s - sandwich ?tr - tray ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (tray-at ?tr ?p)
      (sandwich-on-tray ?s ?tr)
      (assigned-for ?s ?ch)
      (sandwich-exists ?s)
      (sandwich-gf ?s)
      (not (served ?ch))
      (not (sandwich-served ?s))
    )
    :effect (and
      (served ?ch)
      (sandwich-served ?s)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
    )
  )

  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?tr - tray ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (tray-at ?tr ?p)
      (sandwich-on-tray ?s ?tr)
      (assigned-for ?s ?ch)
      (sandwich-exists ?s)
      (not (allergic-gluten ?ch))
      (not (served ?ch))
      (not (sandwich-served ?s))
    )
    :effect (and
      (served ?ch)
      (sandwich-served ?s)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-exists ?s))
    )
  )
)