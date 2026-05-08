(define (domain sandwich-serving)
  (:requirements :typing :strips :negative-preconditions)
  (:types bread content sandwich tray table child)

  (:predicates
    ;; Bread / content properties and availability
    (bread-gf ?b - bread)
    (content-gf ?c - content)
    (bread-available ?b - bread)
    (content-available ?c - content)
    (at-bread ?b - bread ?loc - table)
    (at-content ?c - content ?loc - table)

    ;; Sandwich pool and lifecycle
    (sandwich-unused ?s - sandwich)      ;; available placeholder not yet created
    (sandwich-exists ?s - sandwich)      ;; created and available for assignment/putting
    (sandwich-gf ?s - sandwich)          ;; sandwich is gluten-free
    (assigned-for ?s - sandwich ?ch - child) ;; sandwich reserved for a child

    ;; Tray and placement
    (tray-at ?tr - tray ?loc - table)
    (tray-assigned ?tr - tray ?tab - table) ;; predeclared intended destination for the run
    (sandwich-on-tray ?s - sandwich ?tr - tray)
    (sandwich-on-any ?s - sandwich)     ;; helper: true if sandwich is on some tray

    ;; Serving and consumption
    (sandwich-served ?s - sandwich)
    (served ?ch - child)

    ;; Children and allergy/location info
    (child-at ?ch - child ?tab - table)
    (allergic ?ch - child)
  )

  ;; Chef actions: create sandwiches from bread+content and assign them to specific children.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread ?c - content ?ch - child)
    :precondition (and
      (sandwich-unused ?s)
      (bread-available ?b)
      (content-available ?c)
      (bread-gf ?b)
      (content-gf ?c)
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (child-at ?ch ?loc)    ;; child exists and is waiting somewhere (binding ensures child known)
      (not (served ?ch))
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
    :parameters (?s - sandwich ?b - bread ?c - content ?ch - child)
    :precondition (and
      (sandwich-unused ?s)
      (bread-available ?b)
      (content-available ?c)
      ;; This action models creation of non-gluten sandwiches only (per chef/server constraints).
      (not (bread-gf ?b))
      (not (content-gf ?c))
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (child-at ?ch ?loc)
      (not (served ?ch))
    )
    :effect (and
      (not (sandwich-unused ?s))
      (sandwich-exists ?s)
      ;; do not add sandwich-gf here (non-gf sandwich)
      (assigned-for ?s ?ch)
      (not (bread-available ?b))
      (not (content-available ?c))
    )
  )

  ;; Server action: put a created sandwich onto a tray while in the kitchen.
  (:action put_on_tray
    :parameters (?s - sandwich ?tr - tray ?ch - child ?tab - table)
    :precondition (and
      (sandwich-exists ?s)
      (assigned-for ?s ?ch)
      (child-at ?ch ?tab)
      (tray-at ?tr kitchen)
      (tray-assigned ?tr ?tab)     ;; ensure sandwich is being put on the tray assigned to the child's table
      (not (sandwich-on-any ?s))   ;; sandwich is not already on a tray
      (not (sandwich-served ?s))
    )
    :effect (and
      (sandwich-on-tray ?s ?tr)
      (sandwich-on-any ?s)
    )
  )

  ;; Movement actions: move each tray from kitchen to its assigned table.
  ;; These are specified per-tray to enforce that the exact set of sandwiches intended
  ;; for the table are already loaded before the tray can be moved.

  ;; tray1 -> table1 (must carry sandwiches for child2, child4, child5, child6)
  (:action move_tray_tray1_to_table1
    :parameters ()
    :precondition (and
      (tray-at tray1 kitchen)
      ;; explicit required sandwiches on tray1 for the children at table1:
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

  ;; tray2 -> table3 (must carry sandwiches for child1, child3, child7)
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

  ;; tray3 -> table2 (must carry sandwiches for child8, child9)
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

  ;; Serving actions: two flavors per specification.
  ;; serve_sandwich_no_gluten: requires sandwich to be gluten-free.
  (:action serve_sandwich_no_gluten
    :parameters (?ch - child ?s - sandwich ?tr - tray ?tab - table)
    :precondition (and
      (child-at ?ch ?tab)
      (tray-at ?tr ?tab)
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
      (not (sandwich-on-any ?s))
      (not (sandwich-exists ?s))
    )
  )

  ;; serve_sandwich: for non-allergic children (or any child who isn't allergic)
  (:action serve_sandwich
    :parameters (?ch - child ?s - sandwich ?tr - tray ?tab - table)
    :precondition (and
      (child-at ?ch ?tab)
      (tray-at ?tr ?tab)
      (sandwich-on-tray ?s ?tr)
      (assigned-for ?s ?ch)
      (sandwich-exists ?s)
      (not (allergic ?ch))      ;; only usable for non-allergic children
      (not (served ?ch))
      (not (sandwich-served ?s))
    )
    :effect (and
      (served ?ch)
      (sandwich-served ?s)
      (not (sandwich-on-tray ?s ?tr))
      (not (sandwich-on-any ?s))
      (not (sandwich-exists ?s))
    )
  )
)