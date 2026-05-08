(define (domain prepare-and-serve-sandwiches)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread content sandwich tray place)

  (:constants kitchen - place)

  (:predicates
    ; resource availability at kitchen
    (bread_available ?b - bread)
    (content_available ?c - content)

    ; gluten markers on raw components
    (bread_gluten_free ?b - bread)
    (content_gluten_free ?c - content)

    ; fixed recipe mapping for each concrete sandwich
    (sandwich_bread ?s - sandwich ?b - bread)
    (sandwich_content ?s - sandwich ?c - content)
    (recipe_requires_no_gluten ?s - sandwich)

    ; sandwich lifecycle and properties
    (sandwich_exists ?s - sandwich)
    (sandwich_gluten_free ?s - sandwich)

    ; sandwich spatial state
    (sandwich_at ?s - sandwich ?p - place)    ; at a place (kitchen or table)
    (sandwich_on_tray ?s - sandwich ?t - tray)

    ; tray state
    (tray_at ?t - tray ?p - place)
    (tray_loaded ?t - tray)

    ; children and serving
    (child_waiting_at ?c - child ?p - place)
    (child_allergic_to_gluten ?c - child)
    (served ?c - child)
  )

  ;; CHEF actions: produce a regular sandwich using a specific bread and content
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (sandwich_bread ?s ?b)
      (sandwich_content ?s ?c)
      (bread_available ?b)
      (content_available ?c)
      (not (recipe_requires_no_gluten ?s))
      (not (sandwich_exists ?s))
    )
    :effect (and
      (sandwich_exists ?s)
      (not (bread_available ?b))
      (not (content_available ?c))
      (sandwich_at ?s kitchen)
    )
  )

  ;; CHEF actions: produce a gluten-free sandwich (requires gluten-free components)
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (sandwich_bread ?s ?b)
      (sandwich_content ?s ?c)
      (bread_available ?b)
      (content_available ?c)
      (recipe_requires_no_gluten ?s)
      (bread_gluten_free ?b)
      (content_gluten_free ?c)
      (not (sandwich_exists ?s))
    )
    :effect (and
      (sandwich_exists ?s)
      (not (bread_available ?b))
      (not (content_available ?c))
      (sandwich_at ?s kitchen)
      (sandwich_gluten_free ?s)
    )
  )

  ;; SERVER action: place an existing sandwich (in kitchen) onto a tray that is at kitchen
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (sandwich_exists ?s)
      (sandwich_at ?s kitchen)
      (tray_at ?t kitchen)
    )
    :effect (and
      (sandwich_on_tray ?s ?t)
      (not (sandwich_at ?s kitchen))
      (tray_loaded ?t)
    )
  )

  ;; SERVER actions: move a loaded tray from kitchen to a table (destination must be a place)
  (:action move_tray_kitchen_to_table
    :parameters (?t - tray ?table - place)
    :precondition (and
      (tray_at ?t kitchen)
      (tray_loaded ?t)
      (not (= ?table kitchen))
    )
    :effect (and
      (not (tray_at ?t kitchen))
      (tray_at ?t ?table)
    )
  )

  ;; SERVER action: move a tray from any table back to the kitchen; returning clears loaded flag
  (:action move_tray_table_to_kitchen
    :parameters (?t - tray ?table - place)
    :precondition (and
      (tray_at ?t ?table)
      (not (= ?table kitchen))
    )
    :effect (and
      (not (tray_at ?t ?table))
      (tray_at ?t kitchen)
      (not (tray_loaded ?t))
    )
  )

  ;; SERVER action: serve a gluten-free sandwich from a tray to a gluten-allergic child waiting at the same place
  (:action serve_sandwich_no_gluten
    :parameters (?c - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (tray_at ?t ?p)
      (child_waiting_at ?c ?p)
      (sandwich_on_tray ?s ?t)
      (sandwich_gluten_free ?s)
      (child_allergic_to_gluten ?c)
      (not (served ?c))
    )
    :effect (and
      (served ?c)
      (not (sandwich_on_tray ?s ?t))
      (sandwich_at ?s ?p)
      (not (child_waiting_at ?c ?p))
    )
  )

  ;; SERVER action: serve a non-gluten-restricted sandwich to a non-allergic child waiting at the same place
  (:action serve_sandwich
    :parameters (?c - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (tray_at ?t ?p)
      (child_waiting_at ?c ?p)
      (sandwich_on_tray ?s ?t)
      (not (child_allergic_to_gluten ?c))
      (not (served ?c))
    )
    :effect (and
      (served ?c)
      (not (sandwich_on_tray ?s ?t))
      (sandwich_at ?s ?p)
      (not (child_waiting_at ?c ?p))
    )
  )
)