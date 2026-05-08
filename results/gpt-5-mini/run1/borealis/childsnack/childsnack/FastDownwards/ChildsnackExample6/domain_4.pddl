(define (domain child-snack)
  (:requirements :typing :negative-preconditions)
  (:types child bread content sandwich tray place)

  (:constants kitchen - place)

  (:predicates
    (bread_available ?b - bread)
    (content_available ?c - content)
    (bread_gluten_free ?b - bread)
    (content_gluten_free ?c - content)

    (sandwich_bread ?s - sandwich ?b - bread)
    (sandwich_content ?s - sandwich ?c - content)
    (sandwich_exists ?s - sandwich)
    (sandwich_gluten_free ?s - sandwich)

    (sandwich_at ?s - sandwich ?p - place)
    (sandwich_on_tray ?s - sandwich ?t - tray)

    (tray_at ?t - tray ?p - place)
    (tray_loaded ?t - tray)

    (child_waiting_at ?c - child ?p - place)
    (child_allergic_to_gluten ?c - child)
    (served ?c - child)
  )

  ;; Create a regular sandwich from a specified bread+content pair.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (sandwich_bread ?s ?b)
      (sandwich_content ?s ?c)
      (bread_available ?b)
      (content_available ?c)
      (not (sandwich_exists ?s))
    )
    :effect (and
      (sandwich_exists ?s)
      (not (bread_available ?b))
      (not (content_available ?c))
      (sandwich_at ?s kitchen)
    )
  )

  ;; Create a gluten-free sandwich (requires both parts to be gluten-free).
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread ?c - content)
    :precondition (and
      (sandwich_bread ?s ?b)
      (sandwich_content ?s ?c)
      (bread_available ?b)
      (content_available ?c)
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

  ;; Place a prepared sandwich from kitchen onto a tray that is at the kitchen.
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

  ;; Move a loaded tray from the kitchen to a place (table).
  (:action move_tray_kitchen_to_place
    :parameters (?t - tray ?p - place)
    :precondition (and
      (tray_at ?t kitchen)
      (tray_loaded ?t)
    )
    :effect (and
      (not (tray_at ?t kitchen))
      (tray_at ?t ?p)
    )
  )

  ;; Move a tray from a place back to the kitchen; this models unloading the tray.
  (:action move_tray_place_to_kitchen
    :parameters (?t - tray ?p - place)
    :precondition (and
      (tray_at ?t ?p)
    )
    :effect (and
      (not (tray_at ?t ?p))
      (tray_at ?t kitchen)
      (not (tray_loaded ?t))
    )
  )

  ;; Serve a gluten-free sandwich to a gluten-allergic child.
  (:action serve_sandwich_no_gluten
    :parameters (?child - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (tray_at ?t ?p)
      (child_waiting_at ?child ?p)
      (sandwich_on_tray ?s ?t)
      (sandwich_gluten_free ?s)
      (child_allergic_to_gluten ?child)
      (not (served ?child))
    )
    :effect (and
      (served ?child)
      (not (sandwich_on_tray ?s ?t))
      (sandwich_at ?s ?p)
      (not (child_waiting_at ?child ?p))
    )
  )

  ;; Serve a sandwich to a child who is not allergic to gluten.
  ;; Note: uses a negative precondition to require the child is NOT marked allergic.
  (:action serve_sandwich
    :parameters (?child - child ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (tray_at ?t ?p)
      (child_waiting_at ?child ?p)
      (sandwich_on_tray ?s ?t)
      (not (child_allergic_to_gluten ?child))
      (not (served ?child))
    )
    :effect (and
      (served ?child)
      (not (sandwich_on_tray ?s ?t))
      (sandwich_at ?s ?p)
      (not (child_waiting_at ?child ?p))
    )
  )
)