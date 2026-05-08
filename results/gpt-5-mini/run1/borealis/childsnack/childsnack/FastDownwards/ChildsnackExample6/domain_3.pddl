(define (domain prepare-and-serve-sandwiches)
  (:requirements :typing :negative-preconditions)
  (:types child bread content sandwich tray place table - place)

  (:predicates
    (bread_available ?b - bread)
    (content_available ?c - content)
    (bread_gluten_free ?b - bread)
    (content_gluten_free ?c - content)
    (sandwich_bread ?s - sandwich ?b - bread)
    (sandwich_content ?s - sandwich ?c - content)
    (recipe_requires_no_gluten ?s - sandwich)
    (sandwich_exists ?s - sandwich)
    (sandwich_gluten_free ?s - sandwich)
    (sandwich_at ?s - sandwich ?p - place)
    (sandwich_on_tray ?s - sandwich ?t - tray)
    (tray_at ?t - tray ?p - place)
    (tray_loaded ?t - tray)
    (child_waiting_at ?c - child ?p - table)
    (child_allergic_to_gluten ?c - child)
    (served ?c - child)
  )

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

  (:action move_tray_kitchen_to_table
    :parameters (?t - tray ?table - table)
    :precondition (and
      (tray_at ?t kitchen)
      (tray_loaded ?t)
    )
    :effect (and
      (not (tray_at ?t kitchen))
      (tray_at ?t ?table)
    )
  )

  (:action move_tray_table_to_kitchen
    :parameters (?t - tray ?table - table)
    :precondition (and
      (tray_at ?t ?table)
    )
    :effect (and
      (not (tray_at ?t ?table))
      (tray_at ?t kitchen)
      (not (tray_loaded ?t))
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?c - child ?s - sandwich ?t - tray ?p - table)
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

  (:action serve_sandwich
    :parameters (?c - child ?s - sandwich ?t - tray ?p - table)
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