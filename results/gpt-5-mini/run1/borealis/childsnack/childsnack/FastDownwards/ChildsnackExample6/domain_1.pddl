(define (domain prepare-and-serve-sandwiches)
  (:requirements :strips :typing :negative-preconditions)
  (:types bread content sandwich tray child place)

  (:constants kitchen - place)

  (:predicates
    ; resource availability
    (bread_available ?b - bread)
    (content_available ?c - content)

    ; gluten markers on raw components
    (bread_gluten_free ?b - bread)
    (content_gluten_free ?c - content)

    ; recipe mapping for each concrete sandwich
    (sandwich_bread ?s - sandwich ?b - bread)
    (sandwich_content ?s - sandwich ?c - content)
    (recipe_requires_no_gluten ?s - sandwich)

    ; sandwich lifecycle
    (sandwich_exists ?s - sandwich)          ; sandwich has been created (consumes bread + content)
    (sandwich_gluten_free ?s - sandwich)    ; set only by the no-gluten make action

    ; sandwich spatial state:
    (sandwich_at ?s - sandwich ?p - place)  ; sandwich is at kitchen or a table
    (sandwich_on_tray ?s - sandwich ?t - tray) ; sandwich is on a tray

    ; tray state
    (tray_at ?t - tray ?p - place)
    (tray_loaded ?t - tray) ; set true by placing any sandwich on the tray in the kitchen

    ; children
    (child_waiting_at ?c - child ?p - place)
    (child_allergic_to_gluten ?c - child)
    (served ?c - child)
  )

  ; CHEF actions: produce sandwiches (regular)
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

  ; CHEF actions: produce gluten-free sandwich (requires gluten-free components)
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

  ; SERVER actions: put sandwich onto a tray (must be in kitchen)
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

  ; SERVER actions: move tray from kitchen to a table; require the tray be loaded
  (:action move_tray_kitchen_to_table
    :parameters (?t - tray ?table - place)
    :precondition (and
      (tray_at ?t kitchen)
      (tray_loaded ?t)
    )
    :effect (and
      (not (tray_at ?t kitchen))
      (tray_at ?t ?table)
    )
  )

  ; SERVER actions: move tray from a table back to the kitchen (unloads)
  (:action move_tray_table_to_kitchen
    :parameters (?t - tray ?table - place)
    :precondition (and
      (tray_at ?t ?table)
    )
    :effect (and
      (not (tray_at ?t ?table))
      (tray_at ?t kitchen)
      (not (tray_loaded ?t))
    )
  )

  ; SERVER actions: serve gluten-free sandwich to an allergic child
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

  ; SERVER actions: serve non-gluten sandwich to non-allergic child
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