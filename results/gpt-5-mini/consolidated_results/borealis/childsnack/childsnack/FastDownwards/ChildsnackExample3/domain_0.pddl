(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    chef server - agent
    child
    sandwich
    tray
    location
  )

  (:predicates
    ; agent location
    (at ?a - agent ?l - location)

    ; tray location
    (at-tray ?t - tray ?l - location)

    ; child location
    (child-at ?c - child ?l - location)

    ; child dietary constraint
    (requires-no-gluten ?c - child)

    ; sandwich is intended for a particular child
    (sandwich-for ?s - sandwich ?c - child)

    ; sandwich statuses
    (made ?s - sandwich)
    (gluten-free ?s - sandwich)

    ; sandwich is currently on a tray
    (on-tray ?s - sandwich ?t - tray)

    ; child served
    (served ?c - child)
  )

  ; Chef actions: produce sandwiches
  (:action make_sandwich_no_gluten
    :parameters (?chef - chef ?s - sandwich ?c - child)
    :precondition (and
      (at ?chef kitchen)
      (sandwich-for ?s ?c)
      (not (made ?s))
      (requires-no-gluten ?c)
    )
    :effect (and
      (made ?s)
      (gluten-free ?s)
    )
  )

  (:action make_sandwich
    :parameters (?chef - chef ?s - sandwich ?c - child)
    :precondition (and
      (at ?chef kitchen)
      (sandwich-for ?s ?c)
      (not (made ?s))
      (not (requires-no-gluten ?c))
    )
    :effect (and
      (made ?s)
      ; ensure sandwich is not marked gluten-free (no effect needed —
      ; we rely on absence of gluten-free predicate for regular sandwiches)
    )
  )

  ; Chef places prepared sandwiches onto the tray while both are in the kitchen.
  (:action put_on_tray
    :parameters (?chef - chef ?s - sandwich ?t - tray)
    :precondition (and
      (at ?chef kitchen)
      (at-tray ?t kitchen)
      (made ?s)
      (not (on-tray ?s ?t))
    )
    :effect (and
      (on-tray ?s ?t)
      ; keep (made ?s) true so it's clear the sandwich was prepared
    )
  )

  ; Server moves the tray from the kitchen to the table (where children are).
  ; This action moves both the server and the tray together.
  (:action move_tray
    :parameters (?server - server ?t - tray)
    :precondition (and
      (at ?server kitchen)
      (at-tray ?t kitchen)
    )
    :effect (and
      (at ?server table)
      (not (at ?server kitchen))
      (at-tray ?t table)
      (not (at-tray ?t kitchen))
    )
  )

  ; Server serves gluten-free sandwiches to children who require no gluten.
  (:action serve_sandwich_no_gluten
    :parameters (?server - server ?t - tray ?s - sandwich ?c - child)
    :precondition (and
      (at ?server table)
      (child-at ?c table)
      (at-tray ?t table)
      (on-tray ?s ?t)
      (sandwich-for ?s ?c)
      (gluten-free ?s)
      (requires-no-gluten ?c)
    )
    :effect (and
      (served ?c)
      (not (on-tray ?s ?t))
    )
  )

  ; Server serves regular sandwiches to children who do not require no-gluten.
  (:action serve_sandwich
    :parameters (?server - server ?t - tray ?s - sandwich ?c - child)
    :precondition (and
      (at ?server table)
      (child-at ?c table)
      (at-tray ?t table)
      (on-tray ?s ?t)
      (sandwich-for ?s ?c)
      (not (requires-no-gluten ?c))
      (not (gluten-free ?s))
    )
    :effect (and
      (served ?c)
      (not (on-tray ?s ?t))
    )
  )

)